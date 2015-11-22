Attribute VB_Name = "modTextDBEngine"
Option Explicit
''*************************************************************************
''
'' Coded by Dale Pitman
''

Private Const FILE_BEGIN As Long = 0
Private Const FILE_END As Long = 2
Private Const GENERIC_READ_WRITE As Long = &HC0000000
Private Const FILE_SHARE_READ_WRITE As Long = &H3
Private Const OPEN_EXISTING As Long = 3
Private Const FILE_ATTRIBUTE_NORMAL As Long = &H80

Private Type SECURITY_ATTRIBUTES
    nLength As Long
    lpSecurityDescriptor As Long
    bInheritHandle As Long
End Type

Private Declare Function CreateFile Lib "kernel32" Alias "CreateFileA" (ByVal lpFileName As String, ByVal dwDesiredAccess As Long, ByVal dwShareMode As Long, lpSecurityAttributes As SECURITY_ATTRIBUTES, ByVal dwCreationDisposition As Long, ByVal dwFlagsAndAttributes As Long, ByVal hTemplateFile As Long) As Long

Private Declare Function SetFilePointer Lib "kernel32" (ByVal hFile As Long, ByVal lDistanceToMove As Long, lpDistanceToMoveHigh As Long, ByVal dwMoveMethod As Long) As Long
Private Declare Function SetEndOfFile Lib "kernel32" (ByVal hFile As Long) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long

''
'' FileID storage
''
Public gFileIDBase As Long
Private gFileHandle As Long
Private gDatabasePath As String

Public Type ArticleType
    ArticleID As Long
    GroupID As Long
    FileIndex As Integer ' 10 bytes
End Type

Public Const cFileGroupSize As Long = 100
Private Const cFileCacheSize As Long = 100

Private m_CacheGroup(205) As ArticleType

'' Get the storage location of the text database and open it
Public Sub InitFileStorage()
    On Error GoTo ignore
    gFileIDBase = Val(GetServerSetting("FileIDBase", False))
    
    gDatabasePath = FRMOptions.Database
    
    gFileHandle = FreeFile
    Open gDatabasePath & "FileID.txt" For Binary As #gFileHandle
    If Dir$(gDatabasePath & "ext\", vbDirectory) = "" Then
        MkDir (gDatabasePath & "ext\")
    End If
ignore:
End Sub

'' Close file handle associated with the text database
Public Sub CloseFileStorage()
    Close #gFileHandle
End Sub

'' Compress free space at the start of the file and update starting fileid for first entry in file
Public Sub CompactDB()
    Dim rstemp As Recordset
    Dim NewBase As Long
    Dim LastRec As Long
    Dim FirstRec As Long
    Dim NewStart As Long
    Dim CopyBuffer(1023) As Byte
    Dim FirstBase As Long
    Dim i As Long
    
    Call OpenRecordset(rstemp, "SELECT TOP 1  UID FROM [File] ORDER BY UID ASC", dbOpenSnapshot)
    NewBase = rstemp!UID
    FirstBase = NewBase
    FirstRec = 1 + (NewBase - gFileIDBase) * 10 * cFileGroupSize
    Call OpenRecordset(rstemp, "SELECT TOP 1 UID FROM [File] ORDER BY UID DESC", dbOpenSnapshot)
    NewBase = rstemp!UID - 2
    If 1 + (NewBase - gFileIDBase) * 10# * cFileGroupSize > 2 ^ 31 Then
        LastRec = 2 ^ 31 - 1
    Else
        LastRec = 1 + (NewBase - gFileIDBase) * 10# * cFileGroupSize
    End If
    
    NewStart = 1
    Do While FirstRec < LastRec
        Get #gFileHandle, FirstRec, CopyBuffer
        Put #gFileHandle, NewStart, CopyBuffer
        FirstRec = FirstRec + 1024
        NewStart = NewStart + 1024
    Loop
    
    
    Call SetServerSetting("FileIDBase", CStr(FirstBase))
    gFileIDBase = FirstBase
    
    ' Clear all old data
    Close #gFileHandle
    Call TruncateFile(gDatabasePath & "FileID.txt", NewStart)
    Call InitFileStorage
'    For i = 0 To 1023
'        CopyBuffer(i) = 0
'    Next
'    Do While NewStart < (2 * 1024# * 1024# * 1024#) - 1024
'        Put #gFileHandle, NewStart, CopyBuffer
'        'FirstRec = FirstRec + 1024
'        NewStart = NewStart + 1024
'    Loop
    'LOF(gFileHandle) = NewStart

End Sub

'' Get all article ids for a given fileid
Public Sub GetAllArticlesByFileID(pfileID As Long, ids() As ArticleType)
    Dim FirstRec As Long
    Dim i As Long
    Dim ExtentID As Long
    
    Dim tempArticles(4000) As ArticleType
    Dim tempArticlesMax As Long
    
    FirstRec = 1 + (pfileID - gFileIDBase) * 10 * cFileGroupSize
    
    Get #gFileHandle, FirstRec + i * 10, tempArticles(tempArticlesMax) '.ArticleID,GroupID,FileIndex

'    tempArticlesMax = tempArticlesMax + 1
    Do While tempArticles(tempArticlesMax).ArticleID <> 0 And i < cFileGroupSize - 1
        tempArticlesMax = tempArticlesMax + 1
        i = i + 1
        Get #gFileHandle, FirstRec + i * 10, tempArticles(tempArticlesMax) '.ArticleID,GroupID,FileIndex
        
    Loop
    
    If i = cFileGroupSize - 1 Then
        ' Read ext
        ExtentID = FreeFile
        If Dir(gDatabasePath & "ext\" & pfileID & ".exd", vbNormal) <> "" Then
            Open gDatabasePath & "ext\" & pfileID & ".exd" For Binary As #ExtentID
            i = 0
            Get #ExtentID, 1 + i * 10, tempArticles(tempArticlesMax) '.ArticleID,GroupID,FileIndex
            
            Do While tempArticles(tempArticlesMax).ArticleID <> 0
                tempArticlesMax = tempArticlesMax + 1
                i = i + 1
                Get #ExtentID, 1 + i * 10, tempArticles(tempArticlesMax) '.ArticleID,GroupID,FileIndex
            Loop
            Close #ExtentID
        End If
    End If
    
    ' Copy Array
    If tempArticlesMax = 0 Then
        tempArticlesMax = 1
    End If
    ReDim ids(tempArticlesMax - 1) As ArticleType
    For i = 0 To tempArticlesMax - 1
        ids(i) = tempArticles(i) '.ArticleID,GroupID,FileIndex
    Next
End Sub

'' Add/update the article id associated with a fileid
Public Sub UpdateFileIDs(pfileID As Long, pArticleID As Long, pGroupID As Long, pFileIndex As Integer)
    Static ExtendID As Long
    Static FirstRec As Long
    Static ArticleID As Long
    Static i As Long
    Static t As Long
    
    Static FreeFileCache(cFileCacheSize, 2) As Long
    Static FreeFileCachePos As Long
    Static FoundCache As Boolean
    
    Static WriteBuffer As ArticleType
    
    If (pfileID - gFileIDBase) > 0 Then
        'If (pfileID - gFileIDBase) >= 1047556 Then
        '    Call CompactDB
        'End If
        FirstRec = 1 + (pfileID - gFileIDBase) * 10 * cFileGroupSize
        
        i = 0
        FoundCache = False
        For t = 0 To cFileCacheSize
            If FreeFileCache(t, 0) = pfileID Then
                i = FreeFileCache(t, 1)
                FoundCache = True
                Exit For
            End If
        Next
        
        'Get #gFileHandle, FirstRec, m_CacheGroup
        
        ' Locate next free block
        Get #gFileHandle, FirstRec + i * 10, ArticleID
        'ArticleID = m_CacheGroup(0).ArticleID
        Do While ArticleID > 0 And ArticleID <> pArticleID And i < cFileGroupSize - 1
            i = i + 1
            'ArticleID = m_CacheGroup(i).ArticleID
            Get #gFileHandle, FirstRec + i * 10, ArticleID
        Loop
        If FoundCache = False Then
            If FreeFileCachePos = cFileCacheSize + 1 Then
                FreeFileCachePos = 0
            End If
            FreeFileCache(FreeFileCachePos, 0) = pfileID
            FreeFileCache(FreeFileCachePos, 1) = i
            FreeFileCachePos = FreeFileCachePos + 1
        Else
            FreeFileCache(t, 0) = pfileID
            FreeFileCache(t, 1) = i
        End If
        
        
        WriteBuffer.ArticleID = pArticleID
        WriteBuffer.GroupID = pGroupID
        WriteBuffer.FileIndex = pFileIndex
        If i < cFileGroupSize - 1 And ArticleID = 0 Then
            
            Put #gFileHandle, FirstRec + i * 10, WriteBuffer 'pArticleID,pGroupID,pFileIndex
        Else
            If i = cFileGroupSize - 1 Then
                ' Add article id to extend file
                ExtendID = FreeFile
                Open gDatabasePath & "ext\" & pfileID & ".exd" For Binary As #ExtendID
                i = 0
                Get #ExtendID, 1 + i * 10, ArticleID
                Do While ArticleID <> 0 And ArticleID <> pArticleID And i < 500
                    i = i + 1
                    Get #ExtendID, 1 + i * 10, ArticleID
                Loop
                Put #ExtendID, 1 + i * 10, WriteBuffer
                Close #ExtendID
            End If
        End If
        
    End If
End Sub


Private Function TruncateFile(ByVal FileName As String, ByVal FileSize As Long) As Boolean
    Dim SA As SECURITY_ATTRIBUTES, FHandle As Long, Ret As Long
    
    FHandle = CreateFile(FileName, GENERIC_READ_WRITE, FILE_SHARE_READ_WRITE, _
        SA, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0)
    
    If FHandle <> -1 Then
        Ret = SetFilePointer(FHandle, FileSize, ByVal 0, FILE_BEGIN)
        
        If Ret <> -1 Then
            TruncateFile = SetEndOfFile(FHandle) <> 0
        End If
        
        CloseHandle FHandle
    End If
End Function



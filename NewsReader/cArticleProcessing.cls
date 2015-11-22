VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cArticleProcessing"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
''*************************************************************************
''
'' Coded by Dale Pitman
''

'' Article name processing here, this class attempts to recongise the numerious and inconstant way
'' files are named by different people

Private m_TotalArticles As Long
Private m_ArticleNumber As Long

Private m_TotalFiles As Long
Private m_FileNumber As Long

Private m_CDNumber As Long

Private m_FileName As String
Private m_GroupName As String

Private m_mp3Mode As Boolean


Public Property Let Mp3Mode(pValue As Boolean)
    m_mp3Mode = pValue
End Property

Public Property Get TotalArticles() As Long
    TotalArticles = m_TotalArticles
End Property

Public Property Get ArticleNumber() As Long
    ArticleNumber = m_ArticleNumber
End Property

Public Property Get TotalFiles() As Long
    TotalFiles = m_TotalFiles
End Property
Public Property Get FileNumber() As Long
    FileNumber = m_FileNumber
End Property
Public Property Get FileName() As String
    FileName = m_FileName
End Property
Public Property Get GroupName() As String
    GroupName = m_GroupName
End Property

Private Function SubString(pString As String, pStart As Long, pEnd As Long) As String
    SubString = Mid$(pString, pStart, pEnd - pStart)
End Function

Private Function IsNumber(pString As String) As Boolean
    Dim i As Long
    Dim char As Long
    
    IsNumber = True
    For i = 1 To Len(pString)
        char = Asc(Mid$(pString, i, 1))
        If char < 48 Or char > 57 Or char = 46 Then
            IsNumber = False
            Exit For
        End If
    Next
End Function

Private Function IsCharNumber(pChar As Long) As Boolean
    If pChar < 48 Or pChar > 59 Then
        IsCharNumber = False
    Else
        IsCharNumber = True
    End If
End Function


Private Function RemoveFileSystemChars(pString As String) As String
    Dim Tempstring As String
    Dim TempString2 As String
    Dim a As String
    Dim i As Long
    Dim char As String
    
    Tempstring = Replace(Tempstring, "_", " ")
    Tempstring = Replace(pString, "!", "")
    Tempstring = Replace(Tempstring, Chr$(34), "")
    Tempstring = Replace(Tempstring, "/", "")
    Tempstring = Replace(Tempstring, "\", "")
    Tempstring = Replace(Tempstring, "#", "")
    Tempstring = Replace(Tempstring, ":", "")
    Tempstring = Replace(Tempstring, "<", "")
    Tempstring = Replace(Tempstring, ">", "")
    Tempstring = Replace(Tempstring, "*", "")
    Tempstring = Replace(Tempstring, "?", "")
    Tempstring = Replace(Tempstring, "=", "")
    Tempstring = Replace(Tempstring, "|", "")
    Tempstring = Replace(Tempstring, vbCr, "")
    Tempstring = Replace(Tempstring, vbLf, "")
    Tempstring = Replace(Tempstring, "&", "")
    
    TempString2 = ""
    For i = 1 To Len(Tempstring)
        char = Mid$(Tempstring, i, 1)
        If Asc(char) < 20 Then
        Else
            TempString2 = TempString2 & char
        End If
    Next
    Tempstring = TempString2
    
    RemoveFileSystemChars = Tempstring
End Function

Private Function IsArticleIndex(pStart As Long, pEnd As Long, pString As String, ByRef pSlashPos As Long) As Boolean
    Dim i As Long
    Dim char As Long
    IsArticleIndex = True
    
    pStart = pStart + 1
    pEnd = pEnd - 1
    pSlashPos = 0
    
    For i = pStart To pEnd
        char = Asc(Mid$(pString, i, 1))
        If char = Asc("/") Then
            If pSlashPos = 0 Then
                pSlashPos = i - pStart
            Else
                ' Invalid string
                IsArticleIndex = False
                Exit For
            End If
        Else
            If char = Asc("\") Then
                If pSlashPos = 0 Then
                    pSlashPos = i - pStart
                Else
                    ' Invalid string
                    IsArticleIndex = False
                    Exit For
                End If
            Else
                If IsCharNumber(char) = False Then
                    ' Invalid string
                    IsArticleIndex = False
                    Exit For
                End If
            End If
        End If
    Next
    
    If pSlashPos = 0 Then
        IsArticleIndex = False
    End If
End Function

Private Function LocateBrackets(pString As String, pLeft As String, pRight As String, ByRef pLeftBracket As Long, ByRef pRightBracket As Long, pSlashPos As Long) As Boolean
    Dim i As Long
    Dim char As String
    Dim SlashPos As Long
    
    pLeftBracket = 0
    For i = Len(pString) To 1 Step -1
        char = Mid$(pString, i, 1)
        If char = pRight Then
            pRightBracket = i
        End If
        
        If pRightBracket > 0 Then
            If char = pLeft Then
                pLeftBracket = i
                If IsArticleIndex(pLeftBracket, pRightBracket, pString, pSlashPos) = True Then
                    ' Found!
                    Exit For
                Else
                    ' Failed
                    pLeftBracket = 0
                    pRightBracket = 0
                End If
            End If
        End If
    Next

End Function

Private Function GetArticleIndex(psubject As String, ByRef pLeftBracketPos As Long, ByRef pRightBracketPos As Long, pArticleNumber As Long, pTotalArticles As Long, pAlternateBrackets As Boolean) As Boolean
    Dim LeftBracket As Long
    Dim RightBracket As Long
    Dim SlashPos As Long
    Dim i As Long
    
    pArticleNumber = -1
    pTotalArticles = 0
    GetArticleIndex = False
    LeftBracket = 0
    RightBracket = 0
    
    Call LocateBrackets(psubject, "(", ")", LeftBracket, RightBracket, SlashPos)

    If LeftBracket > 0 And RightBracket > 0 Then
        pArticleNumber = Mid$(psubject, LeftBracket, SlashPos)
        pTotalArticles = Mid$(psubject, LeftBracket + SlashPos + 1, RightBracket - (LeftBracket + SlashPos))
        If pArticleNumber = -1 Or pTotalArticles = 0 Then
        Else
            GetArticleIndex = True
        End If
    Else
    
        Call LocateBrackets(psubject, "[", "]", LeftBracket, RightBracket, SlashPos)
        
        If LeftBracket > 0 And RightBracket > 0 Then
            pArticleNumber = Mid$(psubject, LeftBracket, SlashPos)
            If RightBracket - (LeftBracket + SlashPos) > 0 Then
                pTotalArticles = Mid$(psubject, LeftBracket + SlashPos + 1, RightBracket - (LeftBracket + SlashPos))
                If pArticleNumber = -1 Or pTotalArticles = 0 Then
                Else
                    GetArticleIndex = True
                End If
            End If
        Else
            If pAlternateBrackets = True Then
                Call LocateBrackets(psubject, "(", "]", LeftBracket, RightBracket, SlashPos)
                
                If LeftBracket > 0 And RightBracket > 0 Then
                    pArticleNumber = Mid$(psubject, LeftBracket, SlashPos)
                    pTotalArticles = Mid$(psubject, LeftBracket + SlashPos + 1, RightBracket - (LeftBracket + SlashPos))
                    If pArticleNumber = -1 Or pTotalArticles = 0 Then
                    Else
                        GetArticleIndex = True
                    End If
                Else
                    Call LocateBrackets(psubject, "<", ">", LeftBracket, RightBracket, SlashPos)
                    
                    If LeftBracket > 0 And RightBracket > 0 Then
                        pArticleNumber = Mid$(psubject, LeftBracket, SlashPos)
                        pTotalArticles = Mid$(psubject, LeftBracket + SlashPos + 1, RightBracket - (LeftBracket + SlashPos))
                        If pArticleNumber = -1 Or pTotalArticles = 0 Then
                        Else
                            GetArticleIndex = True
                        End If
                    End If
                End If
            End If
        
        End If
    End If

    pLeftBracketPos = LeftBracket
    pRightBracketPos = RightBracket
End Function

Private Function GetNofN(pString As String, ByRef pFileNumber As Long, ByRef pTotalFiles As Long, pReplaceString As String) As Boolean
    Dim i As Long
    Dim Char4 As String
    Dim NumberStart As Long
    Dim NumberLen As Long
    Dim LeftStart As Long
    Dim Tempstring As String
    GetNofN = False
    pFileNumber = 0
    pTotalFiles = 0
    
    Tempstring = UCase$(pString)
    
    Dim Continue As Boolean
    Dim FoundLeftNum As Boolean
    Dim FoundRightNum As Boolean
    For i = 1 To Len(pString)
        
        FoundLeftNum = False
        FoundRightNum = False
        Char4 = Mid$(Tempstring, i, 4)
        If Left$(Char4, 2) = "OF" Then
        
            ' Looks like 00of00
            NumberStart = i - 1
            NumberLen = 1
            FoundLeftNum = False
            Continue = True
            Do While (NumberStart > 1 And NumberStart < Len(pString) And Continue = True)
                Continue = False
                If IsNumber(Mid$(pString, NumberStart, 1)) = True Then
                    Continue = True
                    FoundLeftNum = True
                End If
                If Mid$(pString, NumberStart, 1) = " " And FoundLeftNum = False Then
                    Continue = True
                End If
                
                If FoundLeftNum = False Or Continue = True Then
                    NumberStart = NumberStart - 1
                    NumberLen = NumberLen + 1
                End If
            Loop
            If FoundLeftNum = True Then
                pFileNumber = Mid$(pString, NumberStart + 1, NumberLen - 1)
                LeftStart = NumberStart + 1
            
                NumberStart = i + 2
                NumberLen = 1
                Continue = True
                FoundRightNum = False
                Do While (NumberStart > 1 And NumberStart < Len(pString) And Continue = True)
                    Continue = False
                    If IsNumber(Mid$(pString, NumberStart, 1)) = True Then
                        Continue = True
                        FoundRightNum = True
                    End If
                    If Mid$(pString, NumberStart, 1) = " " And FoundRightNum = False Then
                        Continue = True
                    End If
                    
                    If FoundRightNum = False Or Continue = True Then
                        NumberStart = NumberStart + 1
                        NumberLen = NumberLen + 1
                    End If
                Loop
                
                If FoundLeftNum = True And FoundRightNum = True Then
                    If NumberLen > 1 Then
                        pTotalFiles = Mid$(pString, i + 2, NumberLen - 1)
                    Else
                        pTotalFiles = Mid$(pString, i + 2, NumberLen)
                    End If
                    
                    If LeftStart > 5 Then
                        If Mid$(pString, LeftStart - 5, 4) = "File" Then
                            pReplaceString = Mid$(pString, LeftStart - 5, NumberStart - LeftStart + 5)
                        Else
                            pReplaceString = Mid$(pString, LeftStart, NumberStart - LeftStart)
                        End If
                    End If
                    
                    GetNofN = True
                    Exit Function
                End If
            End If
        End If
    
    Next

End Function

Private Function SearchForTrackIndexes(pString As String, pEnd As Long, ByRef pStart As Long) As Boolean
    Dim i As Long
    Dim TrackIndex As String
    Dim TrackIndexLong As Long
    Dim Found As Boolean
    Dim Number2 As Long
    Dim Number2Dash As Long
    Dim Number2DashSpace As Long
    Dim Next2Chars As String
    Dim t As Long
    SearchForTrackIndexes = False
    pStart = 0
    Number2 = 0
    Number2Dash = 0
    Number2DashSpace = 0
    
    For i = pEnd - 3 To 1 Step -1
    
        TrackIndex = Mid$(pString, i, 1)
        t = i + 1
        Do While t < Len(pString)
            If IsNumeric(Mid$(pString, t, 1)) = True Then
                TrackIndex = TrackIndex & Mid$(pString, t, 1)
            Else
                Exit Do
            End If
            t = t + 1
        Loop
        
        TrackIndexLong = Val(TrackIndex)
        If IsNumber(TrackIndex) = True Then
            Found = False
            If i = 1 Then
                Found = True
            Else
                If IsNumber(Mid$(pString, i - 1, 1)) = False Then
                    Found = True
                End If
            End If
            
            If Found = True Then
                If IsNumber(Mid$(pString, i + Len(TrackIndex), 1)) = False Then
                    If TrackIndexLong < 40 Or TrackIndexLong >= 100 Then
                        If Number2 = 0 Then
                            Number2 = i
                        End If
                        
                        SearchForTrackIndexes = True
                        
                        Next2Chars = Mid$(pString, i + Len(TrackIndex), 3)
                        If Next2Chars = " - " Then
                            Number2DashSpace = i
                            Exit For
                        End If
                        
                        If Mid$(pString, t, 1) = "-" Then
                        
                            Number2Dash = i
                            'Exit For
                        End If
                    End If
                End If
            End If
        End If
    Next
    If Number2DashSpace > 0 Then
        pStart = Number2DashSpace
    Else
        If Number2Dash > 0 Then
            pStart = Number2Dash
        Else
            pStart = Number2
        End If
    End If
    
End Function

Private Function StripCDIndexes(psubject As String) As String
    Dim CDStart As Long
    Dim Tempstring As String
    Dim ReplaceString As String
    Dim i As Long
    Tempstring = UCase(psubject)
    ReplaceString = ""
    
    CDStart = InStr(1, Tempstring, "DISC", vbTextCompare)
    Do While CDStart > 0
        If CDStart > 0 Then
            If Mid$(Tempstring, CDStart, 5) = "DISC " And IsNumber(Mid$(Tempstring, CDStart + 5, 1)) = True And Len(Mid$(Tempstring, CDStart + 5, 1)) > 0 Then
                m_CDNumber = Mid$(Tempstring, CDStart + 5, 1)
                ReplaceString = Mid$(psubject, CDStart, 6)
                Exit Do
            Else
                If Mid$(Tempstring, CDStart, 4) = "DISC" And IsNumber(Mid$(Tempstring, CDStart + 4, 1)) = True And Len(Mid$(Tempstring, CDStart + 4, 1)) > 0 Then
                    m_CDNumber = Mid$(Tempstring, CDStart + 4, 1)
                    ReplaceString = Mid$(psubject, CDStart, 5)
                    Exit Do
                End If
            End If
        End If
        i = CDStart + 1
        CDStart = InStr(i, Tempstring, "DISC", vbTextCompare)
    Loop
    
    CDStart = InStr(1, Tempstring, "CD", vbTextCompare)
    Do While CDStart > 0
        If CDStart > 0 And CDStart + 3 < Len(Tempstring) Then
            If Mid$(Tempstring, CDStart, 3) = "CD " And IsNumber(Mid$(Tempstring, CDStart + 3, 1)) = True Then
                m_CDNumber = Mid$(Tempstring, CDStart + 3, 1)
                ReplaceString = Mid$(psubject, CDStart, 4)
                Exit Do
            Else
                If Mid$(Tempstring, CDStart, 2) = "CD" And IsNumber(Mid$(Tempstring, CDStart + 2, 1)) = True Then
                    m_CDNumber = Mid$(Tempstring, CDStart + 2, 1)
                    ReplaceString = Mid$(psubject, CDStart, 3)
                    Exit Do
                End If
            End If
        End If
        i = CDStart + 1
        CDStart = InStr(i, Tempstring, "CD", vbTextCompare)
    Loop


    CDStart = InStr(1, Tempstring, "CD#", vbTextCompare)
    Do While CDStart > 0
        If CDStart > 0 Then
            If Mid$(Tempstring, CDStart, 3) = "CD# " And IsNumber(Mid$(Tempstring, CDStart + 4, 1)) = True Then
                m_CDNumber = Mid$(Tempstring, CDStart + 4, 1)
                ReplaceString = Mid$(psubject, CDStart, 5)
                Exit Do
            Else
                If Mid$(Tempstring, CDStart, 3) = "CD#" And IsNumber(Mid$(Tempstring, CDStart + 3, 1)) = True Then
                    m_CDNumber = Mid$(Tempstring, CDStart + 3, 1)
                    ReplaceString = Mid$(psubject, CDStart, 4)
                    Exit Do
                End If
            End If
        End If
        i = CDStart + 1
        CDStart = InStr(i, Tempstring, "CD#", vbTextCompare)
    Loop

    StripCDIndexes = Replace(psubject, ReplaceString, "")
End Function

Private Function RemoveFromTo(pString As String) As String
    Dim pos As Long
    Dim pos2 As Long
    Dim Tempstring As String
    
    Tempstring = pString
    
    pos = InStr(1, Tempstring, " posts ", vbTextCompare)
    If pos > 0 Then
        Tempstring = Mid$(Tempstring, pos + 7)
    End If
    
    pos = InStr(1, Tempstring, "heres-", vbTextCompare)
    pos2 = InStr(1, Tempstring, "my-req-", vbTextCompare)
    If pos > 0 And pos2 > 0 Then
        pos = pos
        
    End If

    pos = InStr(1, Tempstring, "req ", vbTextCompare)
    pos2 = InStr(1, Tempstring, "here  is", vbTextCompare)
    If pos > 0 And pos2 > 0 Then
        pos = pos
        
    End If

    pos = InStr(1, Tempstring, "my req ", vbTextCompare)
    If pos > 0 And pos2 > 0 Then
        pos = pos
        
    End If

    pos = InStr(1, Tempstring, "attn ", vbTextCompare)
    If pos > 0 And pos2 > 0 Then
        pos = pos
        
    End If


    RemoveFromTo = Tempstring
End Function


Private Function RemoveWords(pString As String) As String
    Dim Tempstring As String
    
    Tempstring = pString
    
    Tempstring = Replace(Tempstring, "DEFTONES_FLOOD--=FTPNETWORK.COM_CptSpAnKy=--", "", 1, -1, vbTextCompare)
    Tempstring = Replace(Tempstring, "mp3freak post", "", 1, -1, vbTextCompare)
    
    Tempstring = Replace(Tempstring, "(yenc)", "", 1, -1, vbTextCompare)
    Tempstring = Replace(Tempstring, "yenc", "", 1, -1, vbTextCompare)
    Tempstring = Replace(Tempstring, "REPOST - ", "", 1, -1, vbTextCompare)
    'tempstring = Replace(tempstring, "PER REQ - ", "", 1, -1, vbTextCompare)

    'tempstring = Replace(tempstring, "here's ", "", 1, -1, vbTextCompare)
    'tempstring = Replace(tempstring, "filling req ", "", 1, -1, vbTextCompare)
    Tempstring = Replace(Tempstring, "(<>manuforever<>)", "", 1, -1, vbTextCompare)
    Tempstring = Replace(Tempstring, "(reddevil)", "", 1, -1, vbTextCompare)
    Tempstring = Replace(Tempstring, "(repost)", "", 1, -1, vbTextCompare)
    Tempstring = Replace(Tempstring, "(repost_sorry)", "", 1, -1, vbTextCompare)
    
    Tempstring = Replace(Tempstring, "[- neoclassical -]", "", 1, -1, vbTextCompare)
    Tempstring = Replace(Tempstring, "[john5ice] ", "", 1, -1, vbTextCompare)
    Tempstring = Replace(Tempstring, "[requested] ", "", 1, -1, vbTextCompare)
    Tempstring = Replace(Tempstring, "{newage}", "", 1, -1, vbTextCompare)
    Tempstring = Replace(Tempstring, "misery", "", 1, -1, vbTextCompare)
    Tempstring = Replace(Tempstring, "repost", "", 1, -1, vbTextCompare)
    Tempstring = Replace(Tempstring, "(wtb)", "", 1, -1, vbTextCompare)
    
    Tempstring = Replace(Tempstring, "as requested", "", 1, -1, vbTextCompare)
    Tempstring = Replace(Tempstring, "as req", "", 1, -1, vbTextCompare)
    Tempstring = Replace(Tempstring, "posting", "", 1, -1, vbTextCompare)
    Tempstring = Replace(Tempstring, "here's", "", 1, -1, vbTextCompare)
    Tempstring = Replace(Tempstring, "here is ", "", 1, -1, vbTextCompare)
    Tempstring = Replace(Tempstring, "filling req", "", 1, -1, vbTextCompare)
    Tempstring = Replace(Tempstring, "tia here is", "", 1, -1, vbTextCompare)

    RemoveWords = Tempstring
End Function

Private Function ScanLeft(pString As String, pNumberStart As Long) As String
    Dim NumberStart As Long
    Dim NumberLen As Long
    Dim Continue As Boolean
    Dim FoundNumeric As Boolean
    
    NumberStart = pNumberStart - 1
    NumberLen = 1
    Continue = True
    FoundNumeric = False
    Do While (NumberStart > 1 And NumberStart <= Len(pString) And Continue = True)
        Continue = False
        If IsNumber(Mid$(pString, NumberStart, 1)) = True Then
            Continue = True
            FoundNumeric = True
        End If
        If Mid$(pString, NumberStart, 1) = " " And FoundNumeric = False Then
            Continue = True
        End If
        
        If FoundNumeric = False Or Continue = True Then
            NumberStart = NumberStart - 1
            NumberLen = NumberLen + 1
        End If
    Loop
    
    If FoundNumeric = True Then
        ScanLeft = Mid$(pString, NumberStart + 1, NumberLen - 1)
    Else
        ScanLeft = ""
    End If

End Function

Private Function GetNBytes(pString As String) As String
    Dim BytesPos As Long
    Dim ReplaceString As String
    Dim Tempstring As String
    Tempstring = pString
    
    BytesPos = InStr(1, Tempstring, "BYTES", vbTextCompare)
    If BytesPos > 0 Then
        ReplaceString = ScanLeft(Tempstring, BytesPos)
        If ReplaceString <> "" Then
            Tempstring = Replace(Tempstring, ReplaceString & "bytes", "", 1, -1, vbTextCompare)
        End If
    End If
    
    BytesPos = InStr(1, Tempstring, "mbytes", vbTextCompare)
    If BytesPos > 0 Then
        ReplaceString = ScanLeft(Tempstring, BytesPos)
        If ReplaceString <> "" Then
            Tempstring = Replace(Tempstring, ReplaceString & "mbytes", "", 1, -1, vbTextCompare)
        End If
    End If
    
    BytesPos = InStr(1, Tempstring, "kbyte", vbTextCompare)
    If BytesPos > 0 Then
        ReplaceString = ScanLeft(Tempstring, BytesPos)
        If ReplaceString <> "" Then
            Tempstring = Replace(Tempstring, ReplaceString & "kbyte", "", 1, -1, vbTextCompare)
        End If
    End If
    
    BytesPos = InStr(1, Tempstring, "kb", vbTextCompare)
    If BytesPos > 0 Then
        ReplaceString = ScanLeft(Tempstring, BytesPos)
        If ReplaceString <> "" Then
            Tempstring = Replace(Tempstring, ReplaceString & "kb", "", 1, -1, vbTextCompare)
        End If
    End If
    
    BytesPos = InStr(1, Tempstring, " k", vbTextCompare)
    If BytesPos > 0 Then
        ReplaceString = ScanLeft(Tempstring, BytesPos)
        If ReplaceString <> "" Then
            Tempstring = Replace(Tempstring, ReplaceString & " k", "", 1, -1, vbTextCompare)
        End If
    End If
    
    BytesPos = InStr(1, Tempstring, "k", vbTextCompare)
    Do While BytesPos > 0
        ReplaceString = ScanLeft(Tempstring, BytesPos)
        If ReplaceString <> "" Then
            Tempstring = Replace(Tempstring, ReplaceString & "k", "", 1, -1, vbTextCompare)
        End If
        BytesPos = InStr(BytesPos + 1, Tempstring, "k", vbTextCompare)
    Loop
    
    GetNBytes = Tempstring
End Function

Private Function TrimDash(pString As String) As String
    Dim i As Long
    Dim char As String
    
    i = Len(pString)
    Do While i > 0
        char = Mid$(pString, i, 1)
        If char <> "-" And char <> " " Then
            Exit Do
        End If
        i = i - 1
    Loop
    
    TrimDash = Mid$(pString, 1, i)
End Function

Public Function ProcessSubject(psubject As String) As Boolean
    Dim LeftBracket As Long
    Dim RightBracket As Long
    Dim ProcessedSubject As String
    Dim FileNameEnd As Long
    Dim FileNameStart As Long
    Dim nnOfnn As String
    Dim i As Long
    Dim Tempstring As String
    Dim FileStartCursor As Long
    ProcessSubject = False
    
    Dim SpacePos As Long
    Dim DashPos As Long
    Dim IndexPos As Long
    
    m_FileName = ""
    m_GroupName = ""
    m_CDNumber = -1
    
    If GetArticleIndex(psubject, LeftBracket, RightBracket, m_ArticleNumber, m_TotalArticles, False) = True Then
        ProcessedSubject = Replace(psubject, Mid$(psubject, LeftBracket - 1, RightBracket - LeftBracket + 3), "")
        
        If m_mp3Mode = True Then
            ProcessedSubject = RemoveFromTo(ProcessedSubject)
        End If
        
        ' Remove yenc etc
        ProcessedSubject = RemoveWords(ProcessedSubject)
        
        
        ' Use Brackets to get file numbers
        LeftBracket = 0
        RightBracket = 0
        If GetArticleIndex(ProcessedSubject, LeftBracket, RightBracket, m_FileNumber, m_TotalFiles, True) = True Then
            ProcessedSubject = Replace(ProcessedSubject, Mid$(ProcessedSubject, LeftBracket - 1, RightBracket - LeftBracket + 3), "")
        Else
            ' No filenumbers
        End If
        
        m_TotalFiles = 0
        m_FileNumber = 0
        If GetNofN(ProcessedSubject, m_FileNumber, m_TotalFiles, nnOfnn) = True Then
            ProcessedSubject = Replace(ProcessedSubject, nnOfnn, "", 1, -1, vbTextCompare)
        Else
        End If
        
        
        FileNameEnd = FindFileNameExtension(ProcessedSubject, False)
        If FileNameEnd > 0 Then
            If Mid$(ProcessedSubject, FileNameEnd + 1, 1) = Chr$(34) And InStrRev(ProcessedSubject, Chr$(34), FileNameEnd) > 0 Then
                ' Use chr$34
                FileNameStart = InStrRev(ProcessedSubject, Chr$(34), FileNameEnd)
                m_FileName = SubString(ProcessedSubject, FileNameStart + 1, FileNameEnd + 1)
                m_GroupName = Replace(ProcessedSubject, Chr$(34) & m_FileName & Chr$(34), "")
            Else
            
                FileStartCursor = FileNameEnd
                Tempstring = UCase$(ProcessedSubject)
                
                
                If m_mp3Mode = False Then
                    For i = 8 To 10
                        If FileNameEnd > i Then
                            If Mid$(Tempstring, FileNameEnd - i, 4) = "PART" Then
                                FileStartCursor = FileNameEnd - i
                                Exit For
                            End If
                        End If
                    Next
                    IndexPos = 0
                Else
                    ' Search for track indexs
                    If SearchForTrackIndexes(ProcessedSubject, FileStartCursor, IndexPos) Then
                    End If
                    
                End If
                
                
                SpacePos = InStrRev(Tempstring, " ", FileStartCursor)
                DashPos = InStrRev(Tempstring, " - ", FileStartCursor)
                
                If IndexPos <> 0 Then
                    m_FileName = SubString(ProcessedSubject, IndexPos, FileNameEnd + 1)
                Else
                    If SpacePos = 0 And DashPos = 0 Then
                        m_FileName = SubString(ProcessedSubject, 1, FileNameEnd + 1)
                    Else
                        If SpacePos > DashPos And DashPos <> 0 Then
                            m_FileName = SubString(ProcessedSubject, DashPos + 3, FileNameEnd + 1)
                        Else
                            m_FileName = SubString(ProcessedSubject, SpacePos + 1, FileNameEnd + 1)
                        End If
                        
                    End If
                End If
                
                
                ProcessedSubject = Replace(ProcessedSubject, m_FileName, "")
                
            
            
                m_GroupName = ProcessedSubject
                m_FileName = MakeLegalFolderName(m_FileName)
            End If
            
            
            ' Strip CD indexes
            m_GroupName = StripCDIndexes(m_GroupName)
            
            If m_CDNumber > 0 And m_mp3Mode = True Then
                m_FileName = m_CDNumber & m_FileName
            End If
            
            m_GroupName = TrimDash(m_GroupName)
            m_GroupName = GetNBytes(m_GroupName)
            m_GroupName = MakeLegalFolderName(m_GroupName)
        Else
            ' No filename found
        End If
        
        ' Remove speech marks from filename
        m_FileName = Trim$(Replace(m_FileName, Chr$(34), ""))
        m_FileName = Trim$(Replace(m_FileName, "|", ""))
    
    
    
        ProcessSubject = True
    End If

End Function

''inuse
Private Function Find3Extension(pString As String) As Long
    Dim pos As Long
    Find3Extension = 0
    pString = LCase(pString)
    
    If (Find3Extension < InStrRev(pString, ".ogg", , vbTextCompare)) Then
        Find3Extension = InStrRev(pString, ".ogg", , vbTextCompare)
    End If
    
    ' Try and search for longer extensions
    If (Find3Extension < InStrRev(pString, ".zip", , vbTextCompare)) Then
        Find3Extension = InStrRev(pString, ".zip", , vbTextCompare)
    End If

    If (Find3Extension < InStrRev(pString, ".mp3", , vbTextCompare)) Then
        Find3Extension = InStrRev(pString, ".mp3", , vbTextCompare)
    End If

    If (Find3Extension < InStrRev(pString, ".jpg", , vbTextCompare)) Then
        Find3Extension = InStrRev(pString, ".jpg", , vbTextCompare)
    End If

    If (Find3Extension < InStrRev(pString, ".gif", , vbTextCompare)) Then
        Find3Extension = InStrRev(pString, ".gif", , vbTextCompare)
    End If

    If (Find3Extension < InStrRev(pString, ".m3u", , vbTextCompare)) Then
        Find3Extension = InStrRev(pString, ".m3u", , vbTextCompare)
    End If
    
    If (Find3Extension < InStrRev(pString, ".sfv", , vbTextCompare)) Then
        Find3Extension = InStrRev(pString, ".sfv", , vbTextCompare)
    End If
    
    If (Find3Extension < InStrRev(pString, ".log", , vbTextCompare)) Then
        Find3Extension = InStrRev(pString, ".log", , vbTextCompare)
    End If

    If (Find3Extension < InStrRev(pString, ".txt", , vbTextCompare)) Then
        Find3Extension = InStrRev(pString, ".txt", , vbTextCompare)
    End If

    If (Find3Extension < InStrRev(pString, ".doc", , vbTextCompare)) Then
        Find3Extension = InStrRev(pString, ".doc", , vbTextCompare)
    End If

    If (Find3Extension < InStrRev(pString, ".bmp", , vbTextCompare)) Then
        Find3Extension = InStrRev(pString, ".bmp", , vbTextCompare)
    End If

    If (Find3Extension < InStrRev(pString, ".wma", , vbTextCompare)) Then
        Find3Extension = InStrRev(pString, ".wma", , vbTextCompare)
    End If
    
    If (Find3Extension < InStrRev(pString, ".htm", , vbTextCompare)) Then
        Find3Extension = InStrRev(pString, ".htm", , vbTextCompare)
    End If
    
    If (Find3Extension < InStrRev(pString, ".wav", , vbTextCompare)) Then
        Find3Extension = InStrRev(pString, ".wav", , vbTextCompare)
    End If
    
    If (Find3Extension < InStrRev(pString, ".vob", , vbTextCompare)) Then
        Find3Extension = InStrRev(pString, ".vob", , vbTextCompare)
    End If
    
    If (Find3Extension < InStrRev(pString, ".mpg", , vbTextCompare)) Then
        Find3Extension = InStrRev(pString, ".mpg", , vbTextCompare)
    End If

    If (Find3Extension < InStrRev(pString, ".rar", , vbTextCompare)) Then
        Find3Extension = InStrRev(pString, ".rar", , vbTextCompare)
    End If
    
    If (Find3Extension < InStrRev(pString, ".par", , vbTextCompare)) Then
        Find3Extension = InStrRev(pString, ".par", , vbTextCompare)
    End If
    
    If (Find3Extension < InStrRev(pString, ".exe", , vbTextCompare)) Then
        Find3Extension = InStrRev(pString, ".exe", , vbTextCompare)
    End If
    
    If (Find3Extension < InStrRev(pString, ".wmv", , vbTextCompare)) Then
        Find3Extension = InStrRev(pString, ".wmv", , vbTextCompare)
    End If
    
    
    pos = 0
    pos = InStrRev(pString, ".0", pos - 1, vbTextCompare)
    Do While pos > 1
        If (Find3Extension < pos And IsNumeric(Mid$(pString, pos + 2, 2))) Then
            Find3Extension = pos
            Exit Do
        End If
        pos = InStrRev(pString, ".0", pos - 1, vbTextCompare)
    Loop

    If Find3Extension = 0 Then
        pos = InStrRev(pString, ".1", -1, vbTextCompare)
        Do While pos > 1
            If (Find3Extension < pos And IsNumeric(Mid$(pString, pos + 2, 2))) Then
                Find3Extension = pos
                Exit Do
            End If
            pos = InStrRev(pString, ".1", pos - 1, vbTextCompare)
        Loop
        
        If Find3Extension = 0 Then
        
            pos = InStrRev(pString, ".r", -1, vbTextCompare)
            Do While pos > 1
                If (Find3Extension < pos And IsNumeric(Mid$(pString, pos + 2, 2))) Then
                    Find3Extension = pos
                    Exit Do
                End If
                pos = InStrRev(pString, ".r", pos - 1, vbTextCompare)
            Loop
            
            If Find3Extension = 0 Then
                pos = InStrRev(pString, ".2", -1, vbTextCompare)
                Do While pos > 1
                    If (Find3Extension < pos And IsNumeric(Mid$(pString, pos + 2, 2))) Then
                        Find3Extension = pos
                        Exit Do
                    End If
                    pos = InStrRev(pString, ".2", pos - 1, vbTextCompare)
                Loop
                If Find3Extension = 0 Then
                    pos = InStrRev(pString, ".s", -1, vbTextCompare)
                    Do While pos > 0
                        If (Find3Extension < pos And IsNumeric(Mid$(pString, pos + 2, 2))) Then
                            Find3Extension = pos
                            Exit Do
                        End If
                        If pos > 1 Then
                            pos = InStrRev(pString, ".s", pos - 1, vbTextCompare)
                        Else
                            pos = 0
                        End If
                    Loop
                    If Find3Extension = 0 Then
                    
                        If (Find3Extension < InStrRev(pString, ".p", , vbTextCompare)) Then
                            Find3Extension = InStrRev(pString, ".p", , vbTextCompare)
                        End If
                        
                    End If
                End If
                
                If (Find3Extension < InStrRev(pString, ".nfo", , vbTextCompare)) Then
                    Find3Extension = InStrRev(pString, ".nfo", , vbTextCompare)
                End If
            End If
        End If
        
    End If
End Function


Private Function FindFileNameExtension(pString As String, pIgnoreError As Boolean) As Long
    
    If (FindFileNameExtension < InStrRev(pString, ".jpeg", , vbTextCompare)) Then
        FindFileNameExtension = InStrRev(pString, ".jpeg", , vbTextCompare) + 4
    End If

    If (FindFileNameExtension < InStrRev(pString, ".mpeg", , vbTextCompare)) Then
        FindFileNameExtension = InStrRev(pString, ".mpeg", , vbTextCompare) + 4
    End If
    
    If (FindFileNameExtension < InStrRev(pString, ".par2", , vbTextCompare)) Then
        FindFileNameExtension = InStrRev(pString, ".par2", , vbTextCompare) + 4
    End If
    
    If FindFileNameExtension = 0 Then
        ' OK try and get the filename using .rXX or .PXX
        FindFileNameExtension = Find3Extension(pString)
        If (FindFileNameExtension > 0) Then
            FindFileNameExtension = FindFileNameExtension + 3
        End If
        pString = LCase(pString)
    End If
    
End Function


''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'' Filename processing


Private Function MakeLegalFolderName2(pString As String) As String
    Dim Tempstring As String
    Dim TempString2 As String
    Dim a As String
    Dim i As Long
    
    
    Tempstring = Replace(pString, "!", "")
    Tempstring = Replace(Tempstring, "()", "")
    Tempstring = Replace(Tempstring, "thnx", "")
    Tempstring = Replace(Tempstring, Chr$(34), "")
    Tempstring = Replace(Tempstring, "/", "")
    Tempstring = Replace(Tempstring, "\", "")
    Tempstring = Replace(Tempstring, "#", "")
    Tempstring = Replace(Tempstring, ":", "")
    Tempstring = Replace(Tempstring, "<", "")
    Tempstring = Replace(Tempstring, ">", "")
    Tempstring = Replace(Tempstring, "*", "")
    Tempstring = Replace(Tempstring, "?", "")
    Tempstring = Replace(Tempstring, "=", "")
    Tempstring = Replace(Tempstring, "|", "")
    Tempstring = Replace(Tempstring, vbCr, "")
    Tempstring = Replace(Tempstring, vbLf, "")
    Tempstring = Replace(Tempstring, "&", "")
    
    TempString2 = ""
    For i = 1 To Len(Tempstring)
        If (Asc(Mid$(Tempstring, i, 1)) < 20) Then
        Else
            TempString2 = TempString2 & Mid$(Tempstring, i, 1)
        End If
    Next
    Tempstring = TempString2
    
    MakeLegalFolderName2 = Tempstring
End Function

Public Function MakeLegalFolderName(pString As String) As String
    Dim Tempstring As String
    Dim a As String
    Tempstring = MakeLegalFolderName2(pString)

    ' Remove <n> bytes
    If (InStr(1, Tempstring, "bytes", vbTextCompare) > 1) Then
        a = Mid$(Tempstring, 1, InStr(1, Tempstring, "bytes", vbTextCompare) - 2)
        Do While (IsNumeric(Right$(a, 1)) = True And a <> "")
            a = Left$(a, Len(a) - 1)
        Loop
        Tempstring = a
    End If
    
    ' Remove <n>K
    If (InStrRev(Tempstring & " ", "K ", vbTextCompare) > 0) Then
        a = Mid$(Tempstring, 1, InStrRev(Tempstring, "k", vbTextCompare) - 2)
        Do While (IsNumeric(Right$(a, 1)) = True Or Right$(a, 1) = "(" Or Right$(a, 1) = ")" Or Right$(a, 1) = "[" Or Right$(a, 1) = "]")
            a = Left$(a, Len(a) - 1)
        Loop
        Tempstring = a
    End If
    
    Tempstring = Replace(Tempstring, "]", "")
    
    ' Remove file <n> of <m>
    If (InStr(1, Tempstring, "File", vbTextCompare) > 0) Then
        Dim ofpos As Long
        ofpos = InStr(1, Tempstring, "File", vbTextCompare)
        If (Mid$(Tempstring, InStr(1, Tempstring, "File", vbTextCompare) + 8, 2) = "of") Then
            a = Replace(Tempstring, Mid$(Tempstring, ofpos, 13), "")
        Else
            a = Tempstring
        End If
        Tempstring = a
    End If
    
    Tempstring = Trim$(Tempstring)
    If (Right$(Tempstring, 2) = " -") Then
        Tempstring = Left$(Tempstring, Len(Tempstring) - 2)
    End If
    
    If (UCase$(Left$(Tempstring, 6)) = "AS REQ") Then
        Tempstring = Mid$(Tempstring, 7)
    End If
    
    If (Left$(Tempstring, 1) = "(" And Right$(Tempstring, 1) = ")") Then
        Tempstring = Mid$(Tempstring, 2, Len(Tempstring) - 2)
    End If
    
    MakeLegalFolderName = Tempstring
End Function


''inuse
Public Function GetFileNameWithNoExtenstion(pName As String) As String
    Dim ExtensionStart As Long
    Dim Tempstring As String
    ExtensionStart = Find3Extension(pName) - 1

    If (ExtensionStart <> -1) Then
        Tempstring = Mid$(pName, 1, ExtensionStart)
        
        If (InStr(Tempstring, ".part") > 0) Then
            Tempstring = Mid$(Tempstring, 1, InStr(Tempstring, ".part") - 1)
        End If

        GetFileNameWithNoExtenstion = Tempstring
    Else
        GetFileNameWithNoExtenstion = ""
    End If
End Function

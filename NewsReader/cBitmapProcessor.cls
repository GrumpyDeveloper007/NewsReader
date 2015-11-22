VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cBitmapProcessor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
''*************************************************************************
'' Bitmap Processor Object
''
'' Designed to indicate what parts of a file have been downloaded

'' Coded by Dale Pitman - PyroDesign

Private Bitmap(20000) As Long
Private NewBitmap(20000) As Long
Private LastFilename As String

'' Check to see a section of a file has been downloaded
Public Function CheckFileBitmap(pfilename As String, pFileIndex As Long, pTotalArticles As Long) As Long
    Dim fileid As Long
    Dim OldBitmapSize As Long
    Dim tempstring As String
    Dim SearchStop As Double
    Dim i As Long
    Dim t As Long
    Dim row As Long
    
    If LastFilename <> pfilename Then
        LastFilename = pfilename
    End If
    On Error GoTo shit:
    fileid = FreeFile
    row = 0
    If (Dir$(FRMOptions.TempDownloadPath & pfilename & ".txt", vbNormal) <> "") Then
        Open FRMOptions.TempDownloadPath & pfilename & ".txt" For Input As #fileid
        If (EOF(fileid) = False) Then
            Line Input #fileid, tempstring ' number of articles
        End If
        
        If (pTotalArticles = 0) Then
            pTotalArticles = Val(tempstring)
        End If
        OldBitmapSize = Val(tempstring)
        Do While (EOF(fileid) = False)
            Line Input #fileid, tempstring
            For i = 0 To 9
                Bitmap(row * 10 + i) = Val(Mid$(tempstring, i + 1, 1))
            Next
            row = row + 1
        Loop
        Close #fileid
    
        If pTotalArticles <> OldBitmapSize Then
            ' Recalculate bitmap
            For i = 0 To pTotalArticles
                NewBitmap(i + 1) = 1
                SearchStop = (i + 1) * OldBitmapSize / pTotalArticles
                If SearchStop > Round(SearchStop) Then
                    SearchStop = SearchStop + 1
                End If
                
                For t = i * OldBitmapSize / pTotalArticles To SearchStop
                    If Bitmap(t + 1) = 0 Then
                        NewBitmap(i + 1) = 0
                    End If
                Next
            Next
            pTotalArticles = pTotalArticles
            For i = 0 To pTotalArticles
                Bitmap(i) = NewBitmap(i)
            Next
        End If
        
        ' Update the number of articles
        fileid = FreeFile
        row = 0
        Open FRMOptions.TempDownloadPath & pfilename & ".txt" For Output As #fileid
        Print #fileid, pTotalArticles
        For row = 0 To pTotalArticles / 10 + 1
            tempstring = ""
            For i = 0 To 9
                tempstring = tempstring & Bitmap(row * 10 + i)
            Next
            Print #fileid, tempstring
        Next
        Close #fileid
    Else
        For i = 0 To pTotalArticles
            Bitmap(i) = 0
        Next
    End If
    

    CheckFileBitmap = Bitmap(pFileIndex)
    Exit Function
shit:
    CheckFileBitmap = 0
End Function

'' Update a grid that represents the download bitmap
Public Sub RefreshDownloadBitmap(pGrid As fpList, pfileID As Long, pArticles As Long)  'pIndex As Long,
    Static LastTotalArticles As Long
    Dim i As Long
    Dim t As Long
    Dim NewsReadersId As Long
    
    'If LastTotalArticles <> pArticles Then
        pGrid.Clear
        For i = 1 To pArticles / 10
            Call pGrid.AddItem("")
        Next
        LastTotalArticles = pArticles
    'End If
    
    pGrid.ListApplyTo = ListApplyToIndividual
    For i = 0 To pArticles - 1
        pGrid.Col = i Mod 10
        pGrid.row = i \ 10
        'If i = pIndex Then
        '    pGrid.BackColor = &HFF9F9F
        'Else
            NewsReadersId = -1
            If frmReaderHolder.CheckCurrentlyDownloadingIndex(pfileID, i + 1, NewsReadersId) = True Then
                pGrid.ColList = NewsReadersId
            End If
            
            If NewsReadersId <> -1 Then
                pGrid.BackColor = &HFF9F9F
            Else
                If Bitmap(i + 1) > 0 Then
                    pGrid.BackColor = &HFF6F00
                Else
                    pGrid.BackColor = &HFFFFFF
                End If
            End If
        'End If
    Next
    Do While i Mod 10 > 0
        pGrid.Col = i Mod 10
        pGrid.row = i \ 10
        pGrid.BackColor = &H9F9F9F
        i = i + 1
    Loop
    'pGrid.Refresh
End Sub

'' Check to see if a file is complete (all bitmap elements set)
Public Function IsCompleteFileBitmap(pfilename As String, pTotalArticles As Long) As Boolean
    Dim fileid As Long
    Dim Bitmap(2000) As Long
    Dim tempstring As String
    Dim i As Long
    Dim row As Long
    
    fileid = FreeFile
    row = 0
    If (Dir$(FRMOptions.TempDownloadPath & pfilename & ".txt", vbNormal) <> "") Then
        Open FRMOptions.TempDownloadPath & pfilename & ".txt" For Input As #fileid
        If (EOF(fileid) = False) Then
        Line Input #fileid, tempstring ' number of articles
        End If
        If (pTotalArticles = 0) Then
            pTotalArticles = Val(tempstring)
        End If
        Do While (EOF(fileid) = False)
            Line Input #fileid, tempstring
            For i = 0 To 9
                Bitmap(row * 10 + i) = Val(Mid$(tempstring, i + 1, 1))
            Next
            row = row + 1
        Loop
        Close #fileid
    End If
    
    

    IsCompleteFileBitmap = True
    For i = 1 To pTotalArticles
        If (Bitmap(i) = 0) Then
            IsCompleteFileBitmap = False
            Exit For
        End If
    Next
End Function

'' Called whenever a section of a file has been downloaded
Public Sub UpdateFileBitmap(pfilename As String, pFileIndex As Long, pTotalArticles As Long)
    Dim fileid As Long
    'Dim Bitmap(2000) As Long
    Dim tempstring As String
    Dim i As Long
    Dim row As Long
    'Dim TotalArticles As Long
    fileid = FreeFile
    row = 0
    If (pFileIndex = 0) Then
        pFileIndex = 1
    End If
    
    If pTotalArticles <> 421 Then
    i = i
    End If
    
    If (Dir$(FRMOptions.TempDownloadPath & pfilename & ".txt") <> "") Then
        Open FRMOptions.TempDownloadPath & pfilename & ".txt" For Input As #fileid
        Line Input #fileid, tempstring
        If pTotalArticles = 0 Then
            pTotalArticles = Val(tempstring)
        End If
        Do While (EOF(fileid) = False)
            Line Input #fileid, tempstring
            For i = 0 To 9
                Bitmap(row * 10 + i) = Val(Mid$(tempstring, i + 1, 1))
            Next
            row = row + 1
        Loop
        Close #fileid
    Else
        For i = 0 To 2000
            Bitmap(i) = 0
        Next
    End If
    
    Bitmap(pFileIndex) = Bitmap(pFileIndex) + 1
    
    fileid = FreeFile
    row = 0
    Open FRMOptions.TempDownloadPath & pfilename & ".txt" For Output As #fileid
        If pTotalArticles = 0 Then
            tempstring = tempstring
        End If
    Print #fileid, pTotalArticles
    For row = 0 To pTotalArticles / 10 + 1
        tempstring = ""
        For i = 0 To 9
            tempstring = tempstring & Bitmap(row * 10 + i)
        Next
        Print #fileid, tempstring
    Next
    Close #fileid
    
End Sub



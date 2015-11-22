VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form frmReaderHolder 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   Visible         =   0   'False
   Begin MSWinsockLib.Winsock BWinsock 
      Left            =   120
      Top             =   600
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin MSWinsockLib.Winsock AWinsock 
      Left            =   120
      Top             =   120
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin MSWinsockLib.Winsock CWinsock 
      Left            =   120
      Top             =   1140
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin MSWinsockLib.Winsock DWinsock 
      Left            =   120
      Top             =   1620
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin MSWinsockLib.Winsock FWinsock 
      Left            =   720
      Top             =   600
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin MSWinsockLib.Winsock EWinsock 
      Left            =   720
      Top             =   120
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin MSWinsockLib.Winsock GWinsock 
      Left            =   720
      Top             =   1140
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin MSWinsockLib.Winsock HWinsock 
      Left            =   720
      Top             =   1620
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
End
Attribute VB_Name = "frmReaderHolder"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
''*************************************************************************
'' ReaderHolder - holds all winsock \ newsreader controls and provides 'all thread' commands
''
'' Coded by Dale Pitman - PyroDesign

Public WithEvents m_cNewsReader As cNewsReader
Attribute m_cNewsReader.VB_VarHelpID = -1
Private WithEvents m_cNewsReaderB As cNewsReader
Attribute m_cNewsReaderB.VB_VarHelpID = -1
Public WithEvents m_cNewsReaderC As cNewsReader
Attribute m_cNewsReaderC.VB_VarHelpID = -1
Public WithEvents m_cNewsReaderD As cNewsReader
Attribute m_cNewsReaderD.VB_VarHelpID = -1
Public WithEvents m_cNewsReaderE As cNewsReader
Attribute m_cNewsReaderE.VB_VarHelpID = -1
Public WithEvents m_cNewsReaderF As cNewsReader
Attribute m_cNewsReaderF.VB_VarHelpID = -1
Public WithEvents m_cNewsReaderG As cNewsReader
Attribute m_cNewsReaderG.VB_VarHelpID = -1
Public WithEvents m_cNewsReaderH As cNewsReader
Attribute m_cNewsReaderH.VB_VarHelpID = -1
Public A_StillRunning As Boolean

Private m_PacketNumberMax As Long

Private m_lngNumberOfThread As Long


'''''''''''''''''''''''''''''''''''''''''''''''''''''''
''

Public Property Let DownloadingMp3(pValue As Boolean)
    m_cNewsReader.m_blnDownloadingMp3 = pValue
    m_cNewsReaderB.m_blnDownloadingMp3 = pValue
    m_cNewsReaderC.m_blnDownloadingMp3 = pValue
    m_cNewsReaderD.m_blnDownloadingMp3 = pValue
    m_cNewsReaderE.m_blnDownloadingMp3 = pValue
    m_cNewsReaderF.m_blnDownloadingMp3 = pValue
    m_cNewsReaderG.m_blnDownloadingMp3 = pValue
    m_cNewsReaderH.m_blnDownloadingMp3 = pValue
End Property

Public Property Let GetMissingArticles(pValue As Boolean)
    m_cNewsReader.GetMissingArticles = pValue
    m_cNewsReaderB.GetMissingArticles = pValue
    m_cNewsReaderC.GetMissingArticles = pValue
    m_cNewsReaderD.GetMissingArticles = pValue
    m_cNewsReaderE.GetMissingArticles = pValue
    m_cNewsReaderF.GetMissingArticles = pValue
    m_cNewsReaderG.GetMissingArticles = pValue
    m_cNewsReaderH.GetMissingArticles = pValue
End Property

Public Property Get NumberOfThreads() As Long
    NumberOfThreads = m_lngNumberOfThread
End Property

Public Sub Disconnect()
    m_cNewsReader.Disconnect
    m_cNewsReaderB.Disconnect
    m_cNewsReaderC.Disconnect
    m_cNewsReaderD.Disconnect
    m_cNewsReaderE.Disconnect
    m_cNewsReaderF.Disconnect
    m_cNewsReaderG.Disconnect
    m_cNewsReaderH.Disconnect
    Call ResetLastDownloadedID
End Sub

Public Sub CheckFileNameOverride(pclsNewsreader As cNewsReader)
    If m_cNewsReader.m_LastFileID = pclsNewsreader.m_LastFileID And m_cNewsReader.index <> pclsNewsreader.index Then
        pclsNewsreader.m_LastFileName = m_cNewsReader.m_LastFileName
    End If
    If m_cNewsReaderB.m_LastFileID = pclsNewsreader.m_LastFileID And m_cNewsReaderB.index <> pclsNewsreader.index Then
        pclsNewsreader.m_LastFileName = m_cNewsReaderB.m_LastFileName
    End If
    If m_cNewsReaderC.m_LastFileID = pclsNewsreader.m_LastFileID And m_cNewsReaderC.index <> pclsNewsreader.index Then
        pclsNewsreader.m_LastFileName = m_cNewsReaderC.m_LastFileName
    End If
    If m_cNewsReaderD.m_LastFileID = pclsNewsreader.m_LastFileID And m_cNewsReaderD.index <> pclsNewsreader.index Then
        pclsNewsreader.m_LastFileName = m_cNewsReaderD.m_LastFileName
    End If
    If m_cNewsReaderE.m_LastFileID = pclsNewsreader.m_LastFileID And m_cNewsReaderE.index <> pclsNewsreader.index Then
        pclsNewsreader.m_LastFileName = m_cNewsReaderE.m_LastFileName
    End If
    If m_cNewsReaderF.m_LastFileID = pclsNewsreader.m_LastFileID And m_cNewsReaderF.index <> pclsNewsreader.index Then
        pclsNewsreader.m_LastFileName = m_cNewsReaderF.m_LastFileName
    End If
    If m_cNewsReaderG.m_LastFileID = pclsNewsreader.m_LastFileID And m_cNewsReaderG.index <> pclsNewsreader.index Then
        pclsNewsreader.m_LastFileName = m_cNewsReaderG.m_LastFileName
    End If
    If m_cNewsReaderH.m_LastFileID = pclsNewsreader.m_LastFileID And m_cNewsReaderH.index <> pclsNewsreader.index Then
        pclsNewsreader.m_LastFileName = m_cNewsReaderH.m_LastFileName
    End If
    End Sub

Public Sub RefreshThreads(pNumberOfThreads As Long)
    m_lngNumberOfThread = pNumberOfThreads
    If m_lngNumberOfThread < 2 Then
        m_cNewsReaderB.m_AutoAction = AutoActionENUM.None
    End If
    If m_lngNumberOfThread < 3 Then
        m_cNewsReaderC.m_AutoAction = AutoActionENUM.None
    End If
    
    If m_lngNumberOfThread > 1 And m_cNewsReaderB.m_AutoAction = AutoActionENUM.None And m_cNewsReader.m_AutoAction = AutoActionENUM.DownloadFiles Then
        m_cNewsReaderB.dDownloadFiles
    End If
    
    If m_lngNumberOfThread > 2 And m_cNewsReaderC.m_AutoAction = AutoActionENUM.None And m_cNewsReader.m_AutoAction = AutoActionENUM.DownloadFiles Then
        m_cNewsReaderC.dDownloadFiles
    End If
    
    If m_lngNumberOfThread > 3 And m_cNewsReaderD.m_AutoAction = AutoActionENUM.None And m_cNewsReader.m_AutoAction = AutoActionENUM.DownloadFiles Then
        m_cNewsReaderD.dDownloadFiles
    End If
    
    If m_lngNumberOfThread > 4 And m_cNewsReaderE.m_AutoAction = AutoActionENUM.None And m_cNewsReader.m_AutoAction = AutoActionENUM.DownloadFiles Then
        m_cNewsReaderE.dDownloadFiles
    End If
    
    If m_lngNumberOfThread > 5 And m_cNewsReaderF.m_AutoAction = AutoActionENUM.None And m_cNewsReader.m_AutoAction = AutoActionENUM.DownloadFiles Then
        m_cNewsReaderF.dDownloadFiles
    End If
    
    If m_lngNumberOfThread > 6 And m_cNewsReaderG.m_AutoAction = AutoActionENUM.None And m_cNewsReader.m_AutoAction = AutoActionENUM.DownloadFiles Then
        m_cNewsReaderG.dDownloadFiles
    End If
    
    If m_lngNumberOfThread > 7 And m_cNewsReaderH.m_AutoAction = AutoActionENUM.None And m_cNewsReader.m_AutoAction = AutoActionENUM.DownloadFiles Then
        m_cNewsReaderH.dDownloadFiles
    End If
    
    
End Sub

Public Sub ResetLastDownloadedID()
    If (m_cNewsReader.m_LastFileID > 0) Then
        Call Execute("UPDATE  File SET downloading=false WHERE UID=" & m_cNewsReader.m_LastFileID, True)
    End If
    If (m_cNewsReaderB.m_LastFileID > 0) Then
        Call Execute("UPDATE  File SET downloading=false WHERE UID=" & m_cNewsReaderB.m_LastFileID, True)
    End If
    If (m_cNewsReaderC.m_LastFileID > 0) Then
        Call Execute("UPDATE  File SET downloading=false WHERE UID=" & m_cNewsReaderC.m_LastFileID, True)
    End If
    If (m_cNewsReaderD.m_LastFileID > 0) Then
        Call Execute("UPDATE  File SET downloading=false WHERE UID=" & m_cNewsReaderD.m_LastFileID, True)
    End If
    If (m_cNewsReaderE.m_LastFileID > 0) Then
        Call Execute("UPDATE  File SET downloading=false WHERE UID=" & m_cNewsReaderE.m_LastFileID, True)
    End If
    If (m_cNewsReaderF.m_LastFileID > 0) Then
        Call Execute("UPDATE  File SET downloading=false WHERE UID=" & m_cNewsReaderF.m_LastFileID, True)
    End If
    If (m_cNewsReaderG.m_LastFileID > 0) Then
        Call Execute("UPDATE  File SET downloading=false WHERE UID=" & m_cNewsReaderG.m_LastFileID, True)
    End If
    If (m_cNewsReaderH.m_LastFileID > 0) Then
        Call Execute("UPDATE  File SET downloading=false WHERE UID=" & m_cNewsReaderH.m_LastFileID, True)
    End If
End Sub

Public Function CheckCurrentlyDownloadingIndex(pfileID As Long, pFileIndex As Integer, ByRef pReaderIndex As Long) As Boolean
    CheckCurrentlyDownloadingIndex = False
    If (m_cNewsReader.m_LastFileID = pfileID And m_cNewsReader.FileIndex = pFileIndex) Then
        CheckCurrentlyDownloadingIndex = True
        pReaderIndex = m_cNewsReader.index
    End If
    If (m_cNewsReaderB.m_LastFileID = pfileID And m_cNewsReaderB.FileIndex = pFileIndex) Then
        CheckCurrentlyDownloadingIndex = True
        pReaderIndex = m_cNewsReaderB.index
    End If
    If (m_cNewsReaderC.m_LastFileID = pfileID And m_cNewsReaderC.FileIndex = pFileIndex) Then
        CheckCurrentlyDownloadingIndex = True
        pReaderIndex = m_cNewsReaderC.index
    End If
    If (m_cNewsReaderD.m_LastFileID = pfileID And m_cNewsReaderD.FileIndex = pFileIndex) Then
        CheckCurrentlyDownloadingIndex = True
        pReaderIndex = m_cNewsReaderD.index
    End If
    If (m_cNewsReaderE.m_LastFileID = pfileID And m_cNewsReaderE.FileIndex = pFileIndex) Then
        CheckCurrentlyDownloadingIndex = True
        pReaderIndex = m_cNewsReaderE.index
    End If
    If (m_cNewsReaderF.m_LastFileID = pfileID And m_cNewsReaderF.FileIndex = pFileIndex) Then
        CheckCurrentlyDownloadingIndex = True
        pReaderIndex = m_cNewsReaderF.index
    End If
    If (m_cNewsReaderG.m_LastFileID = pfileID And m_cNewsReaderG.FileIndex = pFileIndex) Then
        CheckCurrentlyDownloadingIndex = True
        pReaderIndex = m_cNewsReaderG.index
    End If
    If (m_cNewsReaderH.m_LastFileID = pfileID And m_cNewsReaderH.FileIndex = pFileIndex) Then
        CheckCurrentlyDownloadingIndex = True
        pReaderIndex = m_cNewsReaderH.index
    End If
End Function

Public Sub DownloadFiles()
    m_cNewsReader.dDownloadFiles
    If m_lngNumberOfThread > 1 Then
        m_cNewsReaderB.dDownloadFiles
    End If
    If m_lngNumberOfThread > 2 Then
        m_cNewsReaderC.dDownloadFiles
    End If
    If m_lngNumberOfThread > 3 Then
        m_cNewsReaderD.dDownloadFiles
    End If
    If m_lngNumberOfThread > 4 Then
        m_cNewsReaderE.dDownloadFiles
    End If
    If m_lngNumberOfThread > 5 Then
        m_cNewsReaderF.dDownloadFiles
    End If
    If m_lngNumberOfThread > 6 Then
        m_cNewsReaderG.dDownloadFiles
    End If
    If m_lngNumberOfThread > 7 Then
        m_cNewsReaderH.dDownloadFiles
    End If
    
End Sub


Public Sub Init()
    Set m_cNewsReader = New cNewsReader
    Call m_cNewsReader.SetWinsock(AWinsock)
    m_cNewsReader.m_AutoAction = AutoActionENUM.None
    m_cNewsReader.index = 0
    
    Set m_cNewsReaderB = New cNewsReader
    Call m_cNewsReaderB.SetWinsock(BWinsock)
    m_cNewsReaderB.m_AutoAction = AutoActionENUM.None
    m_cNewsReaderB.index = 1
    
    Set m_cNewsReaderC = New cNewsReader
    Call m_cNewsReaderC.SetWinsock(CWinsock)
    m_cNewsReaderC.m_AutoAction = AutoActionENUM.None
    m_cNewsReaderC.index = 2
    
    Set m_cNewsReaderD = New cNewsReader
    Call m_cNewsReaderD.SetWinsock(DWinsock)
    m_cNewsReaderD.m_AutoAction = AutoActionENUM.None
    m_cNewsReaderD.index = 3
    
    Set m_cNewsReaderE = New cNewsReader
    Call m_cNewsReaderE.SetWinsock(EWinsock)
    m_cNewsReaderE.m_AutoAction = AutoActionENUM.None
    m_cNewsReaderE.index = 4
    
    Set m_cNewsReaderF = New cNewsReader
    Call m_cNewsReaderF.SetWinsock(FWinsock)
    m_cNewsReaderF.m_AutoAction = AutoActionENUM.None
    m_cNewsReaderF.index = 5
    
    Set m_cNewsReaderG = New cNewsReader
    Call m_cNewsReaderG.SetWinsock(GWinsock)
    m_cNewsReaderG.m_AutoAction = AutoActionENUM.None
    m_cNewsReaderG.index = 6
    
    Set m_cNewsReaderH = New cNewsReader
    Call m_cNewsReaderH.SetWinsock(HWinsock)
    m_cNewsReaderH.m_AutoAction = AutoActionENUM.None
    m_cNewsReaderH.index = 7

End Sub

'''''''''''''''''''''''''''''''''''''''''''''''''''''''

Private Sub GetOutputSegmentSize(ByRef pOutputSegSize As Long, ByRef pfilename As String, ByRef pLastFileID As Long, ByRef pLastArticleIndex As Long)
    Dim rstemp As Recordset
    If (OpenRecordset(rstemp, "SELECT * FROM [file] WHERE uid=" & pLastFileID, dbOpenSnapshot)) Then
        If (rstemp.EOF = False) Then
            If (rstemp!FileName <> "") Then
                pfilename = rstemp!FileName
                If (pLastArticleIndex <> 1) Then
                    pOutputSegSize = Val(rstemp!OutputSegmentSize & "")
                End If
            Else
            End If
        End If
    End If
End Sub


Private Sub ProcessMissingArticle(pArticleNumber As Long, pGroupID As Long)
    Execute ("INSERT INTO MissingArticle (GroupID,ArticleNumber) VALUES (" & pGroupID & "," & pArticleNumber & ")")
End Sub

Private Sub ProcessAllArticleList(pNewsReader As cNewsReader)
    ' check to see if there is more work to do
    If (FRMMain.CBONewsGroup.ListIndex < FRMMain.CBONewsGroup.ListCount - 1) Then
        FRMMain.CBONewsGroup.ListIndex = FRMMain.CBONewsGroup.ListIndex + 1
        pNewsReader.m_AutoAction = GetNewArticles
        pNewsReader.m_GroupName = FRMMain.CBONewsGroup.Text
        Call pNewsReader.SelectGroup
    Else
        pNewsReader.m_AutoAction = None
        MDIMain.LBLProgress(0).Caption = "Done"
        A_StillRunning = False
        'If B_StillRunning = False And C_StillRunning = False Then
'            Call m_rsArticle.UpdateBatch
'            m_rsArticle.Close
            ' Link articles to files
            Call FRMMain.ScanForFiles
            
            Call ProcessAutoHide(FRMMain.m_GroupTypeID)
            ' Look for IMDB tags
            'Call frmIMDBHolder.CMDGetIMDBTags_Click
            MDIMain.LBLAction = "All Done :), switching to download"
            Call FRMMain.CMDDownloadFiles_Click
        'End If
        ' Reset back to normal download
        pNewsReader.GetMissingArticles = False
        
        pNewsReader.FileIndex = -1
        'pNewsReader.dDownloadFiles
    End If
End Sub

Private Sub UpdateLastFileName(pNewsReader As cNewsReader, pfilename As String, pLastFileID As Long)
    Dim FileSystem As New FileSystemObject
    If m_cNewsReader.m_LastFileName <> pfilename Then
        
        On Error GoTo fileerror
        Call FileSystem.MoveFile(FRMOptions.TempDownloadPath & pNewsReader.m_LastFileName, FRMOptions.TempDownloadPath & pfilename)
        Call FileSystem.MoveFile(FRMOptions.TempDownloadPath & pNewsReader.m_LastFileName & ".txt", FRMOptions.TempDownloadPath & pfilename & ".txt")
fileerror:
        Call Execute("UPDATE [file] SET filename=" & Chr$(34) & pfilename & Chr$(34) & " WHERE uid=" & pLastFileID, True)
        If m_cNewsReader.m_LastFileID = pLastFileID Then
            m_cNewsReader.m_LastFileName = pfilename
        End If
        If m_cNewsReaderB.m_LastFileID = pLastFileID Then
            m_cNewsReaderB.m_LastFileName = pfilename
        End If
        If m_cNewsReaderC.m_LastFileID = pLastFileID Then
            m_cNewsReaderC.m_LastFileName = pfilename
        End If
        If m_cNewsReaderD.m_LastFileID = pLastFileID Then
            m_cNewsReaderD.m_LastFileName = pfilename
        End If
        If m_cNewsReaderE.m_LastFileID = pLastFileID Then
            m_cNewsReaderE.m_LastFileName = pfilename
        End If
        If m_cNewsReaderF.m_LastFileID = pLastFileID Then
            m_cNewsReaderF.m_LastFileName = pfilename
        End If
        If m_cNewsReaderG.m_LastFileID = pLastFileID Then
            m_cNewsReaderG.m_LastFileName = pfilename
        End If
        If m_cNewsReaderH.m_LastFileID = pLastFileID Then
            m_cNewsReaderH.m_LastFileName = pfilename
        End If
    End If
End Sub

'''''''''''''''''''''''''''''''''''''''''''''''''''''''
'' A

Private Sub m_cNewsReader_AddUpdateGroup(pName As String, pLowArticle As Double, pHighArticle As Double, pPostability As String)
    ' Store groups for update later
    m_Groups(m_MaxGroup).Name = pName
    'm_Groups(m_MaxGroup).LowArticle = pLowArticle
'    m_Groups(m_MaxGroup).HighArticle = pHighArticle
    m_Groups(m_MaxGroup).Postability = pPostability
    m_MaxGroup = m_MaxGroup + 1
End Sub

Private Sub m_cNewsReader_CancelDownloadArticleExpired()
    Call FRMMain.LogEvent("Article expired", 0)
    Call FRMMain.DownloadFile(m_cNewsReader)
End Sub

Private Sub m_cNewsReader_FileDownloadedSuccessfully(pLastFileID As Long)
    Call Execute("UPDATE [file] SET DownloadedSuccessfully=true WHERE uid=" & pLastFileID, True)
    FRMMain.m_lngLastCompleteFile = pLastFileID
End Sub

Private Sub m_cNewsReader_GetLastArticleForGroup(pLastArticleID As Long, pGroupID As Long, pServerID As Long)
    Static rstemp As Recordset
    
    If pServerID = 0 Then
        pLastArticleID = Val(GetServerSetting("GroupMax-" & pGroupID, False))
        
    Else
        If (OpenRecordset(rstemp, "SELECT Max(ArticleNumber) AS maxx FROM [Article2] WHERE GroupID=" & pGroupID, dbOpenSnapshot)) Then
            If (Val(rstemp!maxx & "") <> 0) Then
                pLastArticleID = Val(rstemp!maxx & "")
            End If
        End If
    End If
End Sub

Private Sub m_cNewsReader_GetOutputSegmentSize(pOutputSegSize As Long, pfilename As String, pLastFileID As Long, pLastArticleIndex As Long)
    Call GetOutputSegmentSize(pOutputSegSize, pfilename, pLastFileID, pLastArticleIndex)
End Sub

Private Sub m_cNewsReader_LogEvent(pName As String)
    Call FRMMain.LogEvent(pName, 0)
End Sub

Private Sub m_cNewsReader_MoveFile(pfilename As String, psubject As String)
    Call FRMMain.LogEvent("File Complete -" & pfilename, 0)
    
    Call FRMMain.MoveFile(pfilename, psubject)
End Sub

Private Sub m_cNewsReader_PacketRecieved(pNumber As Long)
    If (pNumber > m_PacketNumberMax) Then
        m_PacketNumberMax = pNumber
    End If
    MDIMain.LBLPacketNumber(0).Caption = "Packet =" & pNumber & "(" & m_PacketNumberMax & ")"
End Sub

Private Sub m_cNewsReader_ProcessAllArticleList()
    Call ProcessAllArticleList(m_cNewsReader)
End Sub

Private Sub m_cNewsReader_ProcessAllGroupsList()
    Static i As Long
    Static rstemp As Recordset
    Static server As Long
    Static NewGroups As Long
    Static maxlen As Long

    server = 0
    
    ' Update record
    For i = 0 To m_MaxGroup - 1
        If (OpenRecordset(rstemp, "SELECT * FROM [Group] WHERE groupname='" & Replace(Left$(m_Groups(i).Name, 128), "'", "''") & "' AND server=" & server, dbOpenDynaset)) Then
            If (rstemp.EOF = True) Then
                rstemp.AddNew
                NewGroups = NewGroups + 1
            End If
        
            If (Len(m_Groups(i).Name) > maxlen) Then
                maxlen = Len(m_Groups(i).Name)
            End If
            rstemp!GroupName = Left$(m_Groups(i).Name, 128)
            rstemp!LowArticle = m_Groups(i).LowArticle
            rstemp!HighArticle = m_Groups(i).HighArticle
            rstemp!Postability = m_Groups(i).Postability
            rstemp!server = server
            rstemp.Update
        
        End If
        
        If (i Mod 20 = 0) Then
        MDIMain.LBLProgress(0).Caption = i & "-" & m_MaxGroup & "(" & NewGroups & ")"
            DoEvents
        End If
    Next
    m_MaxGroup = 0
    MDIMain.LBLProgress(0).Caption = "Done"
End Sub

Private Sub m_cNewsReader_ProcessArticle(pArticleNumber As Long, psubject As String, pLineCount As Long, pPostDate As Date, pGroupID As Long, pLinesExpected As Long)
    Call FRMMain.ProcessArticle(pArticleNumber, psubject, pLineCount, pPostDate, pGroupID, pLinesExpected, 0)
End Sub

Private Sub m_cNewsReader_ProcessMissingArticle(pArticleNumber As Long, pGroupID As Long)
    Call ProcessMissingArticle(pArticleNumber, pGroupID)
End Sub

Private Sub m_cNewsReader_TriggerDownloadFile(pNextRecord As Boolean)
    Call FRMMain.DownloadFile(m_cNewsReader)
End Sub

Private Sub m_cNewsReader_UpdateLastFileName(pfilename As String, pLastFileID As Long)
    Call UpdateLastFileName(m_cNewsReader, pfilename, pLastFileID)
End Sub

Private Sub m_cNewsReader_UpdateRx(pData As String)
    FRMMain.TXTrx(0).Text = FRMMain.TXTrx(0).Text & pData
    FRMMain.TXTrx(0).SelStart = Len(FRMMain.TXTrx(0).Text)
End Sub

'''''''''''''''''''''''''''''
'' B

Private Sub m_cNewsReaderb_AddUpdateGroup(pName As String, pLowArticle As Double, pHighArticle As Double, pPostability As String)
    ' Store groups for update later
    m_Groups(m_MaxGroup).Name = pName
    m_Groups(m_MaxGroup).LowArticle = pLowArticle
    m_Groups(m_MaxGroup).HighArticle = pHighArticle
    m_Groups(m_MaxGroup).Postability = pPostability
    m_MaxGroup = m_MaxGroup + 1
End Sub

Private Sub m_cNewsReaderb_CancelDownloadArticleExpired()
    Call FRMMain.LogEvent("Article expired", 1)
    Call FRMMain.DownloadFile(m_cNewsReaderB)
End Sub

Private Sub m_cNewsReaderb_FileDownloadedSuccessfully(pLastFileID As Long)
    Call Execute("UPDATE [file] SET DownloadedSuccessfully=true WHERE uid=" & pLastFileID, True)
    FRMMain.m_lngLastCompleteFile = pLastFileID
End Sub

Private Sub m_cNewsReaderb_GetLastArticleForGroup(pLastArticleID As Long, pGroupID As Long, pServerID As Long)
    Dim rstemp As Recordset
    If pServerID = 0 Then
        pLastArticleID = Val(GetServerSetting("GroupMax-" & pGroupID, False))
    Else
        If (OpenRecordset(rstemp, "SELECT Max(ArticleNumber) AS maxx FROM [Article2] WHERE GroupID=" & pGroupID, dbOpenSnapshot)) Then
            If (Val(rstemp!maxx & "") <> 0) Then
                pLastArticleID = Val(rstemp!maxx & "")
            End If
        End If
    End If
End Sub

Private Sub m_cNewsReaderb_GetOutputSegmentSize(pOutputSegSize As Long, pfilename As String, pLastFileID As Long, pLastArticleIndex As Long)
    Call GetOutputSegmentSize(pOutputSegSize, pfilename, pLastFileID, pLastArticleIndex)
End Sub

Private Sub m_cNewsReaderb_LogEvent(pName As String)
    Call FRMMain.LogEvent(pName, 1)
End Sub

Private Sub m_cNewsReaderb_MoveFile(pfilename As String, psubject As String)
    Call FRMMain.LogEvent("File Complete -" & pfilename, 1)
    
    Call FRMMain.MoveFile(pfilename, psubject)
End Sub

Private Sub m_cNewsReaderb_PacketRecieved(pNumber As Long)
    If (pNumber > m_PacketNumberMax) Then
        m_PacketNumberMax = pNumber
    End If
    MDIMain.LBLPacketNumber(1).Caption = "Packet =" & pNumber & "(" & m_PacketNumberMax & ")"
End Sub

Private Sub m_cNewsReaderb_ProcessAllArticleList()
    Call ProcessAllArticleList(m_cNewsReaderB)
End Sub

Private Sub m_cNewsReaderB_ProcessArticle(pArticleNumber As Long, psubject As String, pLineCount As Long, pPostDate As Date, pGroupID As Long, pLinesExpected As Long)
    Call FRMMain.ProcessArticle(pArticleNumber, psubject, pLineCount, pPostDate, pGroupID, pLinesExpected, 1)
End Sub

Private Sub m_cNewsReaderB_ProcessMissingArticle(pArticleNumber As Long, pGroupID As Long)
    Call ProcessMissingArticle(pArticleNumber, pGroupID)
End Sub

Private Sub m_cNewsReaderb_TriggerDownloadFile(pNextRecord As Boolean)
    Call FRMMain.DownloadFile(m_cNewsReaderB)
End Sub

Private Sub m_cNewsReaderb_UpdateLastFileName(pfilename As String, pLastFileID As Long)
    Call UpdateLastFileName(m_cNewsReaderB, pfilename, pLastFileID)
End Sub

Private Sub m_cNewsReaderb_UpdateRx(pData As String)
    Call FRMMain.UpdateRx(m_cNewsReaderB.index, pData)
End Sub

 
'''''''''''''''''''''''''''''
'' C

Private Sub m_cNewsReaderc_AddUpdateGroup(pName As String, pLowArticle As Double, pHighArticle As Double, pPostability As String)
    ' Store groups for update later
    m_Groups(m_MaxGroup).Name = pName
    m_Groups(m_MaxGroup).LowArticle = pLowArticle
    m_Groups(m_MaxGroup).HighArticle = pHighArticle
    m_Groups(m_MaxGroup).Postability = pPostability
    m_MaxGroup = m_MaxGroup + 1
End Sub

Private Sub m_cNewsReaderc_CancelDownloadArticleExpired()
    Call FRMMain.LogEvent("Article expired", 2)
    Call FRMMain.DownloadFile(m_cNewsReaderC)
End Sub

Private Sub m_cNewsReaderc_FileDownloadedSuccessfully(pLastFileID As Long)
    Call Execute("UPDATE [file] SET DownloadedSuccessfully=true WHERE uid=" & pLastFileID, True)
    FRMMain.m_lngLastCompleteFile = pLastFileID
    'If m_blnGettingMissingArticles = True Then
    '    Set rsArticle = Nothing ' Force get next file, adjust later to use flag to move in downloadfile function
    'End If
End Sub

Private Sub m_cNewsReaderc_GetLastArticleForGroup(pLastArticleID As Long, pGroupID As Long, pServerID As Long)
    Dim rstemp As Recordset
    If pServerID = 0 Then
        pLastArticleID = Val(GetServerSetting("GroupMax-" & pGroupID, False))
    Else
        If (OpenRecordset(rstemp, "SELECT Max(ArticleNumber) AS maxx FROM [Article2] WHERE GroupID=" & pGroupID, dbOpenSnapshot)) Then
            If (Val(rstemp!maxx & "") <> 0) Then
                pLastArticleID = Val(rstemp!maxx & "")
            End If
        End If
    End If
End Sub

Private Sub m_cNewsReaderc_GetOutputSegmentSize(pOutputSegSize As Long, pfilename As String, pLastFileID As Long, pLastArticleIndex As Long)
    Call GetOutputSegmentSize(pOutputSegSize, pfilename, pLastFileID, pLastArticleIndex)
End Sub

Private Sub m_cNewsReaderc_LogEvent(pName As String)
    Call FRMMain.LogEvent(pName, 2)
End Sub

Private Sub m_cNewsReaderc_MoveFile(pfilename As String, psubject As String)
    Call FRMMain.LogEvent("File Complete -" & pfilename, 2)
    
    Call FRMMain.MoveFile(pfilename, psubject)
End Sub

Private Sub m_cNewsReaderc_PacketRecieved(pNumber As Long)
    If (pNumber > m_PacketNumberMax) Then
        m_PacketNumberMax = pNumber
    End If
    MDIMain.LBLPacketNumber(2).Caption = "Packet =" & pNumber & "(" & m_PacketNumberMax & ")"
End Sub

Private Sub m_cNewsReaderc_ProcessAllArticleList()
    Call ProcessAllArticleList(m_cNewsReaderC)
End Sub

Private Sub m_cNewsReaderC_ProcessArticle(pArticleNumber As Long, psubject As String, pLineCount As Long, pPostDate As Date, pGroupID As Long, pLinesExpected As Long)
    Call FRMMain.ProcessArticle(pArticleNumber, psubject, pLineCount, pPostDate, pGroupID, pLinesExpected, 2)
End Sub

Private Sub m_cNewsReaderC_ProcessMissingArticle(pArticleNumber As Long, pGroupID As Long)
    Call ProcessMissingArticle(pArticleNumber, pGroupID)
End Sub

Private Sub m_cNewsReaderc_TriggerDownloadFile(pNextRecord As Boolean)
    Call FRMMain.DownloadFile(m_cNewsReaderC)
End Sub

Private Sub m_cNewsReaderc_UpdateLastFileName(pfilename As String, pLastFileID As Long)
    Call UpdateLastFileName(m_cNewsReaderC, pfilename, pLastFileID)
End Sub

Private Sub m_cNewsReaderC_UpdateRx(pData As String)
    Call FRMMain.UpdateRx(m_cNewsReaderC.index, pData)
End Sub

'''''''''''''''''''''''''''''
'' D

Private Sub m_cNewsReaderd_AddUpdateGroup(pName As String, pLowArticle As Double, pHighArticle As Double, pPostability As String)
    ' Store groups for update later
    m_Groups(m_MaxGroup).Name = pName
    m_Groups(m_MaxGroup).LowArticle = pLowArticle
    m_Groups(m_MaxGroup).HighArticle = pHighArticle
    m_Groups(m_MaxGroup).Postability = pPostability
    m_MaxGroup = m_MaxGroup + 1
End Sub

Private Sub m_cNewsReaderd_CancelDownloadArticleExpired()
    Call FRMMain.DownloadFile(m_cNewsReaderD)
End Sub

Private Sub m_cNewsReaderd_FileDownloadedSuccessfully(pLastFileID As Long)
    Call Execute("UPDATE [file] SET DownloadedSuccessfully=true WHERE uid=" & pLastFileID, True)
    FRMMain.m_lngLastCompleteFile = pLastFileID
    'If m_blnGettingMissingArticles = True Then
    '    Set rsArticle = Nothing ' Force get next file, adjust later to use flag to move in downloadfile function
    'End If
End Sub

Private Sub m_cNewsReaderd_GetLastArticleForGroup(pLastArticleID As Long, pGroupID As Long, pServerID As Long)
    Dim rstemp As Recordset
    If pServerID = 0 Then
        pLastArticleID = Val(GetServerSetting("GroupMax-" & pGroupID, False))
    Else
        If (OpenRecordset(rstemp, "SELECT Max(ArticleNumber) AS maxx FROM [Article2] WHERE GroupID=" & pGroupID, dbOpenSnapshot)) Then
            If (Val(rstemp!maxx & "") <> 0) Then
                pLastArticleID = Val(rstemp!maxx & "")
            End If
        End If
    End If
End Sub

Private Sub m_cNewsReaderd_GetOutputSegmentSize(pOutputSegSize As Long, pfilename As String, pLastFileID As Long, pLastArticleIndex As Long)
    Call GetOutputSegmentSize(pOutputSegSize, pfilename, pLastFileID, pLastArticleIndex)
End Sub

Private Sub m_cNewsReaderd_LogEvent(pName As String)
    Call FRMMain.LogEvent(pName, m_cNewsReaderD.index)
End Sub

Private Sub m_cNewsReaderd_MoveFile(pfilename As String, psubject As String)
    Call FRMMain.LogEvent("File Complete -" & pfilename, m_cNewsReaderD.index)
    
    Call FRMMain.MoveFile(pfilename, psubject)
End Sub

Private Sub m_cNewsReaderd_ProcessAllArticleList()
    Call ProcessAllArticleList(m_cNewsReaderD)
End Sub

Private Sub m_cNewsReaderd_ProcessArticle(pArticleNumber As Long, psubject As String, pLineCount As Long, pPostDate As Date, pGroupID As Long, pLinesExpected As Long)
    Call FRMMain.ProcessArticle(pArticleNumber, psubject, pLineCount, pPostDate, pGroupID, pLinesExpected, 2)
End Sub

Private Sub m_cNewsReaderd_ProcessMissingArticle(pArticleNumber As Long, pGroupID As Long)
    Call ProcessMissingArticle(pArticleNumber, pGroupID)
End Sub

Private Sub m_cNewsReaderd_TriggerDownloadFile(pNextRecord As Boolean)
    Call FRMMain.DownloadFile(m_cNewsReaderD)
End Sub

Private Sub m_cNewsReaderd_UpdateLastFileName(pfilename As String, pLastFileID As Long)
    Call UpdateLastFileName(m_cNewsReaderD, pfilename, pLastFileID)
End Sub

Private Sub m_cNewsReaderD_UpdateRx(pData As String)
    Call FRMMain.UpdateRx(m_cNewsReaderC.index, pData)
End Sub

'''''''''''''''''''''''''''''
'' e

Private Sub m_cNewsReadere_AddUpdateGroup(pName As String, pLowArticle As Double, pHighArticle As Double, pPostability As String)
    ' Store groups for update later
    m_Groups(m_MaxGroup).Name = pName
    m_Groups(m_MaxGroup).LowArticle = pLowArticle
    m_Groups(m_MaxGroup).HighArticle = pHighArticle
    m_Groups(m_MaxGroup).Postability = pPostability
    m_MaxGroup = m_MaxGroup + 1
End Sub

Private Sub m_cNewsReadere_CancelDownloadArticleExpired()
    Call FRMMain.DownloadFile(m_cNewsReaderE)
End Sub

Private Sub m_cNewsReadere_FileDownloadedSuccessfully(pLastFileID As Long)
    Call Execute("UPDATE [file] SET DownloadedSuccessfully=true WHERE uid=" & pLastFileID, True)
    FRMMain.m_lngLastCompleteFile = pLastFileID
    'If m_blnGettingMissingArticles = True Then
    '    Set rsArticle = Nothing ' Force get next file, adjust later to use flag to move in downloadfile function
    'End If
End Sub

Private Sub m_cNewsReadere_GetLastArticleForGroup(pLastArticleID As Long, pGroupID As Long, pServerID As Long)
    Dim rstemp As Recordset
    If pServerID = 0 Then
        pLastArticleID = Val(GetServerSetting("GroupMax-" & pGroupID, False))
    Else
        If (OpenRecordset(rstemp, "SELECT Max(ArticleNumber) AS maxx FROM [Article2] WHERE GroupID=" & pGroupID, dbOpenSnapshot)) Then
            If (Val(rstemp!maxx & "") <> 0) Then
                pLastArticleID = Val(rstemp!maxx & "")
            End If
        End If
    End If
End Sub

Private Sub m_cNewsReadere_GetOutputSegmentSize(pOutputSegSize As Long, pfilename As String, pLastFileID As Long, pLastArticleIndex As Long)
    Call GetOutputSegmentSize(pOutputSegSize, pfilename, pLastFileID, pLastArticleIndex)
End Sub

Private Sub m_cNewsReaderE_LogEvent(pName As String)
    Call FRMMain.LogEvent(pName, m_cNewsReaderE.index)
End Sub

Private Sub m_cNewsReadere_MoveFile(pfilename As String, psubject As String)
    Call FRMMain.MoveFile(pfilename, psubject)
End Sub

Private Sub m_cNewsReadere_ProcessAllArticleList()
    Call ProcessAllArticleList(m_cNewsReaderE)
End Sub

Private Sub m_cNewsReadere_ProcessArticle(pArticleNumber As Long, psubject As String, pLineCount As Long, pPostDate As Date, pGroupID As Long, pLinesExpected As Long)
    Call FRMMain.ProcessArticle(pArticleNumber, psubject, pLineCount, pPostDate, pGroupID, pLinesExpected, 2)
End Sub

Private Sub m_cNewsReadere_ProcessMissingArticle(pArticleNumber As Long, pGroupID As Long)
    Call ProcessMissingArticle(pArticleNumber, pGroupID)
End Sub

Private Sub m_cNewsReadere_TriggerDownloadFile(pNextRecord As Boolean)
    Call FRMMain.DownloadFile(m_cNewsReaderE)
End Sub

Private Sub m_cNewsReadere_UpdateLastFileName(pfilename As String, pLastFileID As Long)
    Call UpdateLastFileName(m_cNewsReaderE, pfilename, pLastFileID)
End Sub

Private Sub m_cNewsReaderE_UpdateRX(pData As String)
    Call FRMMain.UpdateRx(m_cNewsReaderE.index, pData)
End Sub

'''''''''''''''''''''''''''''
'' f

Private Sub m_cNewsReaderf_AddUpdateGroup(pName As String, pLowArticle As Double, pHighArticle As Double, pPostability As String)
    ' Store groups for update later
    m_Groups(m_MaxGroup).Name = pName
    m_Groups(m_MaxGroup).LowArticle = pLowArticle
    m_Groups(m_MaxGroup).HighArticle = pHighArticle
    m_Groups(m_MaxGroup).Postability = pPostability
    m_MaxGroup = m_MaxGroup + 1
End Sub

Private Sub m_cNewsReaderf_CancelDownloadArticleExpired()
    Call FRMMain.DownloadFile(m_cNewsReaderF)
End Sub

Private Sub m_cNewsReaderf_FileDownloadedSuccessfully(pLastFileID As Long)
    Call Execute("UPDATE [file] SET DownloadedSuccessfully=true WHERE uid=" & pLastFileID, True)
    FRMMain.m_lngLastCompleteFile = pLastFileID
    'If m_blnGettingMissingArticles = True Then
    '    Set rsArticle = Nothing ' Force get next file, adjust later to use flag to move in downloadfile function
    'End If
End Sub

Private Sub m_cNewsReaderf_GetLastArticleForGroup(pLastArticleID As Long, pGroupID As Long, pServerID As Long)
    Dim rstemp As Recordset
    If pServerID = 0 Then
        pLastArticleID = Val(GetServerSetting("GroupMax-" & pGroupID, False))
    Else
        If (OpenRecordset(rstemp, "SELECT Max(ArticleNumber) AS maxx FROM [Article2] WHERE GroupID=" & pGroupID, dbOpenSnapshot)) Then
            If (Val(rstemp!maxx & "") <> 0) Then
                pLastArticleID = Val(rstemp!maxx & "")
            End If
        End If
    End If
End Sub

Private Sub m_cNewsReaderf_GetOutputSegmentSize(pOutputSegSize As Long, pfilename As String, pLastFileID As Long, pLastArticleIndex As Long)
    Call GetOutputSegmentSize(pOutputSegSize, pfilename, pLastFileID, pLastArticleIndex)
End Sub

Private Sub m_cNewsReaderF_LogEvent(pName As String)
    Call FRMMain.LogEvent(pName, m_cNewsReaderF.index)
End Sub

Private Sub m_cNewsReaderf_MoveFile(pfilename As String, psubject As String)
    Call FRMMain.MoveFile(pfilename, psubject)
End Sub

Private Sub m_cNewsReaderf_ProcessAllArticleList()
    Call ProcessAllArticleList(m_cNewsReaderF)
End Sub

Private Sub m_cNewsReaderf_ProcessArticle(pArticleNumber As Long, psubject As String, pLineCount As Long, pPostDate As Date, pGroupID As Long, pLinesExpected As Long)
    Call FRMMain.ProcessArticle(pArticleNumber, psubject, pLineCount, pPostDate, pGroupID, pLinesExpected, 2)
End Sub

Private Sub m_cNewsReaderf_ProcessMissingArticle(pArticleNumber As Long, pGroupID As Long)
    Call ProcessMissingArticle(pArticleNumber, pGroupID)
End Sub

Private Sub m_cNewsReaderf_TriggerDownloadFile(pNextRecord As Boolean)
    Call FRMMain.DownloadFile(m_cNewsReaderF)
End Sub

Private Sub m_cNewsReaderf_UpdateLastFileName(pfilename As String, pLastFileID As Long)
    Call UpdateLastFileName(m_cNewsReaderF, pfilename, pLastFileID)
End Sub

Private Sub m_cNewsReaderF_UpdateRX(pData As String)
    Call FRMMain.UpdateRx(m_cNewsReaderF.index, pData)
End Sub

'''''''''''''''''''''''''''''
'' g

Private Sub m_cNewsReaderg_AddUpdateGroup(pName As String, pLowArticle As Double, pHighArticle As Double, pPostability As String)
    ' Store groups for update later
    m_Groups(m_MaxGroup).Name = pName
    m_Groups(m_MaxGroup).LowArticle = pLowArticle
    m_Groups(m_MaxGroup).HighArticle = pHighArticle
    m_Groups(m_MaxGroup).Postability = pPostability
    m_MaxGroup = m_MaxGroup + 1
End Sub

Private Sub m_cNewsReaderg_CancelDownloadArticleExpired()
    Call FRMMain.DownloadFile(m_cNewsReaderG)
End Sub

Private Sub m_cNewsReaderg_FileDownloadedSuccessfully(pLastFileID As Long)
    Call Execute("UPDATE [file] SET DownloadedSuccessfully=true WHERE uid=" & pLastFileID, True)
    FRMMain.m_lngLastCompleteFile = pLastFileID
    'If m_blnGettingMissingArticles = True Then
    '    Set rsArticle = Nothing ' Force get next file, adjust later to use flag to move in downloadfile function
    'End If
End Sub

Private Sub m_cNewsReaderg_GetLastArticleForGroup(pLastArticleID As Long, pGroupID As Long, pServerID As Long)
    Dim rstemp As Recordset
    If pServerID = 0 Then
        pLastArticleID = Val(GetServerSetting("GroupMax-" & pGroupID, False))
    Else
        If (OpenRecordset(rstemp, "SELECT Max(ArticleNumber) AS maxx FROM [Article2] WHERE GroupID=" & pGroupID, dbOpenSnapshot)) Then
            If (Val(rstemp!maxx & "") <> 0) Then
                pLastArticleID = Val(rstemp!maxx & "")
            End If
        End If
    End If
End Sub

Private Sub m_cNewsReaderg_GetOutputSegmentSize(pOutputSegSize As Long, pfilename As String, pLastFileID As Long, pLastArticleIndex As Long)
    Call GetOutputSegmentSize(pOutputSegSize, pfilename, pLastFileID, pLastArticleIndex)
End Sub

Private Sub m_cNewsReaderG_LogEvent(pName As String)
    Call FRMMain.LogEvent(pName, m_cNewsReaderG.index)
End Sub

Private Sub m_cNewsReaderg_MoveFile(pfilename As String, psubject As String)
    Call FRMMain.MoveFile(pfilename, psubject)
End Sub

Private Sub m_cNewsReaderg_ProcessAllArticleList()
    Call ProcessAllArticleList(m_cNewsReaderG)
End Sub


Private Sub m_cNewsReaderg_ProcessArticle(pArticleNumber As Long, psubject As String, pLineCount As Long, pPostDate As Date, pGroupID As Long, pLinesExpected As Long)
    Call FRMMain.ProcessArticle(pArticleNumber, psubject, pLineCount, pPostDate, pGroupID, pLinesExpected, 2)
End Sub

Private Sub m_cNewsReaderg_ProcessMissingArticle(pArticleNumber As Long, pGroupID As Long)
    Call ProcessMissingArticle(pArticleNumber, pGroupID)
End Sub

Private Sub m_cNewsReaderg_TriggerDownloadFile(pNextRecord As Boolean)
    Call FRMMain.DownloadFile(m_cNewsReaderG)
End Sub

Private Sub m_cNewsReaderg_UpdateLastFileName(pfilename As String, pLastFileID As Long)
    Call UpdateLastFileName(m_cNewsReaderG, pfilename, pLastFileID)
End Sub

Private Sub m_cNewsReaderG_UpdateRX(pData As String)
    Call FRMMain.UpdateRx(m_cNewsReaderG.index, pData)
End Sub

'''''''''''''''''''''''''''''
'' h

Private Sub m_cNewsReaderh_AddUpdateGroup(pName As String, pLowArticle As Double, pHighArticle As Double, pPostability As String)
    ' Store groups for update later
    m_Groups(m_MaxGroup).Name = pName
    m_Groups(m_MaxGroup).LowArticle = pLowArticle
    m_Groups(m_MaxGroup).HighArticle = pHighArticle
    m_Groups(m_MaxGroup).Postability = pPostability
    m_MaxGroup = m_MaxGroup + 1
End Sub

Private Sub m_cNewsReaderh_CancelDownloadArticleExpired()
    Call FRMMain.DownloadFile(m_cNewsReaderH)
End Sub

Private Sub m_cNewsReaderh_FileDownloadedSuccessfully(pLastFileID As Long)
    Call Execute("UPDATE [file] SET DownloadedSuccessfully=true WHERE uid=" & pLastFileID, True)
    FRMMain.m_lngLastCompleteFile = pLastFileID
    'If m_blnGettingMissingArticles = True Then
    '    Set rsArticle = Nothing ' Force get next file, adjust later to use flag to move in downloadfile function
    'End If
End Sub

Private Sub m_cNewsReaderh_GetLastArticleForGroup(pLastArticleID As Long, pGroupID As Long, pServerID As Long)
    Dim rstemp As Recordset
    If pServerID = 0 Then
        pLastArticleID = Val(GetServerSetting("GroupMax-" & pGroupID, False))
    Else
        If (OpenRecordset(rstemp, "SELECT Max(ArticleNumber) AS maxx FROM [Article2] WHERE GroupID=" & pGroupID, dbOpenSnapshot)) Then
            If (Val(rstemp!maxx & "") <> 0) Then
                pLastArticleID = Val(rstemp!maxx & "")
            End If
        End If
    End If
End Sub

Private Sub m_cNewsReaderh_GetOutputSegmentSize(pOutputSegSize As Long, pfilename As String, pLastFileID As Long, pLastArticleIndex As Long)
    Call GetOutputSegmentSize(pOutputSegSize, pfilename, pLastFileID, pLastArticleIndex)
End Sub

Private Sub m_cNewsReaderH_LogEvent(pName As String)
    Call FRMMain.LogEvent(pName, m_cNewsReaderH.index)
End Sub

Private Sub m_cNewsReaderh_MoveFile(pfilename As String, psubject As String)
    Call FRMMain.MoveFile(pfilename, psubject)
End Sub

Private Sub m_cNewsReaderh_ProcessAllArticleList()
    Call ProcessAllArticleList(m_cNewsReaderH)
End Sub

Private Sub m_cNewsReaderh_ProcessArticle(pArticleNumber As Long, psubject As String, pLineCount As Long, pPostDate As Date, pGroupID As Long, pLinesExpected As Long)
    Call FRMMain.ProcessArticle(pArticleNumber, psubject, pLineCount, pPostDate, pGroupID, pLinesExpected, 2)
End Sub

Private Sub m_cNewsReaderh_ProcessMissingArticle(pArticleNumber As Long, pGroupID As Long)
    Call ProcessMissingArticle(pArticleNumber, pGroupID)
End Sub

Private Sub m_cNewsReaderh_TriggerDownloadFile(pNextRecord As Boolean)
    Call FRMMain.DownloadFile(m_cNewsReaderH)
End Sub


Private Sub m_cNewsReaderh_UpdateLastFileName(pfilename As String, pLastFileID As Long)
    Call UpdateLastFileName(m_cNewsReaderH, pfilename, pLastFileID)
End Sub

Private Sub m_cNewsReaderH_UpdateRX(pData As String)
    Call FRMMain.UpdateRx(m_cNewsReaderH.index, pData)
End Sub

'''''''''''''''''''''''''''''



VERSION 5.00
Object = "{8DDE6232-1BB0-11D0-81C3-0080C7A2EF7D}#3.0#0"; "Flp32a30.ocx"
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form FRMMain 
   Caption         =   "Debug Window"
   ClientHeight    =   9465
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   16410
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   631
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   1094
   WindowState     =   2  'Maximized
   Begin LpLib.fpList grdBitmapSmall 
      Height          =   4035
      Left            =   11520
      TabIndex        =   20
      Top             =   300
      Width           =   1935
      _Version        =   196608
      _ExtentX        =   3413
      _ExtentY        =   7117
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Serif"
         Size            =   6
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Enabled         =   -1  'True
      MousePointer    =   0
      Object.TabStop         =   0   'False
      BackColor       =   -2147483643
      ForeColor       =   -2147483640
      Columns         =   10
      Sorted          =   0
      LineWidth       =   1
      SelDrawFocusRect=   -1  'True
      ColumnSeparatorChar=   9
      ColumnSearch    =   -1
      ColumnWidthScale=   0
      RowHeight       =   -1
      MultiSelect     =   2
      WrapList        =   0   'False
      WrapWidth       =   0
      SelMax          =   -1
      AutoSearch      =   0
      SearchMethod    =   0
      VirtualMode     =   0   'False
      VRowCount       =   0
      DataSync        =   3
      ThreeDInsideStyle=   1
      ThreeDInsideHighlightColor=   -2147483633
      ThreeDInsideShadowColor=   -2147483642
      ThreeDInsideWidth=   1
      ThreeDOutsideStyle=   1
      ThreeDOutsideHighlightColor=   16777215
      ThreeDOutsideShadowColor=   -2147483632
      ThreeDOutsideWidth=   1
      ThreeDFrameWidth=   0
      BorderStyle     =   0
      BorderColor     =   -2147483642
      BorderWidth     =   1
      ThreeDOnFocusInvert=   0   'False
      ThreeDFrameColor=   -2147483633
      Appearance      =   0
      BorderDropShadow=   0
      BorderDropShadowColor=   -2147483632
      BorderDropShadowWidth=   0
      ScrollHScale    =   2
      ScrollHInc      =   0
      ColsFrozen      =   0
      ScrollBarV      =   2
      NoIntegralHeight=   0   'False
      HighestPrecedence=   0
      AllowColResize  =   1
      AllowColDragDrop=   0
      ReadOnly        =   0   'False
      VScrollSpecial  =   0   'False
      VScrollSpecialType=   0
      EnableKeyEvents =   -1  'True
      EnableTopChangeEvent=   -1  'True
      DataAutoHeadings=   -1  'True
      DataAutoSizeCols=   2
      SearchIgnoreCase=   -1  'True
      ScrollBarH      =   3
      VirtualPageSize =   0
      VirtualPagesAhead=   0
      ExtendCol       =   0
      ColumnLevels    =   1
      ListGrayAreaColor=   -2147483637
      GroupHeaderHeight=   -1
      GroupHeaderShow =   -1  'True
      AllowGrpResize  =   0
      AllowGrpDragDrop=   0
      MergeAdjustView =   0   'False
      ColumnHeaderShow=   -1  'True
      ColumnHeaderHeight=   -1
      GrpsFrozen      =   0
      BorderGrayAreaColor=   -2147483637
      ExtendRow       =   0
      DataField       =   ""
      OLEDragMode     =   0
      OLEDropMode     =   0
      Redraw          =   -1  'True
      ResizeRowToFont =   0   'False
      TextTipMultiLine=   0
      ColDesigner     =   "FRMMain.frx":0000
   End
   Begin LpLib.fpList GRDBitmap 
      Height          =   6015
      Left            =   5880
      TabIndex        =   9
      Top             =   300
      Width           =   2775
      _Version        =   196608
      _ExtentX        =   4895
      _ExtentY        =   10610
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Serif"
         Size            =   6
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Enabled         =   -1  'True
      MousePointer    =   0
      Object.TabStop         =   0   'False
      BackColor       =   -2147483643
      ForeColor       =   -2147483640
      Columns         =   10
      Sorted          =   0
      LineWidth       =   1
      SelDrawFocusRect=   -1  'True
      ColumnSeparatorChar=   9
      ColumnSearch    =   -1
      ColumnWidthScale=   0
      RowHeight       =   -1
      MultiSelect     =   2
      WrapList        =   0   'False
      WrapWidth       =   0
      SelMax          =   -1
      AutoSearch      =   0
      SearchMethod    =   0
      VirtualMode     =   0   'False
      VRowCount       =   0
      DataSync        =   3
      ThreeDInsideStyle=   1
      ThreeDInsideHighlightColor=   -2147483633
      ThreeDInsideShadowColor=   -2147483642
      ThreeDInsideWidth=   1
      ThreeDOutsideStyle=   1
      ThreeDOutsideHighlightColor=   16777215
      ThreeDOutsideShadowColor=   -2147483632
      ThreeDOutsideWidth=   1
      ThreeDFrameWidth=   0
      BorderStyle     =   0
      BorderColor     =   -2147483642
      BorderWidth     =   1
      ThreeDOnFocusInvert=   0   'False
      ThreeDFrameColor=   -2147483633
      Appearance      =   0
      BorderDropShadow=   0
      BorderDropShadowColor=   -2147483632
      BorderDropShadowWidth=   0
      ScrollHScale    =   2
      ScrollHInc      =   0
      ColsFrozen      =   0
      ScrollBarV      =   2
      NoIntegralHeight=   0   'False
      HighestPrecedence=   0
      AllowColResize  =   1
      AllowColDragDrop=   0
      ReadOnly        =   0   'False
      VScrollSpecial  =   0   'False
      VScrollSpecialType=   0
      EnableKeyEvents =   -1  'True
      EnableTopChangeEvent=   -1  'True
      DataAutoHeadings=   -1  'True
      DataAutoSizeCols=   2
      SearchIgnoreCase=   -1  'True
      ScrollBarH      =   3
      VirtualPageSize =   0
      VirtualPagesAhead=   0
      ExtendCol       =   0
      ColumnLevels    =   1
      ListGrayAreaColor=   -2147483637
      GroupHeaderHeight=   -1
      GroupHeaderShow =   -1  'True
      AllowGrpResize  =   0
      AllowGrpDragDrop=   0
      MergeAdjustView =   0   'False
      ColumnHeaderShow=   -1  'True
      ColumnHeaderHeight=   -1
      GrpsFrozen      =   0
      BorderGrayAreaColor=   -2147483637
      ExtendRow       =   0
      DataField       =   ""
      OLEDragMode     =   0
      OLEDropMode     =   0
      Redraw          =   -1  'True
      ResizeRowToFont =   0   'False
      TextTipMultiLine=   0
      ColDesigner     =   "FRMMain.frx":051A
   End
   Begin VB.CommandButton cmdPar 
      Caption         =   "Par"
      Height          =   255
      Left            =   120
      TabIndex        =   24
      Top             =   3720
      Width           =   855
   End
   Begin VB.CheckBox chkautofix 
      Caption         =   "autofix"
      Height          =   375
      Left            =   4080
      TabIndex        =   23
      Top             =   1560
      Width           =   1215
   End
   Begin VB.ListBox LSTTx 
      Height          =   2790
      Index           =   7
      Left            =   12360
      TabIndex        =   19
      Top             =   6420
      Width           =   1935
   End
   Begin VB.ListBox LSTTx 
      Height          =   2790
      Index           =   6
      Left            =   10320
      TabIndex        =   18
      Top             =   6420
      Width           =   1935
   End
   Begin VB.ListBox LSTTx 
      Height          =   2790
      Index           =   5
      Left            =   8280
      TabIndex        =   17
      Top             =   6420
      Width           =   1935
   End
   Begin VB.ListBox LSTTx 
      Height          =   2790
      Index           =   4
      Left            =   6240
      TabIndex        =   16
      Top             =   6420
      Width           =   1935
   End
   Begin VB.ListBox LSTTx 
      Height          =   2790
      Index           =   3
      Left            =   4200
      TabIndex        =   15
      Top             =   6420
      Width           =   1935
   End
   Begin VB.ComboBox CBONewsGroup 
      Enabled         =   0   'False
      Height          =   315
      Left            =   2100
      Style           =   2  'Dropdown List
      TabIndex        =   13
      Top             =   3720
      Width           =   3135
   End
   Begin VB.ListBox LSTTx 
      Height          =   2790
      Index           =   2
      Left            =   2160
      TabIndex        =   12
      Top             =   6420
      Width           =   1935
   End
   Begin VB.ListBox LSTTx 
      Height          =   2790
      Index           =   1
      Left            =   120
      TabIndex        =   11
      Top             =   6420
      Width           =   1935
   End
   Begin VB.CommandButton CMDClear 
      Caption         =   "Clear"
      Height          =   255
      Left            =   120
      TabIndex        =   8
      Top             =   4080
      Width           =   855
   End
   Begin VB.Frame Frame1 
      Caption         =   "Debug"
      Height          =   255
      Left            =   120
      TabIndex        =   7
      Top             =   3420
      Width           =   5535
   End
   Begin VB.Frame FRADownloadOptions 
      Caption         =   "Download Options"
      Height          =   255
      Left            =   120
      TabIndex        =   6
      Top             =   2460
      Width           =   5535
   End
   Begin VB.CommandButton CMDDownloadFiles 
      Caption         =   "Download Files"
      Height          =   375
      Left            =   1560
      TabIndex        =   4
      Top             =   2940
      Width           =   1455
   End
   Begin VB.CommandButton CMDViewFiles 
      Caption         =   "View Files"
      Height          =   375
      Left            =   3120
      TabIndex        =   3
      Top             =   2940
      Width           =   1095
   End
   Begin VB.CommandButton CMDGetAllGroups 
      Caption         =   "Get All Groups"
      Height          =   375
      Left            =   4440
      TabIndex        =   1
      Top             =   2940
      Width           =   1215
   End
   Begin VB.Timer Tmr 
      Interval        =   500
      Left            =   4920
      Top             =   3900
   End
   Begin VB.CommandButton CMDGetNewArticles 
      Caption         =   "Get New Articles"
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   2940
      Width           =   1335
   End
   Begin VB.TextBox TXTrx 
      Height          =   1935
      Index           =   0
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   2
      Top             =   4380
      Width           =   5655
   End
   Begin VB.ListBox LSTTx 
      Height          =   2010
      Index           =   0
      Left            =   120
      TabIndex        =   10
      Top             =   300
      Width           =   5535
   End
   Begin MSWinsockLib.Winsock Winsock1 
      Left            =   5400
      Top             =   3840
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.Label lblFilename 
      Caption         =   "<Filename>"
      Height          =   255
      Index           =   1
      Left            =   11520
      TabIndex        =   22
      Top             =   60
      Width           =   4815
   End
   Begin VB.Label lblFilename 
      Caption         =   "<Filename>"
      Height          =   255
      Index           =   0
      Left            =   5880
      TabIndex        =   21
      Top             =   60
      Width           =   5415
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "Ne&wsgroup"
      Height          =   195
      Left            =   1080
      TabIndex        =   14
      Top             =   3780
      Width           =   810
   End
   Begin VB.Label LBLWinsockState 
      Caption         =   "<Winsock State>"
      Height          =   255
      Left            =   1080
      TabIndex        =   5
      Top             =   4080
      Width           =   2535
   End
End
Attribute VB_Name = "FRMMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Option Compare Text
''*************************************************************************
'' Main form, contains all the start points and is database access hub
''
'' Coded by Dale Pitman - PyroDesign

Private m_lngStart As Long
Private m_BitmapProcessor As New cBitmapProcessor
Private m_GroupPath As String

Private m_Mp3StyleFileNameProcessing As Boolean

Dim m_FileCache(500) As FileTYPE '' Used to store file UID's, while updating article list
Dim m_FileCacheMax As Long  '' Current size of cache
Dim m_FileCachePtr As Long  '' Internal pointer within cache (so cache becomes a queue(LIFO))
Const cFileCacheSize = 50   '' Optimum size seems to be about 30/thread
Dim m_FileCacheCurrentSize As Long

Public m_GroupTypeID As Long

Private Type FileTYPE
    Subject As String
    FileName As String
    UID As Long
    TotalArticles As Long
End Type

'' Search criteria(Input Parameters)


'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Public m_lngDatabase As Long
Public m_lngDBSearch As Long
Private m_blnGettingMissingArticles As Boolean
Private m_lngCacheSearch As Long
Private m_lngSubjectProcessing As Long
Private m_dtProcessArticleStartTime As Date
Public m_lngLastCompleteFile As Long

'' All articles for the current file
Private m_ArticleID() As ArticleType
Private m_ArticleMax As Long

Private rsfile As Recordset

Private m_rsMissingArticle As Recordset
Private m_ArticleProcessor As New cArticleProcessing

Public m_IgnorePaths As Recordset
Private m_File(1) As Long
Private m_FileArticles(1) As Long
Private m_month As Long

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Public Sub GetIgnorePaths()
    Call OpenRecordset(m_IgnorePaths, "SELECT * FROM IgnorePaths", dbOpenSnapshot)
End Sub

Public Sub ChangeGroupType(cbo As ComboBox)
    Dim rstemp As Recordset
    Dim sql As String
    Dim i As Long
    Dim t As Long
    
    For i = 0 To MDIMain.mnuGroupType.Count - 1
        MDIMain.mnuGroupType(i).Checked = False
    Next
    MDIMain.mnuGroupType(cbo.ListIndex).Checked = True
    MDIMain.mnuSelectedGroupType.Caption = "Current - " & MDIMain.CBOGroupType.Text
    
    Call CBONewsGroup.Clear
    If (cbo.ListIndex = 0) Then
        ' all
        sql = "SELECT * FROM [group] WHERE grouptypeid>0"
        m_GroupTypeID = -1
    Else
        If (OpenRecordset(rstemp, "SELECT * FROM [grouptype] WHERE uid=" & cbo.ItemData(cbo.ListIndex), dbOpenSnapshot)) Then
            m_GroupTypeID = rstemp!UID
            m_GroupPath = rstemp!downloadpath & ""
            If m_GroupPath = "" Then
                m_GroupPath = "C:\"
                Call MsgBox("No download path has been set for this group, please go into 'Add/Remove groups' and set the download path.", vbExclamation, "Group download path")
            End If
            frmIMDBHolder.m_SearchForIMDB = rstemp!searchforimdb
        End If
        sql = "SELECT * FROM [group] WHERE grouptypeid=" & m_GroupTypeID
    End If
    
    i = 0
    If (OpenRecordset(rstemp, sql, dbOpenSnapshot)) Then
        Do While (rstemp.EOF = False)
            Call CBONewsGroup.AddItem(rstemp!GroupName)
            If i > MDIMain.mnuSelected.Count - 1 Then
                Load MDIMain.mnuSelected(i)
                MDIMain.mnuSelected(i).Visible = True
            End If
            MDIMain.mnuSelected(i).Caption = rstemp!GroupName
            i = i + 1
            
            Call rstemp.MoveNext
        Loop
        If i > 0 Then
            For t = i To MDIMain.mnuSelected.Count - 1
                MDIMain.mnuSelected(t).Visible = False
            Next
        End If
        If (CBONewsGroup.ListCount > 0) Then
            CBONewsGroup.ListIndex = 0
        End If
    End If
    
    If (m_GroupTypeID = 2) Then
        frmReaderHolder.DownloadingMp3 = True
        m_Mp3StyleFileNameProcessing = True
    Else
        frmReaderHolder.DownloadingMp3 = False
        m_Mp3StyleFileNameProcessing = False
    End If
'    Call FRMViewFiles.RefreshGroupID(m_GroupTypeID)
End Sub

Private Sub CMDClear_Click()
    TXTrx(0).Text = ""
End Sub

Public Sub UpdateRx(pIndex As Long, pString As String)
    TXTrx(0).Text = TXTrx(0).Text & pIndex & ":" & pString
    TXTrx(0).SelStart = Len(TXTrx(0).Text)
End Sub


''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'' Form objects

Public Sub CMDDownloadFiles_Click()
    Call frmReaderHolder.ResetLastDownloadedID
    
    'Set rsArticle = Nothing
    ReDim m_ArticleID(0) As ArticleType
    m_ArticleMax = 1
    Set rsfile = Nothing
    m_blnGettingMissingArticles = False
    frmReaderHolder.GetMissingArticles = False
    
    frmReaderHolder.DownloadFiles
End Sub

Public Sub CMDGetAllGroups_Click()
    ReDim m_Groups(100000) As GroupTYPE
    m_MaxGroup = 0
    frmReaderHolder.m_cNewsReader.DGetAllGroups
End Sub

Private Sub cmdPar_Click()
Call CheckSchedule(True)
End Sub

Public Sub CMDViewFiles_Click()
    Call ShowForm(FRMViewFiles)
End Sub

'' Set forms location, as stored in registory
Private Sub Form_Load()
    Dim threads As Long
    Dim i As Long
    Dim t As Long
    
    
    ReDim m_ArticleID(0) As ArticleType
    m_ArticleMax = 1
    
    m_month = Val(GetServerSetting("Month", False))
    If m_month <> Format(Now, "mm") Then
        Call SetServerSetting("Month", Format(Now, "mm"))
        m_month = Format(Now, "mm")
        Call SetServerSetting("BytesTotal", 0)
    End If
    m_BytesTotal = Val(GetServerSetting("BytesTotal", False))
    
    frmReaderHolder.Init
    
    Dim rstemp As Recordset
    MDIMain.CBOGroupType.Clear
    Call MDIMain.CBOGroupType.AddItem("ALL")
    MDIMain.mnuGroupType(i).Caption = "All"
    
    i = 1
    If (OpenRecordset(rstemp, "SELECT * FROM grouptype", dbOpenSnapshot)) Then
        Do While (rstemp.EOF = False)
            Call MDIMain.CBOGroupType.AddItem(rstemp!Name)
            MDIMain.CBOGroupType.ItemData(MDIMain.CBOGroupType.ListCount - 1) = rstemp!UID
            
            If i > MDIMain.mnuGroupType.Count - 1 Then
                Load MDIMain.mnuGroupType(i)
                MDIMain.mnuGroupType(i).Visible = True
            End If
            MDIMain.mnuGroupType(i).Caption = rstemp!Name
            i = i + 1
            
            Call rstemp.MoveNext
        Loop
        If i > 0 Then
            For t = i To MDIMain.mnuSelected.Count - 1
                MDIMain.mnuSelected(t).Visible = False
            Next
        End If
        
        If (MDIMain.CBOGroupType.ListCount > 1) Then
            MDIMain.CBOGroupType.ListIndex = 1
            MDIMain.mnuSelectedGroupType.Caption = "Current - " & MDIMain.CBOGroupType.Text
        End If
    End If

    If (CBONewsGroup.ListCount > 0) Then
        CBONewsGroup.ListIndex = 0
    End If
    
    Call AllFormsLoad(Me)
    
    threads = GetSetting(cRegistoryName, "Settings", "Threads", 3)
    Call MDIMain.mnuThreads_Click(threads - 1)
    lblFilename(0).Caption = ""
    lblFilename(1).Caption = ""
    
End Sub

'' Save forms location
Private Sub Form_Unload(Cancel As Integer)
    Call SetServerSetting("BytesTotal", CStr(m_BytesTotal))
    
    Call frmReaderHolder.ResetLastDownloadedID
    
    Call GetWindowPosition(Me)
    Call AllFormsUnLoad(Me)
End Sub

''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''

Private Sub CheckSchedule(bForce As Boolean)
    Static ScheduleRun As Boolean
    Static ScheduleArticleUpdateRun As Boolean
    Static ScheduleRunning As Boolean
    Static ParFilename As String
    Static LastExecuteTime As Date
    Static FileList(1000) As String
    Static FileListMax As Long
    Static FileListIndex As Long
    Static rsGroups As Recordset
    
    Static StartSchedule As Boolean
    Static i As Long
    Static dblBytesTotal As Double
    If bForce = True Then
        StartSchedule = True
    End If
    
    If FRMOptions.StartPars = True Then
        'StartSchedule = False
        For i = 0 To 22
            If FRMOptions.Schedule(i) = True And Format(Now, "hh") >= i And Format(Now, "hh") < i + 1 Then
                StartSchedule = True
            End If
        Next
    
        ' Only run at night
        If StartSchedule = True Then
            
            ' If its the first day of the month then reset the amount downloaded
            If Day(Now) = 1 Then
                m_BytesTotal = 0
            End If
    
            If ScheduleArticleUpdateRun = False Then
                Call SetServerSetting("BytesTotal", CStr(m_BytesTotal))
                Call cmdGetNewArticles_Click
                ScheduleArticleUpdateRun = True
            End If
            
            If ScheduleRun = False Then
                
                ' Wait 3min before starting another par2
                If DateDiff("n", LastExecuteTime, Now) >= 3 Then
                    If ScheduleRunning = False Then
                        FileListIndex = 0
                        FileListMax = 0
                        
                        Call OpenRecordset(rsGroups, "SELECT distinct Downloadpath FROM [grouptype]", dbOpenSnapshot)
                        
                        Do While rsGroups.EOF = False
                            ParFilename = Dir(rsGroups!downloadpath & "*.par2")
                            Do While ParFilename <> ""
                                If InStr(1, ParFilename, "vol", vbTextCompare) = 0 And ParFilename <> "" Then
                                    FileList(FileListMax) = rsGroups!downloadpath & ParFilename
                                    FileListMax = FileListMax + 1
                                End If
                                ParFilename = Dir()
                            Loop
                            Call rsGroups.MoveNext
                        Loop
                        Call rsGroups.Close
                            
                        ScheduleRunning = True
                    End If
                    
                    ParFilename = FileList(FileListIndex)
                    FileListIndex = FileListIndex + 1
                    
                    If FileListIndex < FileListMax Then
                        'App.Path = "C:\Program Files\"
                        Call Shell("C:\Program Files\QuickPar\QuickPar.exe " & Chr$(34) & ParFilename & Chr$(34), vbNormalFocus)
                        LastExecuteTime = Now
                    Else
                        ScheduleRun = True
                        StartSchedule = False
                    End If
                End If
            End If
        Else
            LastExecuteTime = Now
            ScheduleRun = False
            ScheduleArticleUpdateRun = False
            ScheduleRunning = False
        End If
    End If
End Sub

Private Sub CheckDownload()
    Static ScheduleRun As Boolean
    
    Static StartSchedule As Boolean
    Static i As Long
    
    StartSchedule = False
    For i = 0 To 22
        If FRMOptions.Download(i) = True And Format(Now, "hh") >= i And Format(Now, "hh") < i + 1 Then
            StartSchedule = True
        End If
    Next

    ' Only run at night
    If StartSchedule = True Then
        If ScheduleRun = False Then
            If MDIMain.LBLProgress(0).Caption = "Inactive" Then
                Call CMDDownloadFiles_Click
            End If
            ScheduleRun = True
        End If
    Else
        If ScheduleRun = True Then
            frmReaderHolder.Disconnect
            MDIMain.LBLProgress(0).Caption = "Inactive"
            MDIMain.LBLProgress(1).Caption = "Inactive"
            MDIMain.LBLProgress(2).Caption = "Inactive"
            MDIMain.LBLProgress(3).Caption = "Inactive"
            MDIMain.LBLProgress(4).Caption = "Inactive"
            MDIMain.LBLProgress(5).Caption = "Inactive"
            MDIMain.LBLProgress(6).Caption = "Inactive"
            MDIMain.LBLProgress(7).Caption = "Inactive"
        End If
        ScheduleRun = False
    End If
End Sub

Private Sub Tmr_Timer()
    Static ClearByteCounter As Long
    Static packetString As String
    Dim i As Double
    Dim t As Double
    'Static ZeroCount As Long
    ClearByteCounter = ClearByteCounter + 1
    If (ClearByteCounter = 4) Then
    t = 2
    i = m_BytesFor2Second '\ 2# '\ 1024#
    i = i / t
    t = 1024
    i = i / 1024
    
        If packetString <> MDIMain.LBLProgress(0).Caption Then
            packetString = MDIMain.LBLProgress(0).Caption
        Else
            If chkautofix.Value = vbChecked And packetString <> "Inactive" Then
                Call CMDDownloadFiles_Click
            End If
        End If
        
        MDIMain.LBLTransfer = "KB / sec =" & (i)
        MDIMain.LBLTransfer.Refresh
        'Call CheckSchedule(False)
        'Call CheckDownload
        ClearByteCounter = 0
        
        If m_BytesFor2Second > 0 Then
            m_BytesTotal = m_BytesTotal + m_BytesFor2Second
        End If
        
        If m_month <> Format(Now, "mm") Then
            Call SetServerSetting("Month", Format(Now, "mm"))
            Call SetServerSetting("BytesTotal", 0)
            m_month = Format(Now, "mm")
        End If
        
        
        MDIMain.lblBytesTotal = "GB Total =" & Format((m_BytesTotal) / 1024 / 1024 / 1024, "###,###,##0.00")
        
        
        m_BytesFor2Second = 0
    End If
End Sub

''''''''''''''''''''''''''''''


'''''''''''''''''''''''''''''''''

Public Sub LogEvent(pName As String, Index As Long)
    If (InStr(pName, "authinfo") > 0) Then
        ' Dont show password/ username info
        Call LSTTx(Index).AddItem(Left$(Replace(pName, vbCrLf, ""), InStrRev(pName, " ")) & "****")
    Else
        Call LSTTx(Index).AddItem(Replace(pName, vbCrLf, ""))
    End If
    LSTTx(Index).Selected(LSTTx(Index).ListCount - 1) = True
    If (LSTTx(Index).ListCount > 50) Then
        LSTTx(Index).Clear
    End If
End Sub

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Private Function TargetFilesExists(pfilename As String) As Boolean
    Dim TargetPath As String
    
    TargetPath = GetTargetFilePath(pfilename, "", False)
    
    If (Dir$(TargetPath & pfilename, vbNormal) <> "") Then
        TargetFilesExists = True
    Else
        TargetFilesExists = False
    End If
    
End Function

'''''''''''''''''''''''''''''''''''
'' Update the current articles field depending on how many article records are attached
'' to the current file
Public Sub ScanForFiles()
    Dim rstemp As Recordset
    Dim rsfile As Recordset
    Dim i As Long
    
    Dim LastFilename As String
    Dim ids() As ArticleType
    Dim ArticleCount As Long
    
    Screen.MousePointer = vbHourglass
    MDIMain.LBLAction = "Scanning articles for files"
    
    ' Update files and remove old files
    MDIMain.LBLAction = "Updating files table"
    i = 0
    If (OpenRecordset(rsfile, "SELECT * FROM file WHERE GroupTypeID=" & m_GroupTypeID & " AND TotalArticles>CurrentArticles", dbOpenDynaset)) Then
        Do While (rsfile.EOF = False)
            On Error GoTo error
            Call GetAllArticlesByFileID(rsfile!UID, ids)
            ArticleCount = UBound(ids) + 1
            
            rsfile!currentarticles = ArticleCount
            'LastFileName = rsfile!Name
        
            i = i + 1
            If (i Mod 20 = 0) Then
                DoEvents
                MDIMain.LBLAction = "Updating files table - " & i
            End If
        
            Call rsfile.MoveNext
        Loop
    
    End If
    
    MDIMain.LBLAction = "Done"
    Screen.MousePointer = vbDefault
    Exit Sub
error:
    ArticleCount = 0
    Resume Next
End Sub

Public Sub cmdGetNewArticles_Click()
   
    Call Execute("DELETE FROM [File] WHERE [PostDate] > #" & Format(DateAdd("yyyy", -1, Now), "mm/dd/yyyy") & "# AND [PostDate] <#" & Format(DateAdd("m", -1, Now), "mm/dd/yyyy") & "#", True)
    m_lngDatabase = 0
    m_FileCacheMax = 0
    m_FileCachePtr = 0
    
    Call frmReaderHolder.Disconnect
    
    frmReaderHolder.GetMissingArticles = False
    
    If CBONewsGroup.ListCount > 0 Then
        CBONewsGroup.ListIndex = 0
        m_dtProcessArticleStartTime = Now
        m_blnGettingMissingArticles = False
        
        frmReaderHolder.A_StillRunning = True
        frmReaderHolder.m_cNewsReader.m_GroupName = CBONewsGroup.Text
        frmReaderHolder.m_cNewsReader.DGetNewArticles
        
        m_FileCacheCurrentSize = 3 * cFileCacheSize
        
        m_lngStart = GetTickCount
    Else
        Call MsgBox("No newsgroups belong to this group, please use 'Add/Remove groups' to add some.", vbExclamation, "Get new articles")
    End If
End Sub

Private Function getnextfile() As Boolean

    getnextfile = True
getnextfile:
    ' Get the file list
    If (OpenRecordset(rsfile, "SELECT * FROM [File] f WHERE f.downloadfile=true AND f.downloadedsuccessfully=false AND f.downloading=false AND GroupTypeID=" & m_GroupTypeID & " AND PauseFile=false ORDER BY postdate ASC", dbOpenSnapshot)) Then
    End If
    
    If (rsfile.EOF = False) Then
        If TargetFilesExists(rsfile!FileName) Then
            Call Execute("UPDATE FILE SET PauseFile=True WHERE UID=" & rsfile!UID)
            GoTo getnextfile
        End If
        
        Call Execute("UPDATE  File SET Downloading=true WHERE UID=" & rsfile!UID, True)
        Call GetAllArticlesByFileID(rsfile!UID, m_ArticleID)
        
        If UBound(m_ArticleID) > 0 Or m_ArticleID(0).ArticleID <> 0 Then
            m_ArticleMax = 0
        Else
            Call rsfile.MoveNext
            GoTo getnextfile
        End If
    Else
        'end of download list
        CMDDownloadFiles.Enabled = True
        MDIMain.LBLAction = "Completed Download"
        getnextfile = False
    End If
End Function

Public Sub DownloadFile(clsNewsReader As cNewsReader)
    Dim sql As String
    Dim GroupID As Long
    Dim rsGroup As Recordset
    
    If frmReaderHolder.NumberOfThreads < clsNewsReader.Index + 1 Then
        ' finish processing for this thread
        If MDIMain.LBLProgress.UBound >= clsNewsReader.Index Then
            MDIMain.LBLProgress(clsNewsReader.Index).Caption = "Inactive"
        End If
        clsNewsReader.Disconnect
        Exit Sub
    End If
    
    Call clsNewsReader.ResetBuffer
    
    If m_ArticleMax > UBound(m_ArticleID) Then
getnextfile:
        
        If getnextfile = False Then
            Call clsNewsReader.DownloadCompleted
            GoTo fin
        End If
        
        m_File(1) = m_File(0)
        lblFilename(1).Caption = lblFilename(0).Caption
        m_FileArticles(1) = m_FileArticles(0)
        Call m_BitmapProcessor.RefreshDownloadBitmap(grdBitmapSmall, m_File(1), m_FileArticles(0))
        m_File(0) = rsfile!UID
        m_FileArticles(0) = rsfile!TotalArticles
        lblFilename(0).Caption = rsfile!FileName
    End If
    
    If rsfile!TotalArticles <> 1 Then
        'Find a article to download, using downloaded bitmap and currently active threads
        Do While (m_ArticleMax <= UBound(m_ArticleID))
            If (m_BitmapProcessor.CheckFileBitmap(rsfile!FileName, CLng(m_ArticleID(m_ArticleMax).FileIndex), rsfile!TotalArticles) > 0) Then
                m_ArticleMax = m_ArticleMax + 1
            Else
                If frmReaderHolder.CheckCurrentlyDownloadingIndex(rsfile!UID, m_ArticleID(m_ArticleMax).FileIndex, 0) = True Then
                    m_ArticleMax = m_ArticleMax + 1
                Else
                    If (OpenRecordset(rsGroup, "SELECT * FROM [group] WHERE uid=" & m_ArticleID(m_ArticleMax).GroupID, dbOpenSnapshot)) Then
                        If (rsGroup.EOF = False) Then
                            Exit Do
                        Else
                            m_ArticleMax = m_ArticleMax + 1
                        End If
                    End If
                End If
            End If
        Loop
    End If
    If m_ArticleMax > UBound(m_ArticleID) Then
        rsfile.MoveNext
        GoTo getnextfile
    End If
    
    'Copy details to class
    If clsNewsReader.m_LastFileID <> rsfile!UID Then
        clsNewsReader.m_LastFileID = rsfile!UID
        clsNewsReader.m_LastFileName = rsfile!FileName
        Call frmReaderHolder.CheckFileNameOverride(clsNewsReader)
        clsNewsReader.m_TotalArticles = rsfile!TotalArticles
    End If
    clsNewsReader.FileIndex = m_ArticleID(m_ArticleMax).FileIndex
    clsNewsReader.m_ArticleNumber = m_ArticleID(m_ArticleMax).ArticleID
        
    clsNewsReader.m_LastArticleIndex = m_ArticleID(m_ArticleMax).FileIndex
    clsNewsReader.m_LastFileSubject = rsfile!Name
    If clsNewsReader.m_LastFileID = m_File(0) Then
        Call m_BitmapProcessor.RefreshDownloadBitmap(GRDBitmap, clsNewsReader.m_LastFileID, rsfile!TotalArticles)
    Else
        Call m_BitmapProcessor.RefreshDownloadBitmap(grdBitmapSmall, clsNewsReader.m_LastFileID, rsfile!TotalArticles)
    End If
    
    If (m_GroupTypeID = 2) Then
        MDIMain.LBLProgress(clsNewsReader.Index).Caption = clsNewsReader.m_LastFileName & "-" & rsfile!Name & "(/" & clsNewsReader.FileIndex & "/" & rsfile!TotalArticles & ") "  '& i \ 60 & ":" & i Mod 60 & "]"
    Else
        If MDIMain.LBLProgress.UBound >= clsNewsReader.Index Then
            MDIMain.LBLProgress(clsNewsReader.Index).Caption = clsNewsReader.m_LastFileName & "(/" & clsNewsReader.FileIndex & "/" & rsfile!TotalArticles & ") "  '& i \ 60 & ":" & i Mod 60 & "]"
        End If
    End If
    
    GroupID = m_ArticleID(m_ArticleMax).GroupID
    If rsfile!TotalArticles = 1 Then
        m_ArticleMax = m_ArticleMax + 1
    End If
    
    If (clsNewsReader.m_SelectedGroupID <> GroupID) Then
        ' Select the group
        If (OpenRecordset(rsGroup, "SELECT * FROM [group] WHERE uid=" & GroupID, dbOpenSnapshot)) Then
            If (rsGroup.EOF = False) Then
                clsNewsReader.m_GroupName = rsGroup!GroupName
                MDIMain.LBLAction.Caption = "Waiting for group to be selected."
                Call clsNewsReader.SelectGroup
            Else
            End If
        End If
    
    Else
        MDIMain.LBLAction.Caption = "Processing article " & clsNewsReader.FileIndex & " (" & UBound(m_ArticleID) & ")"
    
        Call clsNewsReader.DownloadArticle(clsNewsReader.m_ArticleNumber)
    End If

fin:
End Sub



'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''

Public Function GetTargetFilePath(ByRef pfilename As String, psubject As String, pDontCreateFolder As Boolean) As String
    Dim TargetPath As String
    Dim FolderName As String
    
    If (m_GroupTypeID = 1) Then
    
        If (UCase$(Right$(pfilename, 3)) = "JPG" Or UCase$(Right$(pfilename, 3)) = "BMP") Then
            TargetPath = FRMOptions.JPGPath
        Else
            TargetPath = m_GroupPath 'm_MovieTempPath
        End If
    Else
        If (m_GroupTypeID = 2) Then
            FolderName = Trim$(psubject)

            If FolderName <> "" Then
                FolderName = Trim$(FolderName) & "\"
            End If
            
            TargetPath = m_GroupPath & FolderName 'FRMOptions.Mp3Path
            
            If (pDontCreateFolder = False) Then
                If (Dir(TargetPath, vbDirectory) = "") Then
                    Call MkDir(TargetPath)
                End If
            End If
        Else
            TargetPath = m_GroupPath
        End If
    End If
    GetTargetFilePath = TargetPath
End Function

Public Sub MoveFile(pfilename As String, psubject As String)
    Dim FileSystem As New FileSystemObject
    Dim extenstion As String
    Dim TargetPath As String
    
    TargetPath = GetTargetFilePath(pfilename, psubject, False)
    
    extenstion = "_"
    On Error GoTo fileexists
    Call FileSystem.MoveFile(FRMOptions.TempDownloadPath & pfilename, TargetPath & pfilename)
    On Error GoTo CannotDeleteTemp
    'Call FileSystem.DeleteFile(FRMOptions.TempDownloadPath & pfilename & ".txt")
    GoTo Continue:
Nexttry:
    
    If (Dir$(FRMOptions.TempDownloadPath & pfilename) <> "") Then
        Call FileSystem.MoveFile(FRMOptions.TempDownloadPath & pfilename, TargetPath & pfilename & extenstion)
    End If
Continue:
    Exit Sub
CannotDeleteTemp:
    Resume Next
fileexists:
        Call MsgBox(Err.Description)
    If Err.Number = 76 Then
        Call MsgBox(Err.Description)
    End If
    If Err.Number = 58 Then
        Resume Next
    End If
    extenstion = extenstion & "_"
    If extenstion = "____" Then
        Exit Sub
    End If
    Resume Nexttry
End Sub

Private Sub MoveIncompleteFile(pfilename As String, psubject As String)
    Dim FileSystem As New FileSystemObject
    Dim extenstion As String
    Dim TargetPath As String
    
    If (Dir$(FRMOptions.TempDownloadPath & pfilename) <> "") Then
    
        TargetPath = GetTargetFilePath(pfilename, psubject, False)
        
        On Error GoTo fileexists
        extenstion = "_"
        'Call FileSystem.DeleteFile(FRMOptions.TempDownloadPath & pFileName & ".txt")
        Call FileSystem.MoveFile(FRMOptions.TempDownloadPath & pfilename & ".txt", TargetPath & pfilename & ".txt")
        Call FileSystem.MoveFile(FRMOptions.TempDownloadPath & pfilename, TargetPath & pfilename) '& ".incomplete"
        GoTo Continue:
Nexttry:
        
        If (Dir$(FRMOptions.TempDownloadPath & pfilename) <> "") Then
            Call FileSystem.MoveFile(FRMOptions.TempDownloadPath & pfilename, TargetPath & pfilename & ".incomplete" & extenstion)
        End If
    End If
Continue:
    Exit Sub
fileexists:
    extenstion = extenstion & "_"
    Resume Nexttry
End Sub


Public Function CheckJPGExists(pfilename As String, psubject As String) As Boolean
    Dim t As Long
    CheckJPGExists = False
    
    FRMMain.m_IgnorePaths.MoveFirst
    
    Do While FRMMain.m_IgnorePaths.EOF = False
        If Dir(FRMMain.m_IgnorePaths!path & pfilename) <> "" Then
            CheckJPGExists = True
            Exit Do
        End If
        FRMMain.m_IgnorePaths.MoveNext
    Loop
    
    If InStr(LCase(psubject & pfilename), "naus") > 0 Then
        CheckJPGExists = True
    End If
    If InStr(LCase(psubject & pfilename), "danske") > 0 Then
        CheckJPGExists = True
    End If
    
    If InStr(LCase(psubject & pfilename), "dutch") > 0 Then
        CheckJPGExists = True
    End If
    If InStr(LCase(psubject & pfilename), "swedish") > 0 Then
        CheckJPGExists = True
    End If
    If InStr(LCase(psubject & pfilename), "danish") > 0 Then
        CheckJPGExists = True
    End If

End Function



'''''''''''''''''''''''''
''

Public Sub ProcessArticle(pArticleNumber As Long, psubject As String, pLineCount As Long, pPostDate As Date, pGroupID As Long, pLinesExpected As Long, pIndex As Long)
    Static FoundFileRecord As Boolean
    
    Static Current As FileTYPE
    Static i As Long
    Static t As Long
    Static FileIndex As Long
    Static rsfile As Recordset
    
    Static CacheHit As Long
    Static RecTotal As Long
    
    Static Found As Boolean
    Static ExpectedSec As Long
    
    Static fileid As Long
    
    Static tempstring As String
    
    ' Update record
    FoundFileRecord = False
 
    m_lngStart = GetTickCount
    
    m_ArticleProcessor.Mp3Mode = m_Mp3StyleFileNameProcessing
 
    Call m_ArticleProcessor.ProcessSubject(psubject)
    
    If m_ArticleProcessor.TotalArticles > 0 And m_ArticleProcessor.FileName <> "" Then
    
        Current.TotalArticles = m_ArticleProcessor.TotalArticles
        FileIndex = m_ArticleProcessor.ArticleNumber
        Current.FileName = Replace(Left$(m_ArticleProcessor.FileName, 250), ":", "")
        Current.Subject = Left$(m_ArticleProcessor.GroupName, 250)
        
        m_lngSubjectProcessing = m_lngSubjectProcessing + GetTickCount - m_lngStart
       
        m_lngStart = GetTickCount
        
        RecTotal = RecTotal + 1
        ' Check cache, if in mp3 mode match by filename,subject
        If m_Mp3StyleFileNameProcessing = True Then
            For t = 0 To m_FileCacheMax - 1
                If m_FileCache(t).Subject = Current.Subject And m_FileCache(t).FileName = Current.FileName Then
                    fileid = m_FileCache(t).UID
                    FoundFileRecord = True
                    CacheHit = CacheHit + 1
                End If
            Next
        Else
            For t = 0 To m_FileCacheMax - 1
                If m_FileCache(t).TotalArticles = Current.TotalArticles And m_FileCache(t).FileName = Current.FileName Then
                    fileid = m_FileCache(t).UID
                    FoundFileRecord = True
                    CacheHit = CacheHit + 1
                End If
            Next
        
        End If
        m_lngCacheSearch = m_lngCacheSearch + GetTickCount - m_lngStart
        
        
        m_lngStart = GetTickCount
        If FoundFileRecord = False Then
        
            If m_Mp3StyleFileNameProcessing = True Then
                Call OpenRecordset(rsfile, "SELECT * FROM  File WHERE filename=" & Chr$(34) _
                & FilterString(Current.FileName) & Chr$(34) & " AND name=" & Chr$(34) & FilterString(Current.Subject) & Chr$(34), dbOpenDynaset)
            Else
                Call OpenRecordset(rsfile, "SELECT * FROM  File WHERE filename=" & Chr$(34) _
                & FilterString(Current.FileName) & Chr$(34) & " AND TotalArticles=" & Current.TotalArticles, dbOpenDynaset)
            End If
                
            If (rsfile.EOF = True) Then
                rsfile.AddNew

                rsfile!GroupTypeID = m_GroupTypeID
                rsfile!FileName = Current.FileName
                rsfile!Name = Current.Subject
                rsfile!TotalArticles = Current.TotalArticles
                rsfile!PostDate = pPostDate
                
                'rsfile!debug = Left$(psubject, 255)
                
                If (m_GroupTypeID = 1 And FRMOptions.AutoDownloadJPG) Then
                    If (UCase$(Right$(Current.FileName, 4)) = ".JPG") Then
                    
                        If CheckJPGExists(Current.FileName, Current.Subject) = True Then
                            Found = True
                        End If
                    
                        If Found = False Then
                            rsfile!DownloadFile = True
                        End If
                    End If
                End If
                rsfile.Update
            End If
            
            If (m_FileCacheMax < m_FileCacheCurrentSize) Then
                Current.UID = rsfile!UID
                m_FileCache(m_FileCacheMax) = Current
                
                m_FileCacheMax = m_FileCacheMax + 1
            Else
                ' Rotate cache data
                If (m_FileCachePtr >= m_FileCacheCurrentSize) Then
                    m_FileCachePtr = 0
                End If
                Current.UID = rsfile!UID
                m_FileCache(m_FileCachePtr) = Current
                
                m_FileCachePtr = m_FileCachePtr + 1
            End If
            
            fileid = rsfile!UID
            
            FoundFileRecord = True
                
            m_lngDBSearch = m_lngDBSearch + GetTickCount - m_lngStart
        End If
        
        m_lngStart = GetTickCount
        
        If FileIndex < 32768 Then
            Call UpdateFileIDs(fileid, pArticleNumber, pGroupID, CInt(FileIndex))
        End If
        
        m_lngDatabase = m_lngDatabase + GetTickCount - m_lngStart
    
    End If
    
    m_lngStart = GetTickCount
    
    If pArticleNumber Mod 500 = 1 Then
        If CLng(pLineCount / DateDiff("s", m_dtProcessArticleStartTime, Now)) > 0 Then
            ExpectedSec = (pLinesExpected - pLineCount) / CLng(pLineCount / DateDiff("s", m_dtProcessArticleStartTime, Now))
        End If
        
        MDIMain.LBLProgress(pIndex).Caption = "Lines =" & pLineCount & "(" & pLinesExpected & ") " & Format(ExpectedSec \ 3600, "##") & ":" & Format((ExpectedSec \ 60) Mod 60, "00") & ":" & Format(ExpectedSec Mod 60, "00")
        If RecTotal > 0 Then
            tempstring = "db = " & m_lngDatabase / 1000
            tempstring = tempstring & ": SP = " & m_lngSubjectProcessing / 1000
            tempstring = tempstring & ": DBS = " & m_lngDBSearch / 1000
            tempstring = tempstring & ": CS = " & m_lngCacheSearch / 1000
            tempstring = tempstring & ": proc = " & m_BufferProcessing / 1000
            tempstring = tempstring & ": WinS = " & m_WSTime / 1000
            'tempstring = tempstring & "(" & m_FileCacheMax & ")"
            'tempstring = tempstring & "CH=" & Format(CacheHit / RecTotal * 100, "00.0")
            tempstring = tempstring & " Total = " & m_TotalTime / 1000
            'tempstring = tempstring & " miss = " & (m_TotalTime - m_lngDatabase - m_lngDBSearch - m_lngCacheSearch - m_BufferProcessing - m_WSTime - m_lngSubjectProcessing) / 1000
            
            MDIMain.LBLAction.Caption = tempstring
        End If
        MDIMain.LBLProgress(pIndex).Refresh
        MDIMain.LBLTransfer.Refresh
    End If

End Sub




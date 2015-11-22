VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.MDIForm MDIMain 
   BackColor       =   &H8000000C&
   Caption         =   "<Project name is stored in global declarations> <Version Number>"
   ClientHeight    =   7635
   ClientLeft      =   165
   ClientTop       =   450
   ClientWidth     =   15240
   HelpContextID   =   11
   Icon            =   "MDIMain.frx":0000
   LinkTopic       =   "MDIForm1"
   ScrollBars      =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox PicStatusBar 
      Align           =   1  'Align Top
      BorderStyle     =   0  'None
      Height          =   975
      Left            =   0
      ScaleHeight     =   65
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   1016
      TabIndex        =   1
      Top             =   0
      Width           =   15240
      Begin VB.ComboBox CBOGroupType 
         Height          =   315
         Left            =   11640
         Style           =   2  'Dropdown List
         TabIndex        =   11
         Top             =   420
         Visible         =   0   'False
         Width           =   2535
      End
      Begin VB.Label LBLProgress 
         BackColor       =   &H00C0C0C0&
         Caption         =   "<Progress>"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Index           =   7
         Left            =   11160
         TabIndex        =   17
         Top             =   660
         Width           =   3600
      End
      Begin VB.Label LBLProgress 
         BackColor       =   &H00C0C0C0&
         Caption         =   "<Progress>"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Index           =   6
         Left            =   7440
         TabIndex        =   16
         Top             =   660
         Width           =   3600
      End
      Begin VB.Label LBLProgress 
         BackColor       =   &H00C0C0C0&
         Caption         =   "<Progress>"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Index           =   5
         Left            =   3720
         TabIndex        =   15
         Top             =   660
         Width           =   3600
      End
      Begin VB.Label LBLProgress 
         BackColor       =   &H00C0C0C0&
         Caption         =   "<Progress>"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Index           =   4
         Left            =   0
         TabIndex        =   14
         Top             =   660
         Width           =   3600
      End
      Begin VB.Label LBLProgress 
         BackColor       =   &H00C0C0C0&
         Caption         =   "<Progress>"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Index           =   3
         Left            =   11160
         TabIndex        =   13
         Top             =   315
         Width           =   3600
      End
      Begin VB.Label lblBytesTotal 
         BackColor       =   &H00C0C0C0&
         Caption         =   "<Bytes Total>"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   11280
         TabIndex        =   12
         Top             =   0
         Width           =   1815
      End
      Begin VB.Label LBLPacketNumber 
         BackColor       =   &H00C0C0C0&
         Caption         =   "<Packet Number>"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   225
         Index           =   2
         Left            =   9855
         TabIndex        =   10
         Top             =   30
         Width           =   1320
      End
      Begin VB.Label LBLProgress 
         BackColor       =   &H00C0C0C0&
         Caption         =   "<Progress>"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Index           =   2
         Left            =   7440
         TabIndex        =   9
         Top             =   315
         Width           =   3600
      End
      Begin VB.Label LBLPacketNumber 
         BackColor       =   &H00C0C0C0&
         Caption         =   "<Packet Number>"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   225
         Index           =   1
         Left            =   8400
         TabIndex        =   8
         Top             =   30
         Width           =   1320
      End
      Begin VB.Label LBLProgress 
         BackColor       =   &H00C0C0C0&
         Caption         =   "<Progress>"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Index           =   1
         Left            =   3720
         TabIndex        =   6
         Top             =   315
         Width           =   3600
      End
      Begin VB.Label LBLPacketNumber 
         BackColor       =   &H00C0C0C0&
         Caption         =   "<Packet Number>"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   225
         Index           =   0
         Left            =   6960
         TabIndex        =   5
         Top             =   30
         Width           =   1320
      End
      Begin VB.Label LBLTransfer 
         BackColor       =   &H00C0C0C0&
         Caption         =   "<Transfer>"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   13245
         TabIndex        =   4
         Top             =   30
         Width           =   1935
      End
      Begin VB.Label LBLProgress 
         BackColor       =   &H00C0C0C0&
         Caption         =   "<Progress>"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Index           =   0
         Left            =   0
         TabIndex        =   3
         Top             =   315
         Width           =   3600
      End
      Begin VB.Label LBLAction 
         BackColor       =   &H00C0C0C0&
         Caption         =   "<Action>"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   225
         Left            =   0
         TabIndex        =   2
         Top             =   30
         Width           =   6960
      End
   End
   Begin VB.PictureBox PICBackground 
      Align           =   2  'Align Bottom
      Height          =   975
      Left            =   0
      ScaleHeight     =   915
      ScaleWidth      =   15180
      TabIndex        =   0
      Top             =   6660
      Visible         =   0   'False
      Width           =   15240
   End
   Begin MSComDlg.CommonDialog CommonDialogControl 
      Left            =   360
      Top             =   1740
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.PictureBox Picture2 
      Align           =   1  'Align Top
      Height          =   0
      Left            =   0
      ScaleHeight     =   0
      ScaleWidth      =   15240
      TabIndex        =   7
      Top             =   975
      Width           =   15240
   End
   Begin VB.Menu MNUFile 
      Caption         =   "File"
      Begin VB.Menu MNUCompactDB 
         Caption         =   "Compact DB"
      End
      Begin VB.Menu mnuCompactStore 
         Caption         =   "Compact Article Store"
      End
      Begin VB.Menu MNUAbout 
         Caption         =   "About"
         Visible         =   0   'False
      End
      Begin VB.Menu MNULogin 
         Caption         =   "Login"
         Visible         =   0   'False
      End
      Begin VB.Menu MNUBlank1 
         Caption         =   "-"
      End
      Begin VB.Menu MNUExit 
         Caption         =   "E&xit"
      End
   End
   Begin VB.Menu MNUNewsReader 
      Caption         =   "News Reader"
      Begin VB.Menu MNUGetAllGroups 
         Caption         =   "Get All Groups"
      End
      Begin VB.Menu MNUAddRemoveGroups 
         Caption         =   "Add/Remove Groups"
      End
      Begin VB.Menu MNUBlank3 
         Caption         =   "-"
      End
      Begin VB.Menu mnuSelectedGroupType 
         Caption         =   "<>"
         Begin VB.Menu mnuGroupType 
            Caption         =   "<Availible Group Types>"
            Index           =   0
         End
      End
      Begin VB.Menu mnuSelectedGroups 
         Caption         =   "Selected Groups"
         Begin VB.Menu mnuSelected 
            Caption         =   "<Availible News Groups>"
            Index           =   0
         End
      End
      Begin VB.Menu MNUBlank2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuAutoHine 
         Caption         =   "AutoHide"
      End
      Begin VB.Menu MNUGetNewArticles 
         Caption         =   "Get New Articles"
      End
      Begin VB.Menu MNUViewFiles 
         Caption         =   "View Files"
      End
      Begin VB.Menu MNUDownloadFiles 
         Caption         =   "Download Files"
      End
      Begin VB.Menu MNUClearDownloading 
         Caption         =   "Clear Downloading"
      End
      Begin VB.Menu mnuBlank6 
         Caption         =   "-"
      End
      Begin VB.Menu mnuThreadsGroup 
         Caption         =   "Threads"
         Begin VB.Menu mnuThreads 
            Caption         =   "1"
            Index           =   0
         End
         Begin VB.Menu mnuThreads 
            Caption         =   "2"
            Index           =   1
         End
         Begin VB.Menu mnuThreads 
            Caption         =   "3"
            Checked         =   -1  'True
            Index           =   2
         End
         Begin VB.Menu mnuThreads 
            Caption         =   "4"
            Index           =   3
         End
         Begin VB.Menu mnuThreads 
            Caption         =   "5"
            Index           =   4
         End
         Begin VB.Menu mnuThreads 
            Caption         =   "6"
            Index           =   5
         End
         Begin VB.Menu mnuThreads 
            Caption         =   "7"
            Index           =   6
         End
         Begin VB.Menu mnuThreads 
            Caption         =   "8"
            Index           =   7
         End
         Begin VB.Menu mnuThreads 
            Caption         =   "9"
            Index           =   8
            Visible         =   0   'False
         End
         Begin VB.Menu mnuThreads 
            Caption         =   "10"
            Index           =   9
            Visible         =   0   'False
         End
         Begin VB.Menu mnuThreads 
            Caption         =   "11"
            Index           =   10
            Visible         =   0   'False
         End
         Begin VB.Menu mnuThreads 
            Caption         =   "12"
            Index           =   11
            Visible         =   0   'False
         End
         Begin VB.Menu mnuThreads 
            Caption         =   "13"
            Index           =   12
            Visible         =   0   'False
         End
         Begin VB.Menu mnuThreads 
            Caption         =   "14"
            Index           =   13
            Visible         =   0   'False
         End
         Begin VB.Menu mnuThreads 
            Caption         =   "15"
            Index           =   14
            Visible         =   0   'False
         End
      End
      Begin VB.Menu mnuBlank7 
         Caption         =   "-"
         Visible         =   0   'False
      End
      Begin VB.Menu mnuGetAlternateServerArticles 
         Caption         =   "Get Alternate Server Articles"
         Visible         =   0   'False
      End
      Begin VB.Menu mnuGetAlternateServerFiles 
         Caption         =   "Get Alternate Server Files"
         Visible         =   0   'False
      End
   End
   Begin VB.Menu MNUConfig 
      Caption         =   "&Config"
      Begin VB.Menu MNUOptions 
         Caption         =   "Options"
         Shortcut        =   {F7}
      End
      Begin VB.Menu mnuPictureIgnoreList 
         Caption         =   "Picture Ignore List"
      End
   End
   Begin VB.Menu MNUWindow 
      Caption         =   "&Window"
      WindowList      =   -1  'True
   End
End
Attribute VB_Name = "MDIMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
''*************************************************************************
'' Main MDI Object
''
'' Coded by Dale Pitman

''
Public Sub LogOnUser(pUserID As Long, pUserName As String)
    Dim rstemp As Recordset
    Call GlobalLogOnUser(pUserID)
    
    'Show menus here, depending on user access
    MNUConfig.Visible = True
    MNUWindow.Visible = True

End Sub

''
Public Sub LogOffUser()
    Call Unload(Me)
End Sub

''function to locate and save a specified database
Private Function LocateDatabase(DatabaseName As String) As String
    On Error GoTo Dialog_Cancelled
    'setup the common dialog control
    With MDIMain.CommonDialogControl
        .Filter = DatabaseName & "|" & DatabaseName
        .CancelError = True
        .DialogTitle = "Locate " & DatabaseName & " database"
        'Show the open dialog
        .ShowOpen
        'save the returned setting
        SaveSetting cRegistoryName, "Settings", DatabaseName, .FileName
        'return the path
        LocateDatabase = .FileName
    End With
    Exit Function
Dialog_Cancelled:
    'if there was an error or the user cancelled the function, return "****"
    LocateDatabase = "****"
    Exit Function
End Function

Private Sub ReDoFileNames()
    Dim rstemp As Recordset
    Dim te As New cArticleProcessing
    If OpenRecordset(rstemp, "SELECT * FROM [File]", dbOpenDynaset) = True Then
        Do While rstemp.EOF = False
            If rstemp!GroupTypeID = 2 Then
                te.Mp3Mode = True
            Else
                te.Mp3Mode = False
            End If
            Call te.ProcessSubject(rstemp!debug)
            rstemp!FileName = te.FileName
            rstemp!Name = te.GroupName
            rstemp.Update
            rstemp.MoveNext
        Loop
    End If
End Sub

Private Sub testnameprocessing()
    Dim rstemp As Recordset
    Dim te As New cArticleProcessing
    Dim Subject As String
    Dim i As Long
    
    Call OpenRecordset(rstemp, "SELECT * FROM [File] WHERE GroupTypeID=2", dbOpenDynaset)
    Do While rstemp.EOF = False
        te.Mp3Mode = True
        
        Call te.ProcessSubject(rstemp!debug)
        
        
        rstemp!FileName = te.FileName
        rstemp!Name = te.GroupName
        rstemp.MoveNext
    Loop
End Sub

Private Sub InitScreen()
    Dim i As Long
    LBLAction.Caption = "Ready"
    For i = 0 To LBLProgress.Count - 1
        LBLProgress(i).Caption = "Ready"
        If i < 3 Then
            LBLPacketNumber(i).Caption = ""
        End If
    Next
    LBLTransfer.Caption = ""
    
End Sub

Private Sub CBOGroupType_Click()
    Call FRMMain.ChangeGroupType(CBOGroupType)
End Sub

''
Private Sub MDIForm_Load()
    Dim te As New cArticleProcessing
    Dim threads As Long

    Dim DatabaseName As String
'    Call SetWindowPosition(Me)

    On Error GoTo loadpictureerror
'    PICBackground.Picture = LoadPicture(App.Path & "\" & cProjectName & ".bmp")
loadpictureerror:
    On Error GoTo 0
    
    Me.Caption = cProjectName & cVersionNumber
    
    '' Connnect to database
    DatabaseName = cDatabaseName
    'If (Command = "testing") Then
'        DatabaseName = "Testing.mdb"
    'End If
    DatabaseName = "NewsReader.MDB"
    If (ConnectDatabase(DatabaseName) = True) Then
'        FRMAbout.vLicencedTo = GetLicenceTo
'        If (FRMAbout.vLicencedTo = "*Unlicenced*") Then
'            Call FRMAbout.Show
'        End If
        Call Startup
        Call FRMOptions.LoadSettings
        PicStatusBar.Visible = FRMOptions.StatusVisible
        Call InitFileStorage
    Else
        End
    End If
    
'    Dim rstemp As Recordset

'    Call SetServerSetting("FileIDBase", 97272)
'    Call OpenRecordset(rstemp, "SELECT * FROM article ORDER BY [FileID]", dbOpenSnapshot)
'    Do While rstemp.EOF = False
'        Call UpdateFileIDs(rstemp![FileID], rstemp![ArticleNumber], rstemp!GroupID, rstemp!FileIndex)
'        rstemp.MoveNext
'    Loop
'    rstemp.MoveFirst
    lblBytesTotal.Caption = ""

    Call InitScreen
    Call ShowForm(frmReaderHolder)
    frmReaderHolder.Visible = False
    Call ShowForm(frmIMDBHolder)
    frmIMDBHolder.Visible = False
    Call ShowForm(FRMMain)
    Call FRMMain.GetIgnorePaths
'    Call ShowForm(FRMViewFiles)
    
    FRMContextMenu.Show
    FRMContextMenu.Visible = False
End Sub

Private Sub MDIForm_Unload(Cancel As Integer)
    Call GetWindowPosition(Me)
    Call CloseFileStorage
    Call Shutdown
End Sub

Private Sub MNUAbout_Click()
'    Call ShowForm(FRMAbout)
End Sub

Private Sub MNUAddRemoveGroups_Click()
    Call FRMAddRemoveGroups.Show
End Sub

Private Sub mnuAutoHine_Click()
    ProcessAutoHide (FRMMain.m_GroupTypeID)
End Sub

Private Sub MNUClearDownloading_Click()
    Screen.MousePointer = vbHourglass
    Call Execute("UPDATE [FILE] SET Downloading=false WHERE [downloadFile] = True", True)
    Screen.MousePointer = vbDefault
End Sub

Private Sub MNUCompactDB_Click()
    Dim FileSystem As New FileSystemObject

    Screen.MousePointer = vbHourglass
    db.Close
    
    Dim a As JRO.JetEngine
    Set a = New JRO.JetEngine
    Dim databasePath As String
    databasePath = GetSetting(cRegistoryName, "Settings", cDatabaseName, "NODATABASE")
'"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & SystemPath
On Error GoTo filenotExits
Call FileSystem.DeleteFile("C:\temp.mdb")
filenotExits:
    a.CompactDatabase db.ConnectionString, _
"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=c:\temp.mdb;Jet OLEDB:Engine Type=4"
    
    Call FileSystem.MoveFile(databasePath, databasePath & ".old")
    Call FileSystem.MoveFile("c:\temp.mdb", databasePath)
'1 JET10
'2 JET11
'3 JET2X
'4 JET3X
'5 JET4X
    
    db.Open
    Call FileSystem.DeleteFile(databasePath & ".old")
    Screen.MousePointer = vbDefault
End Sub


Private Sub mnuCompactStore_Click()
    CompactDB
End Sub

Private Sub mnuDownloadFiles_Click()
    FRMMain.CMDDownloadFiles_Click
End Sub

Private Sub MNUExit_Click()
    Call Unload(Me)
End Sub

Private Sub MNUGetAllGroups_Click()
    FRMMain.CMDGetAllGroups_Click
End Sub

Private Sub mnuGetAlternateServerArticles_Click()
    'Call FRMMain.DownloadAlternateServerArticles
End Sub

Private Sub mnuGetAlternateServerFiles_Click()
    'Call FRMMain.DownloadAlternateServerFiles
End Sub

Private Sub MNUGetNewArticles_Click()
    FRMMain.cmdGetNewArticles_Click
End Sub

Private Sub mnuGroupType_Click(Index As Integer)
    CBOGroupType.ListIndex = Index
    Call FRMMain.ChangeGroupType(CBOGroupType)
End Sub

''
Private Sub MNULogin_Click()
'    Call ShowForm(FRMLogin)
End Sub

Private Sub MNUOptions_Click()
    Call ShowForm(FRMOptions)
End Sub

Private Sub mnuPictureIgnoreList_Click()
    Call ShowForm(frmIgnoreList)
End Sub

Public Sub mnuThreads_Click(Index As Integer)
    Dim i As Long
    Call frmReaderHolder.RefreshThreads(Index + 1)
    For i = 0 To mnuThreads.Count - 1
        mnuThreads(i).Checked = False
    Next
    mnuThreads(Index).Checked = True
    Call SaveSetting(cRegistoryName, "Settings", "Threads", Index + 1)
    
End Sub

Private Sub MNUViewFiles_Click()
    FRMMain.CMDViewFiles_Click
End Sub

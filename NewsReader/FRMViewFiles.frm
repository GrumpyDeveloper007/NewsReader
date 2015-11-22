VERSION 5.00
Object = "{8DDE6232-1BB0-11D0-81C3-0080C7A2EF7D}#3.0#0"; "Flp32a30.ocx"
Begin VB.Form FRMViewFiles 
   Caption         =   "View Files"
   ClientHeight    =   8595
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   15195
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   573
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   1013
   WindowState     =   2  'Maximized
   Begin LpLib.fpList GRDFile 
      Height          =   7425
      Left            =   0
      TabIndex        =   1
      Top             =   360
      Width           =   15135
      _Version        =   196608
      _ExtentX        =   26696
      _ExtentY        =   13097
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   8.25
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
      Columns         =   8
      Sorted          =   0
      LineWidth       =   1
      SelDrawFocusRect=   -1  'True
      ColumnSeparatorChar=   9
      ColumnSearch    =   2
      ColumnWidthScale=   0
      RowHeight       =   -1
      MultiSelect     =   2
      WrapList        =   0   'False
      WrapWidth       =   0
      SelMax          =   -1
      AutoSearch      =   2
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
      BorderDropShadowWidth=   3
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
      ColDesigner     =   "FRMViewFiles.frx":0000
   End
   Begin VB.PictureBox PICFileExists 
      BackColor       =   &H00007F7F&
      Height          =   255
      Left            =   6000
      ScaleHeight     =   195
      ScaleWidth      =   195
      TabIndex        =   13
      Top             =   0
      Width           =   255
   End
   Begin VB.PictureBox PICFileInQueue 
      BackColor       =   &H0000FFFF&
      Height          =   255
      Left            =   6960
      ScaleHeight     =   195
      ScaleWidth      =   195
      TabIndex        =   12
      Top             =   0
      Width           =   255
   End
   Begin VB.PictureBox PICDownloadComplete 
      BackColor       =   &H00FFC0C0&
      Height          =   255
      Left            =   8160
      ScaleHeight     =   195
      ScaleWidth      =   195
      TabIndex        =   11
      Top             =   0
      Width           =   255
   End
   Begin VB.PictureBox PICIncompleteFile 
      BackColor       =   &H000000FF&
      Height          =   255
      Left            =   9840
      ScaleHeight     =   195
      ScaleWidth      =   195
      TabIndex        =   10
      Top             =   0
      Width           =   255
   End
   Begin VB.PictureBox PICPaused 
      BackColor       =   &H007F7F7F&
      Height          =   255
      Left            =   11040
      ScaleHeight     =   195
      ScaleWidth      =   195
      TabIndex        =   6
      Top             =   0
      Width           =   255
   End
   Begin VB.ComboBox CBOOrderBy 
      Height          =   315
      Left            =   3900
      Style           =   2  'Dropdown List
      TabIndex        =   5
      Top             =   0
      Width           =   1095
   End
   Begin VB.ComboBox CBOShowMethod 
      Height          =   315
      ItemData        =   "FRMViewFiles.frx":04E0
      Left            =   1230
      List            =   "FRMViewFiles.frx":04E2
      Style           =   2  'Dropdown List
      TabIndex        =   4
      Top             =   0
      Width           =   2655
   End
   Begin VB.CheckBox CHKShowAll 
      Caption         =   "Show All"
      Height          =   255
      Left            =   5040
      TabIndex        =   3
      Top             =   0
      Width           =   975
   End
   Begin VB.CommandButton CMDShowAllFiles 
      Caption         =   "Refresh"
      Height          =   315
      Left            =   0
      TabIndex        =   2
      Top             =   0
      Width           =   1215
   End
   Begin VB.CommandButton CMDExit 
      Caption         =   "E&xit"
      Height          =   255
      Left            =   14160
      TabIndex        =   0
      Top             =   0
      Width           =   975
   End
   Begin VB.PictureBox PICDownloading 
      BackColor       =   &H00FF80FF&
      Height          =   255
      Left            =   12120
      ScaleHeight     =   195
      ScaleWidth      =   195
      TabIndex        =   8
      Top             =   0
      Width           =   255
   End
   Begin VB.Label LBLRecordCount 
      Height          =   255
      Left            =   13440
      TabIndex        =   18
      Top             =   0
      Width           =   615
   End
   Begin VB.Label Label1 
      Caption         =   "File Exits"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   6300
      TabIndex        =   17
      Top             =   0
      Width           =   615
   End
   Begin VB.Label Label2 
      Caption         =   "File In queue"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   7260
      TabIndex        =   16
      Top             =   0
      Width           =   855
   End
   Begin VB.Label Label3 
      Caption         =   "Download Complete"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   8460
      TabIndex        =   15
      Top             =   0
      Width           =   1335
   End
   Begin VB.Label Label4 
      Caption         =   "Incomplete"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   10200
      TabIndex        =   14
      Top             =   0
      Width           =   735
   End
   Begin VB.Label Label6 
      Caption         =   "Downloading"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   12480
      TabIndex        =   9
      Top             =   0
      Width           =   855
   End
   Begin VB.Label Label5 
      Caption         =   "Paused"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   11400
      TabIndex        =   7
      Top             =   0
      Width           =   615
   End
End
Attribute VB_Name = "FRMViewFiles"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
''*************************************************************************
'' Shows available files in a group type
''
'' Coded by Dale Pitman - PyroDesign

Private m_GroupTypeID As Long
Private m_Mp3StyleFileNameProcessing As Boolean

Private m_PragmaticChange As Boolean

''
Private vCurrentActiveChild As Form     ' If this form has children, this is the currently/previously active one
Private vIsLoaded As Boolean

Private vDataChanged As Boolean

Private m_ShiftPressed As Boolean

Private m_ListByArticle As Boolean

Private Type HiddedIDTYPE
    GridID As Long
    UID As Long
End Type

Private m_HiddenID(8000) As HiddedIDTYPE
Private m_HiddenIDMax As Long

Public Sub RefreshGroupID(pGroupID As Long)
    m_GroupTypeID = FRMMain.m_GroupTypeID
    If (m_GroupTypeID = 2) Then
        m_Mp3StyleFileNameProcessing = True
    Else
        m_Mp3StyleFileNameProcessing = False
    End If
    If vIsLoaded = True Then
        Call CMDShowAllFiles_Click
    End If
End Sub

'' This property indicates if this form is currently visible
Public Function IsNotLoaded() As Boolean
    IsNotLoaded = Not vIsLoaded
End Function

'' General function to make currently active form visible (if a child is active then that form should be made visible),Hierarchical function
Public Sub SetFormFocus()
    If (Me.Enabled = False) Then
        Call vCurrentActiveChild.SetFormFocus
    Else
        Me.ZOrder
    End If
End Sub

'' A 'Show' type function used to activate/trigger any functionality on a per-operation basis
Public Function Search() As Boolean
    
    Screen.MousePointer = vbHourglass
    Call AllFormsShow(Me)
    Me.Visible = True
    
    Search = False
    Screen.MousePointer = vbDefault
End Function

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'' Update Property Procedures

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'' Local


''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'' Form objects

Private Sub CBOOrderBy_Click()
    If (m_PragmaticChange = False) Then
        Call CMDShowAllFiles_Click
    End If
End Sub

Private Sub CBOShowMethod_Click()
    If (m_PragmaticChange = False) Then
        Call CMDShowAllFiles_Click
    End If
End Sub

Private Sub CMDDownloadFiles_Click()
    Dim i As Long
    Dim t As Long
    Screen.MousePointer = vbHourglass
    For i = 0 To GRDFile.ListCount - 1
        If (i Mod 50 = 0) Then
            DoEvents
        End If
        GRDFile.Col = 0
        GRDFile.row = i
        If (GRDFile.Selected(i) = True) Then
            Call Execute("UPDATE  File SET downloadfile=not downloadfile WHERE uid=" & GRDFile.ColList, True)
            If (m_ListByArticle = True) Then
            Else
                ' Update all files attach to this grid row
                For t = 0 To m_HiddenIDMax - 1
                    If (m_HiddenID(t).GridID = GRDFile.row) Then
                        Call Execute("UPDATE  File SET downloadfile=not downloadfile WHERE uid=" & m_HiddenID(t).UID, False)
                    End If
                Next

            End If
        
            GRDFile.ListApplyTo = ListApplyToIndividual
            GRDFile.Col = -1
            If (GRDFile.BackColor = PICFileInQueue.BackColor) Then
                GRDFile.BackColor = &HFFFFFF
            Else
                GRDFile.BackColor = PICFileInQueue.BackColor
            End If
        End If

    Next
    Screen.MousePointer = vbDefault
End Sub

Private Sub CMDDownloadFirst_Click()
    Dim i As Long
    Dim t As Long
    Screen.MousePointer = vbHourglass
    For i = 0 To GRDFile.ListCount - 1
        If (i Mod 50 = 0) Then
            DoEvents
        End If
        GRDFile.Col = 0
        GRDFile.row = i
        If (GRDFile.Selected(i) = True) Then

            Call Execute("UPDATE File SET postdate=#01/01/2003# WHERE uid=" & GRDFile.ColList, False)
        
            GRDFile.ListApplyTo = ListApplyToIndividual
            GRDFile.Col = -1
        End If

    Next
    Screen.MousePointer = vbDefault

End Sub

''
Private Sub CMDExit_Click()
    vIsLoaded = False
    Call Unload(Me)
    Call AllFormsHide(Me)
End Sub

Private Sub CMDHideAll_Click()
    Screen.MousePointer = vbHourglass
    Call Execute("UPDATE  File SET hide=true WHERE grouptypeid=" & m_GroupTypeID, False)
    Screen.MousePointer = vbDefault
End Sub

Private Sub CMDHideFiles_Click()
    Dim i As Long
    Dim t As Long
    Dim SelectedCount As Long
    Dim SelectedLowest As Long
    Screen.MousePointer = vbHourglass
    SelectedCount = 0
    SelectedLowest = GRDFile.ListCount
    For i = GRDFile.ListCount - 1 To 0 Step -1
        GRDFile.Col = 0
        GRDFile.row = i
        If (GRDFile.Selected(i) = True) Then
            If (i < SelectedLowest) Then
                SelectedLowest = i
            End If
            SelectedCount = SelectedCount + 1
            Call Execute("UPDATE  File SET hide=true WHERE uid=" & GRDFile.ColList, False)
            DoEvents
            If (m_ListByArticle = True) Then

            Else
                ' Update all files attach to this grid row
                For t = 0 To m_HiddenIDMax - 1
                    If (m_HiddenID(t).GridID = GRDFile.row) Then
                        Call Execute("UPDATE  File SET hide=true WHERE uid=" & m_HiddenID(t).UID, False)
                    End If
                Next

            End If
            Call GRDFile.RemoveItem(i)
            GRDFile.ListApplyTo = ListApplyToIndividual
        End If

    Next
    
    Dim toprowsave As Long
    toprowsave = GRDFile.TopIndex
    
    If toprowsave > SelectedLowest Then
        GRDFile.TopIndex = toprowsave - SelectedCount
    Else
        GRDFile.TopIndex = toprowsave
    End If

    Screen.MousePointer = vbDefault
End Sub

Private Sub CMDHideOlderThan1Day_Click()
    Dim sql As String
    Screen.MousePointer = vbHourglass
    sql = "UPDATE  File SET hide=true WHERE grouptypeid=" & m_GroupTypeID
    sql = sql & " AND PostDate<#" & Format(DateAdd("d", -1, Now), "mm/dd/yyyy") & "#"
    sql = sql & " AND PostDate>=#01/01/1900#"
    Call Execute(sql, True)
    
    Screen.MousePointer = vbDefault
End Sub

Private Sub CMDMoveToAutohide_Click()
    Dim i As Long
    Dim t As Long
    Dim rstemp As Recordset
    Dim clsArticleProcessor As New cArticleProcessing
    Screen.MousePointer = vbHourglass
    For i = 0 To GRDFile.ListCount - 1
        If (i Mod 50 = 0) Then
            DoEvents
        End If
        GRDFile.Col = 2
        GRDFile.row = i
        If (GRDFile.Selected(i) = True) Then
            If (OpenRecordset(rstemp, "SELECT * FROM AutoHide WHERE Filename='" & clsArticleProcessor.GetFileNameWithNoExtenstion(GRDFile.ColList) & "'", dbOpenDynaset)) Then
                If (rstemp.EOF = True) Then
                    Call rstemp.AddNew
                End If
                rstemp!FileName = clsArticleProcessor.GetFileNameWithNoExtenstion(GRDFile.ColList)
            
                Call rstemp.Update
            End If
        
            GRDFile.ListApplyTo = ListApplyToIndividual
            GRDFile.Col = -1
        End If

    Next
    Screen.MousePointer = vbDefault
End Sub

Private Sub CMDPause_Click()
    Dim i As Long
    Dim t As Long
    Screen.MousePointer = vbHourglass
    For i = 0 To GRDFile.ListCount - 1
        GRDFile.Col = 0
        GRDFile.row = i
        If (GRDFile.Selected(i) = True) Then
            Call Execute("UPDATE  File SET pausefile=not pausefile WHERE uid=" & GRDFile.ColList, False)
            If (m_ListByArticle = True) Then
            Else
                ' Update all files attach to this grid row
                For t = 0 To m_HiddenIDMax - 1
                    If (m_HiddenID(t).GridID = GRDFile.row) Then
                        Call Execute("UPDATE  File SET pausefile=not pausefile WHERE uid=" & m_HiddenID(t).UID, False)
                    End If
                Next

            End If
        
            GRDFile.ListApplyTo = ListApplyToIndividual
            GRDFile.Col = -1
            
            If (GRDFile.BackColor = PICPaused.BackColor) Then
                GRDFile.BackColor = PICFileInQueue.BackColor
            Else
                GRDFile.BackColor = PICPaused.BackColor
            End If
        End If

    Next
    Screen.MousePointer = vbDefault

End Sub

Private Sub CMDShowAllFiles_Click()
    Dim rstemp As Recordset
    Dim FileName As String
    Dim toprowsave As Long
    Dim sql As String
    Dim HideSQL As String
    Dim RecordCount As Long
    Dim ArticleName As String
    Dim StartTime As Date
    Dim FilePath As String
    Dim FileName2 As String
    Dim foundcover As Boolean
    
    toprowsave = GRDFile.TopIndex
    Screen.MousePointer = vbHourglass
    m_ListByArticle = True
    Call GRDFile.Clear
    If (CHKShowAll.Value = vbChecked Or CBOShowMethod.ListIndex = 2) Then
        HideSQL = " "
    Else
        HideSQL = "HIDE=False AND "
    End If
    
    Select Case CBOShowMethod.ListIndex
        Case 0 ' Default
            If (m_GroupTypeID = 2 Or m_GroupTypeID = 3) Then
                sql = "SELECT * FROM  File WHERE " & HideSQL & "GroupTypeID=" & m_GroupTypeID
            Else
                If (m_GroupTypeID = -1) Then
                    sql = "SELECT * FROM  File WHERE " & HideSQL & " true=true"
                Else
                    sql = "SELECT * FROM  File WHERE " & HideSQL & "GroupTypeID=" & m_GroupTypeID
                End If
            End If
        Case 1 'Downloading (order by queue)
            If (m_GroupTypeID = -1) Then
                sql = "SELECT * FROM  File WHERE " & HideSQL & "DownloadFile=True "
            Else
                sql = "SELECT * FROM  File WHERE " & HideSQL & "GroupTypeID=" & m_GroupTypeID & " AND DownloadFile=True "
            End If
        Case 2 'Verified Downloading
            If (m_GroupTypeID = -1) Then
                sql = "SELECT * FROM  File WHERE " & HideSQL & "DownloadFile=True AND DownloadedSuccessfully =False "
            Else
                sql = "SELECT * FROM  File WHERE " & HideSQL & "GroupTypeID=" & m_GroupTypeID & " AND DownloadFile=True AND DownloadedSuccessfully =False "
            End If
        Case 3 ' 2010
            sql = "SELECT * FROM  File WHERE (name like '%2011%' or filename like '%2011%' or name like '%2010%' or filename like '%2010%') AND " & HideSQL & "GroupTypeID=" & m_GroupTypeID
        Case 4 ' 2007
            sql = "SELECT * FROM  File WHERE (name like '%2013%' or filename like '%2013%' or name like '%2012%' or filename like '%2012%' or name like '%2011%' or filename like '%2011%') AND " & HideSQL & "GroupTypeID=" & m_GroupTypeID
        Case 5 ' 2007
            sql = "SELECT * FROM  File WHERE (name like '%3D%' or filename like '%3D%') AND " & HideSQL & "GroupTypeID=" & m_GroupTypeID
                
        Case Else
    End Select
    
    Select Case CBOOrderBy.ListIndex
        Case 0 'File Name
            sql = sql & " ORDER BY Filename"
        Case 1 'Post Date
            sql = sql & " ORDER BY postdate"
        Case 2 'Subject
            sql = sql & " ORDER BY name,filename"
        Case 3 'file type
            sql = sql & " ORDER BY right(filename,3)"
    End Select
    
    StartTime = Now
    
    If (OpenRecordset(rstemp, sql, dbOpenSnapshot)) Then
    
        GRDFile.ListApplyTo = ListApplyToIndividual
        GRDFile.Col = -1
        StartTime = Now
        
        Do While (rstemp.EOF = False)
            
            RecordCount = RecordCount + 1
            ArticleName = rstemp!Name
            FileName = rstemp!FileName
            If (rstemp!IMDBName <> "") Then
                ArticleName = rstemp!IMDBName & ":" & ArticleName
            End If
            FilePath = FRMMain.GetTargetFilePath(FileName, ArticleName, True)
            
            Call GRDFile.AddItem(rstemp!UID & vbTab & "1" & vbTab & FileName & vbTab & ArticleName & vbTab & FilePath & vbTab & rstemp!TotalArticles & vbTab & rstemp!currentarticles & vbTab & Format(rstemp!PostDate, "hh:mm dd/mm/yyyy"))
            GRDFile.row = GRDFile.ListCount - 1
           
            foundcover = False
            'If UCase$(Right$(FileName, 4)) = ".JPG" Then
            '    If CheckJPGExists(FileName, ArticleName) = True Then
            '        foundcover = True
            '    End If
            'End If
            FileName2 = FRMOptions.JPGPath & FileName
            FileName = FilePath & FileName
            
            If CBOShowMethod.ListIndex = 2 Then
                On Error Resume Next
                foundcover = Dir$(FileName2, vbNormal) <> ""
            End If
            
            ' Verify if target file exists
            On Error Resume Next
            'If (Dir$(FileName, vbNormal) <> "" Or foundcover = True) Then
            '    GRDFile.BackColor = PICFileExists.BackColor
            'Else
                If (rstemp!PauseFile = True) Then
                    GRDFile.BackColor = PICPaused.BackColor
                Else
                    'default
                    If (rstemp!TotalArticles > rstemp!currentarticles) Then
                        GRDFile.BackColor = PICIncompleteFile.BackColor
                    End If
                    
                    If (rstemp!downloading = True) Then
                        GRDFile.BackColor = PICDownloading.BackColor
                    Else
                        If (rstemp!DownloadedSuccessfully = True) Then
                                GRDFile.BackColor = PICDownloadComplete.BackColor
                        Else
                            If (rstemp!DownloadFile = True) Then
                                GRDFile.BackColor = PICFileInQueue.BackColor
                            End If
                        End If
                    End If
                    
                    
                End If
            'End If
            On Error GoTo 0
            Call rstemp.MoveNext
        Loop
    End If
    LBLRecordCount.Caption = RecordCount
    GRDFile.TopIndex = toprowsave
    Screen.MousePointer = vbDefault
    GRDFile.SetFocus
End Sub

'' Set forms location, as stored in registory
Private Sub Form_Load()
    Dim FileName As String
    vIsLoaded = True
    Call AllFormsLoad(Me)
    Call SetWindowPosition(Me)
    
    m_GroupTypeID = FRMMain.m_GroupTypeID
    If (m_GroupTypeID = 2) Then
        m_Mp3StyleFileNameProcessing = True
    Else
        m_Mp3StyleFileNameProcessing = False
    End If
    
    m_PragmaticChange = True
    Call CBOShowMethod.AddItem("Default")
    Call CBOShowMethod.AddItem("Downloaded")
    Call CBOShowMethod.AddItem("Downloading")
    Call CBOShowMethod.AddItem("2010")
    Call CBOShowMethod.AddItem("Latest")
    Call CBOShowMethod.AddItem("3D")
    CBOShowMethod.ListIndex = 2
    
    Call CBOOrderBy.AddItem("File Name")
    Call CBOOrderBy.AddItem("Post Date")
    Call CBOOrderBy.AddItem("Subject")
    Call CBOOrderBy.AddItem("File Type")
    If (m_GroupTypeID = 2) Then
        CBOOrderBy.ListIndex = 2
    Else
        CBOOrderBy.ListIndex = 0
    End If
    m_PragmaticChange = False
    Me.Show
    Call CMDShowAllFiles_Click
    
    vDataChanged = False
End Sub

''
Private Function ProcessArticleName(pString As String) As String
    Dim tempstring As String
    Dim BytePos As Long
    Dim NumberPos As Long
    Dim NumberOfBytes As String
    tempstring = Replace(pString, "AS REQ", "", 1, 1, vbTextCompare)
    tempstring = Replace(tempstring, "YENC", "", 1, 1, vbTextCompare)
    tempstring = Replace(tempstring, "MY REQ", "", 1, 1, vbTextCompare)
    BytePos = InStr(1, tempstring, "bytes", vbTextCompare)
    If (BytePos > 0) Then
        If (Mid$(tempstring, BytePos - 1, 1) = " ") Then
            NumberPos = InStrRev(tempstring, " ", BytePos - 2)
            If (NumberPos > 0) Then
                NumberOfBytes = Mid$(tempstring, NumberPos + 1, BytePos - NumberPos - 2)
                tempstring = Replace(tempstring, " " & NumberOfBytes & " " & "BYTES", "", 1, 1, vbTextCompare)
                
            End If
        End If
    
    End If
    
    ProcessArticleName = tempstring
End Function

Private Sub Form_Resize()
    If Me.ScaleWidth > GRDFile.Left + 2 Then
        GRDFile.Width = Me.ScaleWidth - GRDFile.Left - 2
    End If
    If Me.ScaleHeight > GRDFile.Top + 2 Then
        GRDFile.Height = Me.ScaleHeight - GRDFile.Top - 2
    End If
End Sub

'' Save forms location
Private Sub Form_Unload(Cancel As Integer)
    Call GetWindowPosition(Me)
    vIsLoaded = False
    Call AllFormsUnLoad(Me)
End Sub

Private Sub GRDFile_DblClick()
    Call CMDDownloadFiles_Click
End Sub

Private Sub GRDFile_KeyDown(KeyCode As Integer, Shift As Integer)
    If (KeyCode = 16) Then
        m_ShiftPressed = True
    End If
End Sub

Private Sub GRDFile_KeyUp(KeyCode As Integer, Shift As Integer)
    If (KeyCode = 16) Then
        m_ShiftPressed = False
    End If
End Sub

Private Sub GRDFile_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 2 Then
        Call Me.PopupMenu(FRMContextMenu.mnuFilesMenu)
    End If
End Sub

'' Calls the code for a given context menu
Public Sub HandleContextMenu(pName As String)
    Select Case pName
        Case "mnuDownloadFiles"
            Call CMDDownloadFiles_Click
        Case "mnuHide"
            Call CMDHideFiles_Click
        Case "mnuHideAll"
            Call CMDHideAll_Click
        Case "mnuDownloadFirst"
            Call CMDDownloadFirst_Click
        Case "mnuPauseFiles"
            Call CMDPause_Click
        Case "mnuMoveToAutoHide"
            Call CMDMoveToAutohide_Click
        Case "mnuHide2Day"
            Call CMDHideOlderThan1Day_Click
        Case "mnuRefresh"
            Call CMDShowAllFiles_Click
    End Select
End Sub

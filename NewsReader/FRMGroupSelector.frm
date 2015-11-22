VERSION 5.00
Object = "{68670FAD-7A98-11D5-910D-0080C845CEED}#12.0#0"; "TxtBox.ocx"
Object = "{8DDE6232-1BB0-11D0-81C3-0080C7A2EF7D}#3.0#0"; "Flp32a30.ocx"
Begin VB.Form FRMAddRemoveGroups 
   Caption         =   "Add / Remove groups"
   ClientHeight    =   8925
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9180
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   595
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   612
   WindowState     =   2  'Maximized
   Begin LpLib.fpList GRDGroup 
      Height          =   7635
      Left            =   120
      TabIndex        =   2
      ToolTipText     =   "Double click to add/remove newsgroups to this group"
      Top             =   840
      Width           =   9015
      _Version        =   196608
      _ExtentX        =   15901
      _ExtentY        =   13467
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
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
      Columns         =   2
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
      ColDesigner     =   "FRMGroupSelector.frx":0000
   End
   Begin VB.CommandButton cmdSetDownloadPath 
      Caption         =   "Set Download Path"
      Height          =   315
      Left            =   4560
      TabIndex        =   6
      Top             =   60
      Width           =   1575
   End
   Begin VB.ComboBox CBOGroupType 
      Height          =   315
      Left            =   720
      Style           =   2  'Dropdown List
      TabIndex        =   5
      Top             =   60
      Width           =   3615
   End
   Begin VB.CheckBox CHKBinaries 
      Caption         =   "Only Binaries"
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
      Left            =   7920
      TabIndex        =   4
      Top             =   480
      Value           =   1  'Checked
      Width           =   1215
   End
   Begin VB.CommandButton CMDExit 
      Caption         =   "E&xit"
      Height          =   375
      Left            =   8040
      TabIndex        =   1
      Top             =   8520
      Width           =   1095
   End
   Begin ELFTxtBox.TxtBox1 TXTFilter 
      Height          =   315
      Left            =   720
      TabIndex        =   0
      ToolTipText     =   "Enter part of a group name or press enter to show all"
      Top             =   420
      Width           =   7095
      _ExtentX        =   12515
      _ExtentY        =   556
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Text            =   ""
      NavigationMode  =   0
      UpperCase       =   -1  'True
      AutoCase        =   -1  'True
      AutoSelect      =   -1  'True
   End
   Begin VB.Label LBLZ1 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "Type"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   0
      Left            =   120
      TabIndex        =   7
      Top             =   120
      Width           =   495
   End
   Begin VB.Label LBLZ1 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "Filter"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   3
      Left            =   120
      TabIndex        =   3
      Top             =   450
      Width           =   495
   End
End
Attribute VB_Name = "FRMAddRemoveGroups"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
''*************************************************************************
'' A configuration form, Groups, path for groups
''
'' Coded by Dale Pitman - PyroDesign

Private m_GroupTypeID As Long

''
'Private vParent As Form                 ' The parent that this form belongs to
Private vCurrentActiveChild As Form     ' If this form has children, this is the currently/previously active one
Private vIsLoaded As Boolean

Private vDataChanged As Boolean

Private vIgnoreUpdate As Boolean

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

'' A simple additional property to indicate form type
Public Property Get ChildType() As ChildTypesENUM
'    ChildType =
End Property

'' Hierarchical function, used to clear all details within any sub-classes
Public Sub ResetForm()
    Call ClearDetails
End Sub

'' General 'call back' function for  any children of this form
Public Sub SendChildInactive()
    Me.Enabled = True
    Call AllFormsShow(Me)
    Call Me.ZOrder
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

'' reset all class details
Private Sub ClearDetails()
End Sub

''
Private Sub SetupFieldSizes()

End Sub

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'' Form objects

''
Private Sub CMDAddNew_Click()
End Sub

''
Private Sub CMDClear_Click()
    Call ClearDetails
End Sub

''
Private Sub cmdDelete_Click()
End Sub

Private Sub CBOGroupType_Click()
    Dim rstemp As Recordset

    If (OpenRecordset(rstemp, "SELECT * FROM [grouptype] WHERE uid=" & CBOGroupType.ItemData(CBOGroupType.ListIndex), dbOpenSnapshot)) Then
        'm_SelectedFileTableName = rstemp!dbtablename & " "
        m_GroupTypeID = rstemp!UID
    End If
End Sub

''
Private Sub CMDExit_Click()
'    Call vParent.SendChildInactive
    vIsLoaded = False
    Call Unload(Me)
    Call AllFormsHide(Me)
    Call FRMMain.ChangeGroupType(MDIMain.CBOGroupType)
End Sub

Private Sub cmdSetDownloadPath_Click()
    Dim path As String
    Dim rstemp As Recordset
    On Error GoTo fin
    
    Call OpenRecordset(rstemp, "SELECT * FROM grouptype WHERE uid=" & m_GroupTypeID, dbOpenSnapshot)
    MDIMain.CommonDialogControl.InitDir = rstemp!downloadpath & ""
    MDIMain.CommonDialogControl.ShowSave
    path = Left$(MDIMain.CommonDialogControl.FileName, InStrRev(MDIMain.CommonDialogControl.FileName, "\"))
    If path <> "" Then
        Call Execute("UPDATE grouptype SET downloadpath=" & Chr$(34) & path & Chr$(34) & " WHERE UID =" & m_GroupTypeID)
    End If
fin:
End Sub

'' Set forms location, as stored in registory
Private Sub Form_Load()
    vIsLoaded = True
    Call AllFormsLoad(Me)
    Call SetWindowPosition(Me)
    
    Dim rstemp As Recordset
    CBOGroupType.Clear
    If (OpenRecordset(rstemp, "SELECT * FROM grouptype", dbOpenSnapshot)) Then
        Do While (rstemp.EOF = False)
            Call CBOGroupType.AddItem(rstemp!Name)
            CBOGroupType.ItemData(CBOGroupType.ListCount - 1) = rstemp!UID
            Call rstemp.MoveNext
        Loop
        CBOGroupType.ListIndex = 0
    End If
    
    
    Call SetupFieldSizes
    Call ClearDetails
    vDataChanged = False
    
    ' Load all groups
    Screen.MousePointer = vbHourglass
    If (OpenRecordset(rstemp, "SELECT * FROM [GROUP] ", dbOpenSnapshot)) Then
        If rstemp.EOF = True Then
            Call MsgBox("There are no availible newsgroups, please select 'Get All Groups' from the menu and try again.", vbExclamation)
        End If
    End If

    Screen.MousePointer = vbDefault
End Sub

'' Save forms location
Private Sub Form_Unload(Cancel As Integer)
    Call GetWindowPosition(Me)
    vIsLoaded = False
    Call AllFormsUnLoad(Me)
   
End Sub


Private Sub GRDGroup_DblClick()
    If vIgnoreUpdate = False Then
        GRDGroup.Col = -1
        GRDGroup.row = GRDGroup.ListIndex
        If (GRDGroup.BackColor <> &HFF) Then
            GRDGroup.Col = 0
            Call Execute("UPDATE [group] SET grouptypeid=" & m_GroupTypeID & " WHERE uid=" & GRDGroup.ColText, True)
        Else
            GRDGroup.Col = 0
            Call Execute("UPDATE [group] SET grouptypeid=" & 0 & " WHERE uid=" & GRDGroup.ColText, True)
        End If
        Call TXTFilter_KeyPress(13)
    End If
End Sub

Private Sub GRDGroup_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 2 Then
        GRDGroup.Col = -1
        GRDGroup.row = GRDGroup.ListIndex
        If (GRDGroup.BackColor <> &H7F) Then
            GRDGroup.Col = 0
            Call Execute("UPDATE [group] SET DownloadAlternate=True WHERE uid=" & GRDGroup.ColText, True)
        Else
            GRDGroup.Col = 0
            Call Execute("UPDATE [group] SET DownloadAlternate=False WHERE uid=" & GRDGroup.ColText, True)
        End If
        Call TXTFilter_KeyPress(13)
    End If
End Sub

Private Sub TXTFilter_KeyPress(KeyAscii As Integer)
    Dim rstemp As Recordset
    Dim sql As String
    Dim SaveIndex As Long
    Dim SaveSelected As Long
    
    vIgnoreUpdate = True
    SaveIndex = GRDGroup.TopIndex
    SaveSelected = GRDGroup.ListIndex
    
    sql = "SELECT * FROM [GROUP] WHERE groupname like " & Chr$(34) & "%" & TXTFilter.Text & "%" & Chr$(34)
    If (CHKBinaries.Value = vbChecked) Then
        sql = sql & " AND groupname like '%binaries%'"
    End If
    sql = sql & " ORDER BY groupname"
    
    Call GRDGroup.Clear
    Screen.MousePointer = vbHourglass
    If (KeyAscii = 13) Then
        If (OpenRecordset(rstemp, sql, dbOpenSnapshot)) Then
            Do While (rstemp.EOF = False)
                Call GRDGroup.AddItem(rstemp!UID & vbTab & rstemp!GroupName)
            
                GRDGroup.ListApplyTo = ListApplyToIndividual
                GRDGroup.Col = -1
                GRDGroup.row = GRDGroup.ListCount - 1
                
                If (rstemp!GroupTypeID = m_GroupTypeID) Then
                    If rstemp!DownloadAlternate = True Then
                        GRDGroup.BackColor = &H7F&
                    Else
                        GRDGroup.BackColor = &HFF&
                    End If
                End If
                
                'If (rstemp!DownloadedSuccessfully = True) Then
                '        GRDFile.BackColor = &HFF0000
                'Else
                '    If (rstemp!DownloadFile = True) Then
                '        GRDFile.BackColor = &HFFFF&
                '    End If
                'End If

            
                Call rstemp.MoveNext
            Loop
        End If
    End If
    
    GRDGroup.TopIndex = SaveIndex
    GRDGroup.ListIndex = SaveSelected
    Screen.MousePointer = vbDefault
    vIgnoreUpdate = False
End Sub

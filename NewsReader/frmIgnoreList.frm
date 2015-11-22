VERSION 5.00
Object = "{68670FAD-7A98-11D5-910D-0080C845CEED}#12.0#0"; "TxtBox.ocx"
Begin VB.Form frmIgnoreList 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Picture Ignore list"
   ClientHeight    =   5595
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6840
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   5595
   ScaleWidth      =   6840
   Begin VB.Frame fraAlternateServer 
      Caption         =   "Add / Edit"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   120
      TabIndex        =   2
      Top             =   4800
      Width           =   6615
      Begin VB.CommandButton cmdAdd 
         Caption         =   "Add"
         Height          =   315
         Left            =   4680
         TabIndex        =   7
         Top             =   240
         Width           =   855
      End
      Begin VB.CommandButton cmdDelete 
         Caption         =   "Delete"
         Height          =   315
         Left            =   5640
         TabIndex        =   6
         Top             =   240
         Width           =   855
      End
      Begin VB.CommandButton cmdTempPath 
         Caption         =   ".."
         Height          =   315
         Left            =   4320
         TabIndex        =   5
         Top             =   240
         Width           =   255
      End
      Begin ELFTxtBox.TxtBox1 txtPath 
         Height          =   315
         Left            =   840
         TabIndex        =   3
         Top             =   240
         Width           =   3375
         _ExtentX        =   5953
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
         UpperCase       =   -1  'True
         AutoCase        =   -1  'True
         AutoSelect      =   -1  'True
      End
      Begin VB.Label LBLZ1 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Path"
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
         Index           =   4
         Left            =   240
         TabIndex        =   4
         Top             =   240
         Width           =   495
      End
   End
   Begin VB.ListBox lstIgnore 
      Height          =   4350
      Left            =   120
      TabIndex        =   0
      Top             =   300
      Width           =   6615
   End
   Begin VB.Label LBLZ1 
      BackStyle       =   0  'Transparent
      Caption         =   "If a picture exists in one of these paths it will not be downloaded"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Index           =   8
      Left            =   120
      TabIndex        =   1
      Top             =   60
      Width           =   5415
   End
End
Attribute VB_Name = "frmIgnoreList"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
''*************************************************************************
'' A configuration form, Add/delete search paths when looking for existing pictures
''
'' Coded by Dale Pitman - PyroDesign


Private Sub cmdAdd_Click()
    Call Execute("INSERT INTO IgnorePaths (path) VALUES (" & FilterString(txtPath.Text) & " )", True)
    Call RefreshList
End Sub

Private Sub cmdDelete_Click()
    Call Execute("DELETE FROM IgnorePaths WHERE UID=" & lstIgnore.ItemData(lstIgnore.ListIndex), True)
    Call RefreshList
End Sub

Private Sub cmdTempPath_Click()
    Dim path As String
    On Error GoTo fin
    
    MDIMain.CommonDialogControl.InitDir = txtPath.Text
    MDIMain.CommonDialogControl.ShowSave
    path = Left$(MDIMain.CommonDialogControl.FileName, InStrRev(MDIMain.CommonDialogControl.FileName, "\"))
    If path <> "" Then
        txtPath.Text = path
    End If
fin:
End Sub

Private Sub RefreshList()
    Dim rstemp As Recordset
    
    If (OpenRecordset(rstemp, "SELECT * FROM IgnorePaths", dbOpenSnapshot)) Then
        Do While rstemp.EOF = False
            Call lstIgnore.AddItem(rstemp!path)
            lstIgnore.ItemData(lstIgnore.ListCount - 1) = rstemp!UID
        
            rstemp.MoveNext
        Loop
    
    Else
    End If
    cmdDelete.Enabled = False
    txtPath.Text = ""
End Sub

Private Sub Form_Load()
    Call RefreshList
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Call FRMMain.GetIgnorePaths
End Sub

Private Sub lstIgnore_Click()
    txtPath.Text = lstIgnore.List(lstIgnore.ListIndex)
    cmdDelete.Enabled = True
End Sub

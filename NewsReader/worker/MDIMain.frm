VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.MDIForm MDIMain 
   BackColor       =   &H8000000C&
   Caption         =   "Worker MDI"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7695
   LinkTopic       =   "MDIForm1"
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox PICBackground 
      Align           =   1  'Align Top
      Height          =   195
      Left            =   0
      ScaleHeight     =   135
      ScaleWidth      =   7635
      TabIndex        =   6
      Top             =   615
      Visible         =   0   'False
      Width           =   7695
   End
   Begin MSComDlg.CommonDialog CommonDialogControl 
      Left            =   1320
      Top             =   1740
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.PictureBox Picture1 
      Align           =   1  'Align Top
      Height          =   615
      Left            =   0
      ScaleHeight     =   555
      ScaleWidth      =   7635
      TabIndex        =   0
      Top             =   0
      Width           =   7695
      Begin VB.Label LBLAction 
         Caption         =   "<action>"
         Height          =   195
         Left            =   1920
         TabIndex        =   5
         Top             =   360
         Width           =   1455
      End
      Begin VB.Label LBLYencMessage 
         Caption         =   "<yenc message>"
         Height          =   255
         Left            =   6000
         TabIndex        =   4
         Top             =   120
         Width           =   1455
      End
      Begin VB.Label LBLProgress 
         Caption         =   "<progress>"
         Height          =   255
         Left            =   4560
         TabIndex        =   3
         Top             =   180
         Width           =   1215
      End
      Begin VB.Label LBLPacketNumber 
         Caption         =   "<packet number>"
         Height          =   255
         Left            =   2640
         TabIndex        =   2
         Top             =   60
         Width           =   1455
      End
      Begin VB.Label LBLTransfer 
         Caption         =   "<transfer>"
         Height          =   315
         Left            =   720
         TabIndex        =   1
         Top             =   120
         Width           =   1335
      End
   End
End
Attribute VB_Name = "MDIMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


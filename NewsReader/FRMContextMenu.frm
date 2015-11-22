VERSION 5.00
Begin VB.Form FRMContextMenu 
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   900
   ClientLeft      =   15
   ClientTop       =   300
   ClientWidth     =   4830
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   900
   ScaleWidth      =   4830
   Visible         =   0   'False
   WindowState     =   1  'Minimized
   Begin VB.Menu mnuFilesMenu 
      Caption         =   "Files Menu"
      Begin VB.Menu mnuDownloadFiles 
         Caption         =   "Download Files"
      End
      Begin VB.Menu mnuDownloadAutoHide 
         Caption         =   "Download / AutoHide"
      End
      Begin VB.Menu mnuSpacer1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuHide 
         Caption         =   "Hide"
      End
      Begin VB.Menu mnuHideAll 
         Caption         =   "Hide All"
      End
      Begin VB.Menu mnuSpacer2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuDownloadFirst 
         Caption         =   "Download First"
         Visible         =   0   'False
      End
      Begin VB.Menu mnuPauseFiles 
         Caption         =   "Pause Files"
      End
      Begin VB.Menu mnuMoveToAutoHide 
         Caption         =   "Move to Auto hide"
      End
      Begin VB.Menu mnuHide2Day 
         Caption         =   "Hide >2 Day"
      End
      Begin VB.Menu mnublank3 
         Caption         =   "-"
      End
      Begin VB.Menu mnuRefresh 
         Caption         =   "Refresh"
      End
   End
End
Attribute VB_Name = "FRMContextMenu"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
''*************************************************************************
'' A holder form for the context menu used on the file list form (frmViewFiles)
''
'' Coded by Dale Pitman - PyroDesign

Private vParent As Form

Public ShowHandlingPopupMenu As Boolean

Public vUseUnitCost As Boolean
Public vDiscountIndex As Long

Public Sub SetParent(pform As Form)
    Set vParent = pform
End Sub


Private Sub Form_Load()
    Me.Hide
End Sub

Private Sub mnuDownloadAutoHide_Click()
    Call FRMViewFiles.HandleContextMenu(mnuDownloadFiles.Name)
    Call FRMViewFiles.HandleContextMenu(mnuMoveToAutoHide.Name)
End Sub

Private Sub mnuDownloadFiles_Click()
    Call FRMViewFiles.HandleContextMenu(mnuDownloadFiles.Name)
End Sub

Private Sub mnuDownloadFirst_Click()
    Call FRMViewFiles.HandleContextMenu(mnuDownloadFirst.Name)
End Sub

Private Sub mnuHide_Click()
    Call FRMViewFiles.HandleContextMenu(mnuHide.Name)
End Sub

Private Sub mnuHide2Day_Click()
    Call FRMViewFiles.HandleContextMenu(mnuHide2Day.Name)
End Sub

Private Sub mnuHideAll_Click()
    Call FRMViewFiles.HandleContextMenu(mnuHideAll.Name)
End Sub

Private Sub mnuMoveToAutoHide_Click()
    Call FRMViewFiles.HandleContextMenu(mnuMoveToAutoHide.Name)
End Sub

Private Sub mnuPauseFiles_Click()
    Call FRMViewFiles.HandleContextMenu(mnuPauseFiles.Name)
End Sub

Private Sub mnuRefresh_Click()
    Call FRMViewFiles.HandleContextMenu(mnuRefresh.Name)
End Sub

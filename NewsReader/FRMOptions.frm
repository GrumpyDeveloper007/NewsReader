VERSION 5.00
Object = "{68670FAD-7A98-11D5-910D-0080C845CEED}#12.0#0"; "TxtBox.ocx"
Begin VB.Form FRMOptions 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Options"
   ClientHeight    =   9210
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7545
   HelpContextID   =   1
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   9210
   ScaleWidth      =   7545
   Begin VB.Frame fraMisc 
      Caption         =   "Misc"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1095
      Left            =   120
      TabIndex        =   82
      Top             =   5040
      Width           =   7335
      Begin VB.CheckBox chkStatusVisible 
         Caption         =   "Status Visible"
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
         Left            =   3720
         TabIndex        =   87
         Top             =   300
         Width           =   1935
      End
      Begin ELFTxtBox.TxtBox1 txtMaxArticleAge 
         Height          =   315
         Left            =   1680
         TabIndex        =   83
         Top             =   300
         Width           =   615
         _ExtentX        =   1085
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
         AutoSelect      =   -1  'True
      End
      Begin ELFTxtBox.TxtBox1 txtConnectionAttempts 
         Height          =   315
         Left            =   1680
         TabIndex        =   85
         Top             =   660
         Width           =   1095
         _ExtentX        =   1931
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
         Caption         =   "Connection Attempts"
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
         Index           =   8
         Left            =   0
         TabIndex        =   86
         Top             =   720
         Width           =   1575
      End
      Begin VB.Label LBLZ1 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Max Article age %"
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
         Index           =   10
         Left            =   120
         TabIndex        =   84
         Top             =   360
         Width           =   1455
      End
   End
   Begin VB.Frame fraDownloading 
      Caption         =   "Downloading"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   120
      TabIndex        =   54
      Top             =   7500
      Width           =   7335
      Begin VB.CheckBox chkDownload 
         Caption         =   "22-23"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   22
         Left            =   6120
         Style           =   1  'Graphical
         TabIndex        =   77
         Top             =   600
         Width           =   550
      End
      Begin VB.CheckBox chkDownload 
         Caption         =   "21-22"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   21
         Left            =   5520
         Style           =   1  'Graphical
         TabIndex        =   76
         Top             =   600
         Width           =   550
      End
      Begin VB.CheckBox chkDownload 
         Caption         =   "20-21"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   20
         Left            =   4920
         Style           =   1  'Graphical
         TabIndex        =   75
         Top             =   600
         Width           =   550
      End
      Begin VB.CheckBox chkDownload 
         Caption         =   "19-20"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   19
         Left            =   4320
         Style           =   1  'Graphical
         TabIndex        =   74
         Top             =   600
         Width           =   550
      End
      Begin VB.CheckBox chkDownload 
         Caption         =   "18-19"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   18
         Left            =   3720
         Style           =   1  'Graphical
         TabIndex        =   73
         Top             =   600
         Width           =   550
      End
      Begin VB.CheckBox chkDownload 
         Caption         =   "17-18"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   17
         Left            =   3120
         Style           =   1  'Graphical
         TabIndex        =   72
         Top             =   600
         Width           =   550
      End
      Begin VB.CheckBox chkDownload 
         Caption         =   "16-17"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   16
         Left            =   2520
         Style           =   1  'Graphical
         TabIndex        =   71
         Top             =   600
         Width           =   550
      End
      Begin VB.CheckBox chkDownload 
         Caption         =   "15-16"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   15
         Left            =   1920
         Style           =   1  'Graphical
         TabIndex        =   70
         Top             =   600
         Width           =   550
      End
      Begin VB.CheckBox chkDownload 
         Caption         =   "14-15"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   14
         Left            =   1320
         Style           =   1  'Graphical
         TabIndex        =   69
         Top             =   600
         Width           =   550
      End
      Begin VB.CheckBox chkDownload 
         Caption         =   "13-14"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   13
         Left            =   720
         Style           =   1  'Graphical
         TabIndex        =   68
         Top             =   600
         Width           =   550
      End
      Begin VB.CheckBox chkDownload 
         Caption         =   "12-13"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   12
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   67
         Top             =   600
         Width           =   550
      End
      Begin VB.CheckBox chkDownload 
         Caption         =   "11-12"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   11
         Left            =   6720
         Style           =   1  'Graphical
         TabIndex        =   66
         Top             =   300
         Width           =   550
      End
      Begin VB.CheckBox chkDownload 
         Caption         =   "10-11"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   10
         Left            =   6120
         Style           =   1  'Graphical
         TabIndex        =   65
         Top             =   300
         Width           =   550
      End
      Begin VB.CheckBox chkDownload 
         Caption         =   "0-1"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   0
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   64
         Top             =   300
         Width           =   550
      End
      Begin VB.CheckBox chkDownload 
         Caption         =   "1-2"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   1
         Left            =   720
         Style           =   1  'Graphical
         TabIndex        =   63
         Top             =   300
         Width           =   550
      End
      Begin VB.CheckBox chkDownload 
         Caption         =   "2-3"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   2
         Left            =   1320
         Style           =   1  'Graphical
         TabIndex        =   62
         Top             =   300
         Width           =   550
      End
      Begin VB.CheckBox chkDownload 
         Caption         =   "3-4"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   3
         Left            =   1920
         Style           =   1  'Graphical
         TabIndex        =   61
         Top             =   300
         Width           =   550
      End
      Begin VB.CheckBox chkDownload 
         Caption         =   "4-5"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   4
         Left            =   2520
         Style           =   1  'Graphical
         TabIndex        =   60
         Top             =   300
         Width           =   550
      End
      Begin VB.CheckBox chkDownload 
         Caption         =   "5-6"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   5
         Left            =   3120
         Style           =   1  'Graphical
         TabIndex        =   59
         Top             =   300
         Width           =   550
      End
      Begin VB.CheckBox chkDownload 
         Caption         =   "6-7"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   6
         Left            =   3720
         Style           =   1  'Graphical
         TabIndex        =   58
         Top             =   300
         Width           =   550
      End
      Begin VB.CheckBox chkDownload 
         Caption         =   "7-8"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   7
         Left            =   4320
         Style           =   1  'Graphical
         TabIndex        =   57
         Top             =   300
         Width           =   550
      End
      Begin VB.CheckBox chkDownload 
         Caption         =   "8-9"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   8
         Left            =   4920
         Style           =   1  'Graphical
         TabIndex        =   56
         Top             =   300
         Width           =   550
      End
      Begin VB.CheckBox chkDownload 
         Caption         =   "9-10"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   9
         Left            =   5520
         Style           =   1  'Graphical
         TabIndex        =   55
         Top             =   300
         Width           =   550
      End
   End
   Begin VB.Frame fraAutoFeatures 
      Caption         =   "Auto Features"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1815
      Left            =   5160
      TabIndex        =   48
      Top             =   1560
      Width           =   2295
      Begin VB.CheckBox chkFilterSVCD 
         Caption         =   "Filter .SVCD in DVDr"
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
         Left            =   120
         TabIndex        =   53
         Top             =   1260
         Width           =   1935
      End
      Begin VB.CheckBox chkFilterXVID 
         Caption         =   "Filter .XVID in DVDr"
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
         Left            =   120
         TabIndex        =   52
         Top             =   960
         Width           =   1935
      End
      Begin VB.CheckBox chkDownloadNfo 
         Caption         =   "Download NFO's First"
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
         Left            =   120
         TabIndex        =   50
         Top             =   660
         Width           =   1935
      End
      Begin VB.CheckBox chkAutoDownloadJPG 
         Caption         =   "Auto Download JPG"
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
         Left            =   120
         TabIndex        =   49
         Top             =   360
         Width           =   1935
      End
   End
   Begin VB.Frame fraAlternateServer 
      Caption         =   "Alternate Server"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1815
      Left            =   120
      TabIndex        =   41
      Top             =   1560
      Visible         =   0   'False
      Width           =   4935
      Begin VB.CheckBox chkUseAlternateServer 
         Caption         =   "Use Alternate Server"
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
         Left            =   1440
         TabIndex        =   51
         Top             =   1440
         Width           =   1935
      End
      Begin ELFTxtBox.TxtBox1 txtBackupServer 
         Height          =   315
         Left            =   1440
         TabIndex        =   42
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
      Begin ELFTxtBox.TxtBox1 txtBackupUsername 
         Height          =   315
         Left            =   1440
         TabIndex        =   43
         Top             =   660
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
         AutoSelect      =   -1  'True
      End
      Begin ELFTxtBox.TxtBox1 txtBackupPassword 
         Height          =   315
         Left            =   1440
         TabIndex        =   44
         Top             =   1080
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
         AutoSelect      =   -1  'True
      End
      Begin VB.Label LBLZ1 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Password"
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
         Index           =   7
         Left            =   240
         TabIndex        =   47
         Top             =   1110
         Width           =   1095
      End
      Begin VB.Label LBLZ1 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Username"
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
         Index           =   5
         Left            =   120
         TabIndex        =   46
         Top             =   720
         Width           =   1215
      End
      Begin VB.Label LBLZ1 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Server Name"
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
         Left            =   120
         TabIndex        =   45
         Top             =   270
         Width           =   1215
      End
   End
   Begin VB.Frame fraPrimaryServer 
      Caption         =   "Primary Server"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1455
      Left            =   120
      TabIndex        =   34
      Top             =   60
      Width           =   4935
      Begin ELFTxtBox.TxtBox1 TXTServerName 
         Height          =   315
         Left            =   1440
         TabIndex        =   35
         Top             =   180
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
      Begin ELFTxtBox.TxtBox1 TXTUserName 
         Height          =   315
         Left            =   1440
         TabIndex        =   36
         Top             =   600
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
         AutoSelect      =   -1  'True
      End
      Begin ELFTxtBox.TxtBox1 TXTPassword 
         Height          =   315
         Left            =   1440
         TabIndex        =   37
         Top             =   1020
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
         AutoSelect      =   -1  'True
      End
      Begin VB.Label LBLZ1 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Server Name"
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
         TabIndex        =   40
         Top             =   210
         Width           =   1215
      End
      Begin VB.Label LBLZ1 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Username"
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
         Index           =   1
         Left            =   120
         TabIndex        =   39
         Top             =   660
         Width           =   1215
      End
      Begin VB.Label LBLZ1 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Password"
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
         Index           =   2
         Left            =   240
         TabIndex        =   38
         Top             =   1050
         Width           =   1095
      End
   End
   Begin VB.Frame fraSchedule 
      Caption         =   "Schedule"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   120
      TabIndex        =   9
      Top             =   6180
      Width           =   7335
      Begin VB.CheckBox chkSchedule 
         Caption         =   "9-10"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   9
         Left            =   5520
         Style           =   1  'Graphical
         TabIndex        =   32
         Top             =   540
         Width           =   550
      End
      Begin VB.CheckBox chkSchedule 
         Caption         =   "8-9"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   8
         Left            =   4920
         Style           =   1  'Graphical
         TabIndex        =   31
         Top             =   540
         Width           =   550
      End
      Begin VB.CheckBox chkSchedule 
         Caption         =   "7-8"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   7
         Left            =   4320
         Style           =   1  'Graphical
         TabIndex        =   30
         Top             =   540
         Width           =   550
      End
      Begin VB.CheckBox chkSchedule 
         Caption         =   "6-7"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   6
         Left            =   3720
         Style           =   1  'Graphical
         TabIndex        =   29
         Top             =   540
         Width           =   550
      End
      Begin VB.CheckBox chkSchedule 
         Caption         =   "5-6"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   5
         Left            =   3120
         Style           =   1  'Graphical
         TabIndex        =   28
         Top             =   540
         Width           =   550
      End
      Begin VB.CheckBox chkSchedule 
         Caption         =   "4-5"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   4
         Left            =   2520
         Style           =   1  'Graphical
         TabIndex        =   27
         Top             =   540
         Width           =   550
      End
      Begin VB.CheckBox chkSchedule 
         Caption         =   "3-4"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   3
         Left            =   1920
         Style           =   1  'Graphical
         TabIndex        =   26
         Top             =   540
         Width           =   550
      End
      Begin VB.CheckBox chkSchedule 
         Caption         =   "2-3"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   2
         Left            =   1320
         Style           =   1  'Graphical
         TabIndex        =   25
         Top             =   540
         Width           =   550
      End
      Begin VB.CheckBox chkSchedule 
         Caption         =   "1-2"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   1
         Left            =   720
         Style           =   1  'Graphical
         TabIndex        =   24
         Top             =   540
         Width           =   550
      End
      Begin VB.CheckBox chkSchedule 
         Caption         =   "0-1"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   0
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   23
         Top             =   540
         Width           =   550
      End
      Begin VB.CheckBox chkSchedule 
         Caption         =   "10-11"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   10
         Left            =   6120
         Style           =   1  'Graphical
         TabIndex        =   22
         Top             =   540
         Width           =   550
      End
      Begin VB.CheckBox chkSchedule 
         Caption         =   "11-12"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   11
         Left            =   6720
         Style           =   1  'Graphical
         TabIndex        =   21
         Top             =   540
         Width           =   550
      End
      Begin VB.CheckBox chkSchedule 
         Caption         =   "12-13"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   12
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   20
         Top             =   840
         Width           =   550
      End
      Begin VB.CheckBox chkSchedule 
         Caption         =   "13-14"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   13
         Left            =   720
         Style           =   1  'Graphical
         TabIndex        =   19
         Top             =   840
         Width           =   550
      End
      Begin VB.CheckBox chkSchedule 
         Caption         =   "14-15"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   14
         Left            =   1320
         Style           =   1  'Graphical
         TabIndex        =   18
         Top             =   840
         Width           =   550
      End
      Begin VB.CheckBox chkSchedule 
         Caption         =   "15-16"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   15
         Left            =   1920
         Style           =   1  'Graphical
         TabIndex        =   17
         Top             =   840
         Width           =   550
      End
      Begin VB.CheckBox chkSchedule 
         Caption         =   "16-17"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   16
         Left            =   2520
         Style           =   1  'Graphical
         TabIndex        =   16
         Top             =   840
         Width           =   550
      End
      Begin VB.CheckBox chkSchedule 
         Caption         =   "17-18"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   17
         Left            =   3120
         Style           =   1  'Graphical
         TabIndex        =   15
         Top             =   840
         Width           =   550
      End
      Begin VB.CheckBox chkSchedule 
         Caption         =   "18-19"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   18
         Left            =   3720
         Style           =   1  'Graphical
         TabIndex        =   14
         Top             =   840
         Width           =   550
      End
      Begin VB.CheckBox chkSchedule 
         Caption         =   "19-20"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   19
         Left            =   4320
         Style           =   1  'Graphical
         TabIndex        =   13
         Top             =   840
         Width           =   550
      End
      Begin VB.CheckBox chkSchedule 
         Caption         =   "20-21"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   20
         Left            =   4920
         Style           =   1  'Graphical
         TabIndex        =   12
         Top             =   840
         Width           =   550
      End
      Begin VB.CheckBox chkSchedule 
         Caption         =   "21-22"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   21
         Left            =   5520
         Style           =   1  'Graphical
         TabIndex        =   11
         Top             =   840
         Width           =   550
      End
      Begin VB.CheckBox chkSchedule 
         Caption         =   "22-23"
         BeginProperty Font 
            Name            =   "Arial Narrow"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   22
         Left            =   6120
         Style           =   1  'Graphical
         TabIndex        =   10
         Top             =   840
         Width           =   550
      End
      Begin VB.CheckBox chkStartPars 
         Caption         =   "Start par2's / Refresh article list"
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
         Left            =   240
         TabIndex        =   33
         Top             =   240
         Width           =   3015
      End
   End
   Begin VB.Frame fraDownloadPaths 
      Caption         =   "Download Paths"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1575
      Left            =   120
      TabIndex        =   2
      Top             =   3420
      Width           =   7335
      Begin VB.CommandButton cmdDatabasePath 
         Caption         =   ".."
         Height          =   315
         Left            =   6960
         TabIndex        =   79
         Top             =   1080
         Width           =   255
      End
      Begin VB.CommandButton cmdPicturePath 
         Caption         =   ".."
         Height          =   315
         Left            =   6960
         TabIndex        =   8
         Top             =   660
         Width           =   255
      End
      Begin VB.CommandButton cmdTempPath 
         Caption         =   ".."
         Height          =   315
         Left            =   6960
         TabIndex        =   7
         Top             =   240
         Width           =   255
      End
      Begin ELFTxtBox.TxtBox1 TXTTempDownloadPath 
         Height          =   315
         Left            =   1800
         TabIndex        =   3
         ToolTipText     =   "This is the storage path for downloading files"
         Top             =   240
         Width           =   5055
         _ExtentX        =   8916
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
      Begin ELFTxtBox.TxtBox1 txtPicturePath 
         Height          =   315
         Left            =   1800
         TabIndex        =   5
         ToolTipText     =   "All pictures are copied in to a seperate folder"
         Top             =   660
         Width           =   5055
         _ExtentX        =   8916
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
      Begin ELFTxtBox.TxtBox1 txtDatabasePath 
         Height          =   315
         Left            =   1800
         TabIndex        =   80
         ToolTipText     =   "This location should have 2GB availible"
         Top             =   1080
         Width           =   5055
         _ExtentX        =   8916
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
         Caption         =   "Article Database"
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
         Index           =   9
         Left            =   480
         TabIndex        =   81
         Top             =   1110
         Width           =   1215
      End
      Begin VB.Label LBLZ1 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Picture"
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
         Index           =   6
         Left            =   840
         TabIndex        =   6
         Top             =   690
         Width           =   855
      End
      Begin VB.Label LBLZ1 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Temp"
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
         Left            =   600
         TabIndex        =   4
         Top             =   270
         Width           =   1095
      End
   End
   Begin VB.CommandButton CMDOK 
      Caption         =   "&OK"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   8700
      Width           =   1095
   End
   Begin VB.CommandButton CMDExit 
      Caption         =   "E&xit"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   6360
      TabIndex        =   1
      Top             =   8700
      Width           =   1095
   End
   Begin VB.Label lblDBInfo 
      Height          =   255
      Left            =   2280
      TabIndex        =   78
      Top             =   8580
      Width           =   3495
   End
End
Attribute VB_Name = "FRMOptions"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
''*************************************************************************
'' Settings form, loads / save and stores all program settings
''
'' Coded by Dale Pitman

Private vIsLoaded As Boolean

Private m_CompanyName As String

Private m_TempDownloadPath As String
Private m_ServerName As String
Private m_UserName As String
Private m_Password As String

Private m_BackupServerName As String
Private m_BackupUserName As String
Private m_BackupPassword As String

Private m_StartPars As Boolean

Private m_jpgPath As String

Private m_schedule(23) As Boolean
Private m_Download(23) As Boolean

Private m_Report2ndServer As Boolean
Private m_UseAlternateServer As Boolean
Private m_ConnectionAttempts As Long
Private m_StatusVisible As Boolean

Private m_AutoDownloadJPG As Boolean
Private m_FilterXVID As Boolean
Private m_FilterSVCD As Boolean
Private m_Database As String
Private m_DatabaseOLD As String
Private m_MaxArticleAge As Long


Public Property Let Report2ndServer(pValue As Boolean)
    m_Report2ndServer = pValue
End Property


Public Property Get CompanyName() As String
    CompanyName = m_CompanyName
End Property


Public Property Get TempDownloadPath() As String
    TempDownloadPath = m_TempDownloadPath
End Property

Public Property Get BackupServerName() As String
    BackupServerName = m_BackupServerName
End Property

Public Property Get BackupUsername() As String
    BackupUsername = m_BackupUserName
End Property

Public Property Get BackupPassword() As String
    BackupPassword = m_BackupPassword
End Property


Public Property Get ServerName() As String
    If m_Report2ndServer = False Then
        ServerName = m_ServerName
    Else
        ServerName = m_BackupServerName
    End If
End Property

Public Property Get Username() As String
    If m_Report2ndServer = False Then
        Username = m_UserName
    Else
        Username = m_BackupUserName
    End If
End Property

Public Property Get Password() As String
    If m_Report2ndServer = False Then
        Password = m_Password
    Else
        Password = m_BackupPassword
    End If
End Property

Public Property Get StartPars() As Boolean
    If App.PrevInstance = False Then
        StartPars = m_StartPars
    Else
        StartPars = False
    End If
End Property
    
Public Property Get JPGPath() As String
    JPGPath = m_jpgPath
End Property

Public Property Get Schedule(Index As Long) As Boolean
    Schedule = m_schedule(Index)
End Property

Public Property Get Download(Index As Long) As Boolean
    Download = m_Download(Index)
End Property

Public Property Get UseAlternateServer() As Boolean
    UseAlternateServer = m_UseAlternateServer
End Property

Public Property Get ConnectionAttempts() As Long
    ConnectionAttempts = m_ConnectionAttempts
End Property

Public Property Get StatusVisible() As Boolean
    StatusVisible = m_StatusVisible
End Property

Public Property Get AutoDownloadJPG() As Boolean
    AutoDownloadJPG = m_AutoDownloadJPG
End Property

Public Property Get FilterXVID() As Boolean
    FilterXVID = m_FilterXVID
End Property

Public Property Get FilterSVCD() As Boolean
    FilterSVCD = m_FilterSVCD
End Property

''
Public Function IsNotLoaded() As Boolean
    IsNotLoaded = Not vIsLoaded
End Function

Public Property Get Database() As String
    Database = m_Database
End Property

Public Property Get MaxArticleAge() As Long
    MaxArticleAge = m_MaxArticleAge
End Property

''
Public Sub SetFormFocus()
    Me.ZOrder
End Sub

Private Function SetServerSettingchk(pchk As CheckBoxConstants, pstrName As String) As Boolean
    If pchk = vbChecked Then
        Call SetServerSetting(pstrName, "True")
        SetServerSettingchk = True
    Else
        Call SetServerSetting(pstrName, "False")
        SetServerSettingchk = False
    End If
End Function

Private Function GetServerSettingchk(pstrName As String) As CheckBoxConstants
    If GetServerSetting(pstrName, False) = "True" Then
        GetServerSettingchk = vbChecked
    Else
        GetServerSettingchk = vbUnchecked
    End If
End Function

Private Sub chkSchedule_Click(Index As Integer)
    If Index < 22 Then
        chkSchedule(Index + 1).Value = vbUnchecked
    End If
End Sub


Private Sub cmdDatabase_Click()

End Sub

Private Sub cmdDatabasePath_Click()
    Dim path As String
    On Error GoTo fin
    
    MDIMain.CommonDialogControl.InitDir = txtDatabasePath.Text
    MDIMain.CommonDialogControl.ShowSave
    path = Left$(MDIMain.CommonDialogControl.FileName, InStrRev(MDIMain.CommonDialogControl.FileName, "\"))
    If path <> "" Then
        txtDatabasePath.Text = path
    End If
fin:

End Sub

''
Private Sub CMDOK_Click()
    Dim i As Long
    
    Call SetServerSetting("TempDownloadPath", TXTTempDownloadPath.Text)
    Call SetServerSetting("NewsServer", TXTServerName.Text)
    Call SetServerSetting("UserName", TXTUserName.Text)
    Call SetServerSetting("Password", TXTPassword.Text)
    
    Call SetServerSetting("BackupNewsServer", txtBackupServer.Text)
    Call SetServerSetting("BackupUserName", txtBackupUsername.Text)
    Call SetServerSetting("BackupPassword", txtBackupPassword.Text)
    
    Call SetServerSetting("JPGPath", txtPicturePath.Text)
    Call SetServerSetting("DatabasePath", txtDatabasePath.Text)
    
    
    m_StartPars = SetServerSettingchk(chkStartPars.Value, "StartPars")
    Call SetServerSettingchk(chkUseAlternateServer.Value, "UseAlternateServer")
    Call SetServerSetting("ConnectionAttempts", txtConnectionAttempts.Text)
    Call SetServerSettingchk(chkStatusVisible.Value, "StatusVisible")
    
    Call SetServerSettingchk(chkAutoDownloadJPG.Value, "AutoDownloadJPG")
    Call SetServerSettingchk(chkDownloadNfo.Value, "DownloadNFOsFirst")
    Call SetServerSettingchk(chkFilterXVID.Value, "FilterXVID")
    Call SetServerSettingchk(chkFilterSVCD.Value, "FilterSVCD")
    
    Call SetServerSetting("MaxArticleAge", txtMaxArticleAge.Text)
    
    For i = 0 To 22
        Call SetServerSetting("Schedule" & i, chkSchedule(i).Value)
    Next
    
    For i = 0 To 22
        Call SetServerSetting("Download" & i, chkDownload(i).Value)
    Next
    
    ' Refresh Program settings
    Call LoadSettings

    MDIMain.PicStatusBar.Visible = FRMOptions.StatusVisible
    Call MsgBox("Settings Saved", vbInformation + vbOKOnly, "Options")
    If m_DatabaseOLD <> m_Database Then
        Call MsgBox("The ArticleDB path has changed, please restart the application.", vbExclamation, "Save Settings")
        End
    End If
End Sub

''
Private Sub CMDExit_Click()
    Call Unload(Me)
End Sub

Private Sub cmdPicturePath_Click()
    Dim path As String
    On Error GoTo fin
    
    MDIMain.CommonDialogControl.InitDir = txtPicturePath.Text
    MDIMain.CommonDialogControl.ShowSave
    path = Left$(MDIMain.CommonDialogControl.FileName, InStrRev(MDIMain.CommonDialogControl.FileName, "\"))
    If path <> "" Then
        txtPicturePath.Text = path
    End If
fin:
End Sub

Private Sub cmdTempPath_Click()
    Dim path As String
    On Error GoTo fin
    
    MDIMain.CommonDialogControl.InitDir = TXTTempDownloadPath.Text
    MDIMain.CommonDialogControl.ShowSave
    path = Left$(MDIMain.CommonDialogControl.FileName, InStrRev(MDIMain.CommonDialogControl.FileName, "\"))
    If path <> "" Then
        TXTTempDownloadPath.Text = path
    End If
fin:
End Sub

''
Private Sub Form_Load()
    Dim i As Long
    vIsLoaded = True
    Call SetWindowPosition(Me)
    Call AllFormsLoad(Me)
    Dim rstemp As Recordset
    
    Call OpenRecordset(rstemp, "SELECT TOP 1 UID FROM [File] ORDER BY UID ASC", dbOpenSnapshot)

    lblDBInfo.Caption = "Free Space = " & Format(((rstemp!UID - gFileIDBase) * 10 * cFileGroupSize) / 1024 / 1024, "###,###,##0.00") & "MB"

    TXTServerName.Text = GetServerSetting("NewsServer", False)
    TXTUserName.Text = GetServerSetting("UserName", False)
    TXTPassword.Text = GetServerSetting("Password", False)
    
    txtBackupServer.Text = GetServerSetting("BackupNewsServer", False)
    txtBackupUsername.Text = GetServerSetting("BackupUserName", False)
    txtBackupPassword.Text = GetServerSetting("BackupPassword", False)
    chkUseAlternateServer.Value = GetServerSettingchk("UseAlternateServer")
    
    chkStartPars.Value = GetServerSettingchk("StartPars")
    
    TXTTempDownloadPath.Text = GetServerSetting("TempDownloadPath", False)
    txtPicturePath.Text = GetServerSetting("JPGPath", False)
    txtDatabasePath.Text = GetServerSetting("DatabasePath", False)
    m_DatabaseOLD = txtDatabasePath.Text
    
    
    chkStatusVisible.Value = GetServerSettingchk("StatusVisible")
    
    chkAutoDownloadJPG.Value = GetServerSettingchk("AutoDownloadJPG")
    chkDownloadNfo.Value = GetServerSettingchk("DownloadNFOsFirst")
    chkFilterXVID.Value = GetServerSettingchk("FilterXVID")
    chkFilterSVCD.Value = GetServerSettingchk("FilterSVCD")
    
'    lblPreviousInstance.Caption = "Previous Instance - " & App.PrevInstance
    
    For i = 0 To 22
        chkSchedule(i).Value = Val(GetServerSetting("Schedule" & i, False))
    Next
    
    For i = 0 To 22
        chkDownload(i).Value = Val(GetServerSetting("Download" & i, False))
    Next
    
    txtConnectionAttempts.Text = GetServerSetting("ConnectionAttempts", False)
    txtMaxArticleAge.Text = m_MaxArticleAge
    If m_MaxArticleAge = 0 Then
        m_MaxArticleAge = 30
    End If
    
End Sub

''
Public Sub LoadSettings()
    Dim i As Long

    m_TempDownloadPath = GetServerSetting("TempDownloadPath", False)
    
    m_ServerName = GetServerSetting("NewsServer", False)
    m_UserName = GetServerSetting("UserName", False)
    m_Password = GetServerSetting("Password", False)

    m_BackupServerName = GetServerSetting("BackupNewsServer", False)
    m_BackupUserName = GetServerSetting("BackupUserName", False)
    m_BackupPassword = GetServerSetting("BackupPassword", False)

    If GetServerSetting("StartPars", False) = "True" Then
        m_StartPars = vbChecked
    Else
        m_StartPars = vbUnchecked
    End If
    
    If GetServerSetting("UseAlternateServer", False) = "True" Then
        m_UseAlternateServer = True
    Else
        m_UseAlternateServer = False
    End If

    If GetServerSetting("StatusVisible", False) = "True" Then
        m_StatusVisible = True
    Else
        m_StatusVisible = False
    End If

    If GetServerSetting("AutoDownloadJPG", False) = "True" Then
        m_AutoDownloadJPG = True
    Else
        m_AutoDownloadJPG = False
    End If
    If GetServerSetting("FilterXVID", False) = "True" Then
        m_FilterXVID = True
    Else
        m_FilterXVID = False
    End If
    If GetServerSetting("FilterSVCD", False) = "True" Then
        m_FilterSVCD = True
    Else
        m_FilterSVCD = False
    End If


    m_jpgPath = GetServerSetting("JPGPath", False)
    m_Database = GetServerSetting("DatabasePath", False)

    For i = 0 To 22
        If Val(GetServerSetting("Schedule" & i, False)) = 1 Then
            m_schedule(i) = True
        Else
            m_schedule(i) = False
        End If
    Next

    For i = 0 To 22
        If Val(GetServerSetting("Download" & i, False)) = 1 Then
            m_Download(i) = True
        Else
            m_Download(i) = False
        End If
    Next

    m_ConnectionAttempts = Val(GetServerSetting("ConnectionAttempts", False))
    m_MaxArticleAge = Val(GetServerSetting("MaxArticleAge", False))
    If m_MaxArticleAge = 0 Then
        m_MaxArticleAge = 30
    End If
    
End Sub

''
Private Sub Form_Unload(Cancel As Integer)
    Call GetWindowPosition(Me)
End Sub


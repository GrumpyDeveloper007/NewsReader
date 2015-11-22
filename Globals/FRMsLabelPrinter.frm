VERSION 5.00
Object = "{68670FAD-7A98-11D5-910D-0080C845CEED}#12.0#0"; "TxtBox.ocx"
Begin VB.Form FRMsLabelPrinter 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "<Name Here>"
   ClientHeight    =   5460
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8235
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   364
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   549
   Begin VB.CommandButton CMDSave 
      Caption         =   "Save"
      Height          =   315
      Left            =   4560
      TabIndex        =   22
      Top             =   1980
      Width           =   1095
   End
   Begin VB.ComboBox CBOLabelStyle 
      Height          =   315
      Left            =   5400
      Style           =   2  'Dropdown List
      TabIndex        =   5
      Top             =   60
      Width           =   2775
   End
   Begin VB.CommandButton CMDPrint 
      Caption         =   "Print"
      Height          =   375
      Left            =   0
      TabIndex        =   3
      Top             =   5040
      Width           =   1095
   End
   Begin VB.CommandButton CMDLocation 
      Caption         =   "0"
      Height          =   435
      Index           =   0
      Left            =   960
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   60
      Width           =   615
   End
   Begin VB.CommandButton CMDExit 
      Caption         =   "E&xit"
      Height          =   375
      Left            =   7080
      TabIndex        =   1
      Top             =   5040
      Width           =   1095
   End
   Begin ELFTxtBox.TxtBox1 TXTMarginX 
      Height          =   285
      Left            =   5400
      TabIndex        =   6
      Top             =   480
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   503
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
      AutoSelect      =   -1  'True
   End
   Begin ELFTxtBox.TxtBox1 TXTMarginY 
      Height          =   285
      Left            =   7080
      TabIndex        =   8
      Top             =   480
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   503
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
      AutoSelect      =   -1  'True
   End
   Begin ELFTxtBox.TxtBox1 TXTWidth 
      Height          =   285
      Left            =   5400
      TabIndex        =   10
      Top             =   840
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   503
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
      AutoSelect      =   -1  'True
   End
   Begin ELFTxtBox.TxtBox1 TXTHeight 
      Height          =   285
      Left            =   7080
      TabIndex        =   12
      Top             =   840
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   503
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
      AutoSelect      =   -1  'True
   End
   Begin ELFTxtBox.TxtBox1 TXTSpacingX 
      Height          =   285
      Left            =   5400
      TabIndex        =   14
      Top             =   1200
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   503
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
      AutoSelect      =   -1  'True
   End
   Begin ELFTxtBox.TxtBox1 TXTSpacingY 
      Height          =   285
      Left            =   7080
      TabIndex        =   16
      Top             =   1200
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   503
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
      AutoSelect      =   -1  'True
   End
   Begin ELFTxtBox.TxtBox1 TXTRows 
      Height          =   285
      Left            =   7080
      TabIndex        =   18
      Top             =   1560
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   503
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
      AutoSelect      =   -1  'True
   End
   Begin ELFTxtBox.TxtBox1 TXTColumns 
      Height          =   285
      Left            =   5400
      TabIndex        =   20
      Top             =   1560
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   503
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
      AutoSelect      =   -1  'True
   End
   Begin ELFTxtBox.TxtBox1 TXTCopies 
      Height          =   285
      Left            =   7080
      TabIndex        =   23
      Top             =   1920
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   503
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
      AutoSelect      =   -1  'True
   End
   Begin VB.Label LBLZ1 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "Copies"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   8
      Left            =   5640
      TabIndex        =   24
      Top             =   1950
      Width           =   1335
   End
   Begin VB.Label LBLZ1 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "Columns"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   7
      Left            =   4440
      TabIndex        =   21
      Top             =   1590
      Width           =   855
   End
   Begin VB.Label LBLZ1 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "Rows"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   6
      Left            =   6120
      TabIndex        =   19
      Top             =   1590
      Width           =   855
   End
   Begin VB.Label LBLZ1 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "Spacing Y"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   5
      Left            =   5880
      TabIndex        =   17
      Top             =   1230
      Width           =   1095
   End
   Begin VB.Label LBLZ1 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "Spacing X"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   4
      Left            =   4200
      TabIndex        =   15
      Top             =   1230
      Width           =   1095
   End
   Begin VB.Label LBLZ1 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "Height"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   3
      Left            =   6120
      TabIndex        =   13
      Top             =   870
      Width           =   855
   End
   Begin VB.Label LBLZ1 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "Width"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   0
      Left            =   4440
      TabIndex        =   11
      Top             =   870
      Width           =   855
   End
   Begin VB.Label LBLZ1 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "Margin Y"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   2
      Left            =   6120
      TabIndex        =   9
      Top             =   510
      Width           =   855
   End
   Begin VB.Label LBLZ1 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "Margin X"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   10
      Left            =   4440
      TabIndex        =   7
      Top             =   510
      Width           =   855
   End
   Begin VB.Label LBLZ1 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "Label Style"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   1
      Left            =   4080
      TabIndex        =   4
      Top             =   60
      Width           =   1215
   End
   Begin VB.Label LBLZ1 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "Location"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   14
      Left            =   0
      TabIndex        =   0
      Top             =   60
      Width           =   855
   End
End
Attribute VB_Name = "FRMsLabelPrinter"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
''*************************************************************************
'' <Sample> Object
''
'' Coded by Dale Pitman - PyroDesign

Private vUid As Long
'' Search criteria(Input Parameters)

'' settings
Private vMarginX As Double
Private vMarginY As Double
Private vWidth As Double
Private vHeight As Double
Private vSpacingX As Double
Private vSpacingY As Double
Private vColumns As Double
Private vRows As Double
Private vCopies As Long

Private vIndex As Long

Private vLabelStyle As Long

Private vSQL As String

'' Output parameters
'Private vPartid As Long ' *This is a sample parameter


''
'Private vShiftStatus As Boolean ' True=down

''
'Private vParent As Form                 ' The parent that this form belongs to
Private vCurrentActiveChild As Form     ' If this form has children, this is the currently/previously active one
Private vIsLoaded As Boolean

Private vDataChanged As Boolean

Private vPrinter As New cPrinterClass
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

'' Used to attach this form to parent, for callback/context knowledge
'Public Sub SetParent(pform As Form)
'    Set vParent = pform
'End Sub

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
Public Function Search(pSQL As String) As Boolean
    vSQL = pSQL
    Call LoadSettings
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

''
Public Sub LoadSettings()
    Dim DefaultDisclaimerID As Long
    Dim rstemp As Recordset
    Dim i As Long
    vMarginX = Val(GetServerSetting("LABELSETTINGS_MARGINX", False))
    vMarginY = Val(GetServerSetting("LABELSETTINGS_MARGINY", False))
    vWidth = Val(GetServerSetting("LABELSETTINGS_WIDTH", False))
    vHeight = Val(GetServerSetting("LABELSETTINGS_HEIGHT", False))
    vSpacingX = Val(GetServerSetting("LABELSETTINGS_SPACINGX", False))
    vSpacingY = Val(GetServerSetting("LABELSETTINGS_SPACINGY", False))
    vColumns = Val(GetServerSetting("LABELSETTINGS_COLUMNS", False))
    vRows = Val(GetServerSetting("LABELSETTINGS_ROWS", False))
    vCopies = Val(GetServerSetting("LABELSETTINGS_COPIES", False))
    If (vCopies = 0) Then
        vCopies = 1
    End If
    
    vLabelStyle = Val(GetServerSetting("LABELSETTINGS_LABELSTYLE", False))
    vIndex = Val(GetServerSetting("LABELSETTINGS_INDEX", False))
End Sub

Public Sub SetupLocation()
    Dim NumberOfLabels As Long
    Dim i As Long
    NumberOfLabels = Val(TXTColumns.Text) * Val(TXTRows.Text)
    
    For i = 0 To NumberOfLabels - 1
        If (i > CMDLocation.Count - 1) Then
            Call Load(CMDLocation(i))
        End If
        CMDLocation(i).Visible = True
        CMDLocation(i).Left = CMDLocation(0).Left + (CMDLocation(0).Width + 5) * (i Mod Val(TXTColumns.Text))
        CMDLocation(i).Top = CMDLocation(0).Top + (CMDLocation(0).Height + 5) * (i \ Val(TXTColumns.Text))
        CMDLocation(i).BackColor = &H8000000F
        CMDLocation(i).Caption = i
    Next
    Do While (i < CMDLocation.Count - 1)
        CMDLocation(i).Visible = False
    Loop
    
    If (vIndex < CMDLocation.Count) Then
        CMDLocation(vIndex).BackColor = &H80FFFF
    End If
End Sub


Private Sub PrintLabel(pIndex As Long, prsData As Recordset, pTags() As InlineSQLTYPE, pSupressBlank As Boolean)
    Dim i As Long
    Dim t As Long

    vPrinter.CurrentY = vMarginY + (pIndex \ vColumns) * vHeight
    If ((pIndex \ vColumns) > 0) Then
        vPrinter.CurrentY = vPrinter.CurrentY + ((pIndex \ vColumns) - 1) * vSpacingY
    End If
    
    For i = 0 To prsData.Fields.Count - 1
        ' Process Tags
        vPrinter.FontBold = False
        vPrinter.FontItalic = False
        For t = 0 To UBound(pTags, 1)
            If (pTags(t).Index = i) Then
                If (pTags(t).Name = "FONTSIZE") Then
                    vPrinter.fontsize = Val(pTags(t).Value)
                End If
                If (pTags(t).Name = "FONTBOLD") Then
                    vPrinter.FontBold = pTags(t).Value
                End If
                If (pTags(t).Name = "FONTITALIC") Then
                    vPrinter.FontItalic = pTags(t).Value
                End If
            End If
        Next
        If (pSupressBlank = True And Trim$(prsData.Fields(i).Value) = "") Then
        Else
            Call vPrinter.PrintX(vMarginX + (pIndex Mod vColumns) * vWidth + ((pIndex Mod vColumns) - 1) * vSpacingX, prsData.Fields(i).Value, True)
        End If
    Next
End Sub

''
Public Sub SaveSettings()
    Dim DefaultDisclaimerID As Long
    Dim rstemp As Recordset
    Dim i As Long
    Call SetServerSetting("LABELSETTINGS_LABELSTYLE", Val(vLabelStyle))
    Call SetServerSetting("LABELSETTINGS_INDEX", CStr(vIndex))
    
    Call SetServerSetting("LABELSETTINGS_MARGINX", CStr(vMarginX))
    Call SetServerSetting("LABELSETTINGS_MARGINY", CStr(vMarginY))
    Call SetServerSetting("LABELSETTINGS_WIDTH", CStr(vWidth))
    Call SetServerSetting("LABELSETTINGS_HEIGHT", CStr(vHeight))
    Call SetServerSetting("LABELSETTINGS_SPACINGX", CStr(vSpacingX))
    Call SetServerSetting("LABELSETTINGS_SPACINGY", CStr(vSpacingY))
    Call SetServerSetting("LABELSETTINGS_COLUMNS", CStr(vColumns))
    Call SetServerSetting("LABELSETTINGS_COPIES", CStr(vCopies))
    
    Call SetServerSetting("LABELSETTINGS_ROWS", CStr(vRows))
End Sub

'' reset all class details
Private Sub ClearDetails()
    Dim rstemp As Recordset
    Dim SaveIndex As Long
        
   
'    vShiftStatus = False
End Sub

''
Private Sub SetupFieldSizes()
    Dim rstemp As Recordset
    Dim i As Long
'    If (OpenRecordset(rstemp, "Employee", dbOpenTable)) Then
'        TXTName.MaxLength = GetFieldSize(rstemp, "name")
'        TXTShortName.MaxLength = GetFieldSize(rstemp, "shortname")
'    End If
End Sub

Private Sub PrintLabels(pSQL As String)

End Sub

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'' Form objects

''
Private Sub CBOLabelStyle_Click()
    If (CBOLabelStyle.ListIndex > 0) Then
        ' disable boxes
        TXTMarginX.Enabled = False
        TXTMarginY.Enabled = False
        TXTWidth.Enabled = False
        TXTHeight.Enabled = False
        TXTSpacingX.Enabled = False
        TXTSpacingY.Enabled = False
        TXTColumns.Enabled = False
        TXTRows.Enabled = False
        
        TXTMarginX.BackColor = cDisabledColour
        TXTMarginY.BackColor = cDisabledColour
        TXTWidth.BackColor = cDisabledColour
        TXTHeight.BackColor = cDisabledColour
        TXTSpacingX.BackColor = cDisabledColour
        TXTSpacingY.BackColor = cDisabledColour
        TXTColumns.BackColor = cDisabledColour
        TXTRows.BackColor = cDisabledColour
        
        Select Case CBOLabelStyle.ListIndex
            Case 1 ' 3x7
                TXTMarginX.Text = 10
                TXTMarginY.Text = 5
                TXTWidth.Text = 60
                TXTHeight.Text = 40
                TXTSpacingX.Text = 5
                TXTSpacingY.Text = 2
                TXTColumns.Text = 3
                TXTRows.Text = 7
            Case 2
            
        End Select
        
    Else
        ' enable boxes
        TXTMarginX.Enabled = True
        TXTMarginY.Enabled = True
        TXTWidth.Enabled = True
        TXTHeight.Enabled = True
        TXTSpacingX.Enabled = True
        TXTSpacingY.Enabled = True
        TXTColumns.Enabled = True
        TXTRows.Enabled = True
        
        TXTMarginX.BackColor = cEnabledColour
        TXTMarginY.BackColor = cEnabledColour
        TXTWidth.BackColor = cEnabledColour
        TXTHeight.BackColor = cEnabledColour
        TXTSpacingX.BackColor = cEnabledColour
        TXTSpacingY.BackColor = cEnabledColour
        TXTColumns.BackColor = cEnabledColour
        TXTRows.BackColor = cEnabledColour
        
    End If
End Sub

''
Private Sub CMDExit_Click()
'    Call vParent.SendChildInactive
    vIsLoaded = False
    Call Unload(Me)
    Call AllFormsHide(Me)
End Sub

Private Sub CMDLocation_Click(Index As Integer)
    vIndex = Index
'    CMDLocation(vIndex).BackColor = &H80FFFF
    Call SetupLocation
End Sub

Private Sub CMDPrint_Click()
    Dim tempSQL As String
    Dim Tags() As InlineSQLTYPE
    Dim rstemp As Recordset
    Dim SupressBlank As Boolean
    Dim t As Long
    tempSQL = vSQL
    SupressBlank = False
    Call StripTags(tempSQL, Tags)
    'SUPRESSBLANK
    For t = 0 To UBound(Tags, 1)
        If (Tags(t).Index = 0) Then
            If (Tags(t).Name = "SUPRESSBLANK") Then
                SupressBlank = True
            End If
        End If
    Next
    
    If (OpenRecordset(rstemp, tempSQL, dbOpenSnapshot)) Then
        If (rstemp.EOF = False) Then
            vPrinter.ClearDetails
            Printer.ScaleMode = vbMillimeters
            Call vPrinter.SetObject(Printer)
            Do While (rstemp.EOF = False)
                For t = 1 To vCopies
                    Call PrintLabel(vIndex, rstemp, Tags, SupressBlank)
                    vIndex = vIndex + 1
                    If (vIndex >= vColumns * vRows) Then
                        vIndex = 0
                    End If
                Next
                Call rstemp.MoveNext
            Loop

            Call vPrinter.PrintPage(1)
            Printer.EndDoc
        End If
    End If
    Call SetServerSetting("LABELSETTINGS_INDEX", CStr(vIndex))
    Call CMDLocation_Click(Val(vIndex))
End Sub

Private Sub CMDSave_Click()
    vLabelStyle = CBOLabelStyle.ListIndex
    If (vLabelStyle = 0) Then
        vMarginX = Val(TXTMarginX.Text)
        vMarginY = Val(TXTMarginY.Text)
        vWidth = Val(TXTWidth.Text)
        vHeight = Val(TXTHeight.Text)
        vSpacingX = Val(TXTSpacingX.Text)
        vSpacingY = Val(TXTSpacingY.Text)
        vColumns = Val(TXTColumns.Text)
        vRows = Val(TXTRows.Text)
        vCopies = Val(TXTCopies.Text)
    End If
    Call SaveSettings
End Sub

'' Set forms location, as stored in registory
Private Sub Form_Load()
    vIsLoaded = True
    Call AllFormsLoad(Me)
    Call SetWindowPosition(Me)
    
    Call CBOLabelStyle.AddItem("Custom")
    Call CBOLabelStyle.AddItem("A4 3x7")
    CBOLabelStyle.ListIndex = vLabelStyle
    
        TXTMarginX.Text = vMarginX
        TXTMarginY.Text = vMarginY
        TXTWidth.Text = vWidth
        TXTHeight.Text = vHeight
        TXTSpacingX.Text = vSpacingX
        TXTSpacingY.Text = vSpacingY
        TXTColumns.Text = vColumns
        TXTRows.Text = vRows
        TXTCopies.Text = vCopies
    
    Call SetupLocation
'    Me.Caption = "<NAME HERE> [" & vParent.Caption & "]"
    Call SetupFieldSizes
    Call ClearDetails
    vDataChanged = False
End Sub

'' Save forms location
Private Sub Form_Unload(Cancel As Integer)
    Call GetWindowPosition(Me)
    vIsLoaded = False
    Call AllFormsUnLoad(Me)
   
End Sub


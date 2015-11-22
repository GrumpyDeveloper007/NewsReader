VERSION 5.00
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomct2.ocx"
Begin VB.UserControl DateControl 
   BackStyle       =   0  'Transparent
   ClientHeight    =   3180
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4695
   ScaleHeight     =   3180
   ScaleWidth      =   4695
   ToolboxBitmap   =   "DateControl.ctx":0000
   Begin MSComCtl2.MonthView MonthView1 
      Height          =   2370
      Left            =   0
      TabIndex        =   5
      Top             =   660
      Width           =   2700
      _ExtentX        =   4763
      _ExtentY        =   4180
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      Appearance      =   1
      StartOfWeek     =   22675458
      CurrentDate     =   37963
   End
   Begin VB.CommandButton SpinUp 
      Caption         =   ">"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1800
      TabIndex        =   2
      ToolTipText     =   "Next day."
      Top             =   240
      Width           =   255
   End
   Begin VB.CommandButton SpinDown 
      Caption         =   "<"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1560
      TabIndex        =   1
      ToolTipText     =   "Previous day."
      Top             =   240
      Width           =   255
   End
   Begin MSMask.MaskEdBox TxtToday 
      Height          =   375
      Left            =   0
      TabIndex        =   0
      Top             =   240
      Width           =   1455
      _ExtentX        =   2566
      _ExtentY        =   661
      _Version        =   393216
      MaxLength       =   10
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Mask            =   "&&/&&/&&&&"
      PromptChar      =   "_"
   End
   Begin VB.CommandButton CMDCalendar 
      Caption         =   "^"
      Height          =   255
      Left            =   1560
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   0
      Width           =   495
   End
   Begin VB.Label LblDay 
      Alignment       =   2  'Center
      Caption         =   "Day here"
      ForeColor       =   &H00FF0000&
      Height          =   255
      Left            =   0
      TabIndex        =   3
      Top             =   0
      Width           =   1575
   End
End
Attribute VB_Name = "DateControl"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
'Default Property Values:
Const m_def_ForeColor = 0
Const m_def_Enabled = 0
'Property Variables:
Dim m_ForeColor As Long
Dim m_Enabled As Boolean
Dim m_Font As Font

Private vCalandarVisible As Boolean

'Event Declarations:
Event Click() 'MappingInfo=SpinDown,SpinDown,-1,Click
Attribute Click.VB_Description = "Occurs when the user presses and then releases a mouse button over an object."
Event DblClick()
Attribute DblClick.VB_Description = "Occurs when the user presses and releases a mouse button and then presses and releases it again over an object."
Event KeyDown(KeyCode As Integer, Shift As Integer)
Attribute KeyDown.VB_Description = "Occurs when the user presses a key while an object has the focus."
Event KeyPress(KeyAscii As Integer)
Attribute KeyPress.VB_Description = "Occurs when the user presses and releases an ANSI key."
Event KeyUp(KeyCode As Integer, Shift As Integer)
Attribute KeyUp.VB_Description = "Occurs when the user releases a key while an object has the focus."
Event MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Attribute MouseDown.VB_Description = "Occurs when the user presses the mouse button while an object has the focus."
Event MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Attribute MouseMove.VB_Description = "Occurs when the user moves the mouse."
Event MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
Attribute MouseUp.VB_Description = "Occurs when the user releases the mouse button while an object has the focus."



Private Sub CMDCalendar_Click()
    vCalandarVisible = True
    Call UserControl_Resize
    Call MonthView1.ZOrder
End Sub

Private Sub MonthView1_DateClick(ByVal DateClicked As Date)
    TxtToday.Text = MonthView1.Value
    vCalandarVisible = False
    Call UserControl_Resize
    CMDCalendar.SetFocus
End Sub

Private Sub SpinDown_Click()
    Dim sMyDate As Date
    If (IsDate(TxtToday.Text)) Then
        sMyDate = TxtToday.Text
    
        sMyDate = DateAdd("d", -1, sMyDate)
        TxtToday.Text = Format(sMyDate, "dd/mm/yyyy")
        LblDay.Caption = Format(sMyDate, "dddd")
    End If
    RaiseEvent Click
End Sub

Private Sub SpinUp_Click()
    Dim sMyDate As Date
    If (IsDate(TxtToday.Text)) Then
        sMyDate = TxtToday.Text
    
        sMyDate = DateAdd("d", 1, sMyDate)
        TxtToday.Text = Format(sMyDate, "dd/mm/yyyy")
        LblDay.Caption = Format(sMyDate, "dddd")
    End If
    RaiseEvent Click
End Sub
'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=UserControl,UserControl,-1,BackColor
Public Property Get BackColor() As OLE_COLOR
Attribute BackColor.VB_Description = "Returns/sets the background color used to display text and graphics in an object."
    BackColor = UserControl.BackColor
End Property

Public Property Let BackColor(ByVal New_BackColor As OLE_COLOR)
    UserControl.BackColor() = New_BackColor
    PropertyChanged "BackColor"
End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MemberInfo=8,0,0,0
Public Property Get ForeColor() As Long
Attribute ForeColor.VB_Description = "Returns/sets the foreground color used to display text and graphics in an object."
    ForeColor = m_ForeColor
End Property

Public Property Let ForeColor(ByVal New_ForeColor As Long)
    m_ForeColor = New_ForeColor
    PropertyChanged "ForeColor"
End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MemberInfo=0,0,0,0
Public Property Get Enabled() As Boolean
Attribute Enabled.VB_Description = "Returns/sets a value that determines whether an object can respond to user-generated events."
    Enabled = m_Enabled
End Property

Public Property Let Enabled(ByVal New_Enabled As Boolean)
    m_Enabled = New_Enabled
    PropertyChanged "Enabled"
End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MemberInfo=6,0,0,0
Public Property Get Font() As Font
Attribute Font.VB_Description = "Returns a Font object."
Attribute Font.VB_UserMemId = -512
    Set Font = m_Font
End Property

Public Property Set Font(ByVal New_Font As Font)
    Set m_Font = New_Font
    PropertyChanged "Font"
End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=UserControl,UserControl,-1,BackStyle
Public Property Get BackStyle() As Integer
Attribute BackStyle.VB_Description = "Indicates whether a Label or the background of a Shape is transparent or opaque."
    BackStyle = UserControl.BackStyle
End Property

Public Property Let BackStyle(ByVal New_BackStyle As Integer)
    UserControl.BackStyle() = New_BackStyle
    PropertyChanged "BackStyle"
End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=UserControl,UserControl,-1,BorderStyle
Public Property Get BorderStyle() As Integer
Attribute BorderStyle.VB_Description = "Returns/sets the border style for an object."
    BorderStyle = UserControl.BorderStyle
End Property

Public Property Let BorderStyle(ByVal New_BorderStyle As Integer)
    UserControl.BorderStyle() = New_BorderStyle
    PropertyChanged "BorderStyle"
End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MemberInfo=5
Public Sub Refresh()
Attribute Refresh.VB_Description = "Forces a complete repaint of a object."
     
End Sub

Public Property Get Text() As String
    Text = TxtToday.Text
End Property

Public Property Let Text(ByVal New_Text As String)
    Dim tempMask As String
    tempMask = TxtToday.Mask
    TxtToday.Mask = ""
    TxtToday.Text() = New_Text
     TxtToday.Mask = tempMask
    PropertyChanged "Text"
End Property

Private Sub TxtToday_Change()
    If (IsDate(TxtToday.Text)) Then
        LblDay.Caption = Format(TxtToday.Text, "dddd")
        MonthView1.Value = TxtToday.Text
    End If
End Sub

Private Sub TxtToday_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then
        KeyAscii = 0
'        SendKeys Chr$(9)
        RaiseEvent Click
    End If
End Sub

Private Sub TxtToday_LostFocus()
    If (IsDate(TxtToday.Text) = True) Then
        LblDay.Caption = Format(TxtToday, "dddd")
    Else
        TxtToday.Text = Format(Now, "dd/mm/yyyy")
        LblDay.Caption = Format(TxtToday, "dddd")
        Call MsgBox("Please enter only valid dates", vbExclamation)
    End If
End Sub

'Initialize Properties for User Control
Private Sub UserControl_InitProperties()
    m_ForeColor = m_def_ForeColor
    m_Enabled = m_def_Enabled
    Set m_Font = Ambient.Font
    vCalandarVisible = False
End Sub

'Load property values from storage
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)

    UserControl.BackColor = PropBag.ReadProperty("BackColor", &H8000000F)
    m_ForeColor = PropBag.ReadProperty("ForeColor", m_def_ForeColor)
    m_Enabled = PropBag.ReadProperty("Enabled", m_def_Enabled)
    Set m_Font = PropBag.ReadProperty("Font", Ambient.Font)
    UserControl.BackStyle = PropBag.ReadProperty("BackStyle", 1)
    UserControl.BorderStyle = PropBag.ReadProperty("BorderStyle", 0)
    TxtToday.Text = PropBag.ReadProperty("Text", Format(Now, "dd/mm/yyyy"))
    LblDay.Caption = Format(TxtToday, "dddd")
End Sub


Private Sub UserControl_Resize()
    If (vCalandarVisible = False) Then
        UserControl.Width = SpinUp.Left + SpinUp.Width
        UserControl.Height = SpinUp.Top + SpinUp.Height
    Else
        UserControl.Width = MonthView1.Left + MonthView1.Width
        UserControl.Height = MonthView1.Top + MonthView1.Height
    End If
End Sub

'Write property values to storage
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)

    Call PropBag.WriteProperty("BackColor", UserControl.BackColor, &H8000000F)
    Call PropBag.WriteProperty("ForeColor", m_ForeColor, m_def_ForeColor)
    Call PropBag.WriteProperty("Enabled", m_Enabled, m_def_Enabled)
    Call PropBag.WriteProperty("Font", m_Font, Ambient.Font)
    Call PropBag.WriteProperty("BackStyle", UserControl.BackStyle, 1)
    Call PropBag.WriteProperty("BorderStyle", UserControl.BorderStyle, 0)
    
    Call PropBag.WriteProperty("Text", TxtToday.Text, Format(Now, "dd/mm/yyyy"))
    LblDay.Caption = Format(TxtToday, "dddd")
End Sub


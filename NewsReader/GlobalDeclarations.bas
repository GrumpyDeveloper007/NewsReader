Attribute VB_Name = "GlobalDeclarations"
Option Explicit
''*************************************************************************
''
'' Coded by Dale Pitman
''



Public Declare Function CopyTo Lib "D:\from c\coding\MyProjects\testdll\Release\testdll.dll" (InBuffer() As Byte, ByVal Size As Long, OutBuffer() As Byte, ByRef WriteMax As Long, ByVal DataStart As Long) As Long
Public Declare Function GetCRC2 Lib "D:\from c\coding\MyProjects\testdll\Release\testdll.dll" (Buffer() As Byte, ByVal Size As Long, Buffer2() As Byte, ByVal BufferSize As Long) As Long
Public Declare Function CopyArray Lib "D:\from c\coding\MyProjects\testdll\Release\testdll.dll" (InBuffer() As Byte, ByVal Size As Long, OutBuffer() As Byte, ByVal DestStart As Long) As Long
Public Declare Function Base64 Lib "D:\from c\coding\MyProjects\testdll\Release\testdll.dll" (InBuffer() As Byte, OutBuffer() As Byte, ByVal pInPtr As Long, ByVal pOutPtr As Long) As Long
Public Declare Function ReadLine Lib "D:\from c\coding\MyProjects\testdll\Release\testdll.dll" (pBinaryBuffer() As Byte, ByVal pBufferSize As Long, ByRef pLineCursor As Long, ByRef pString As String) As Long


''
Public Const cVersionNumber As String = " (05/10/2006)"
Public Const cProjectName As String = "NewsReader"
Public Const cRegistoryName As String = "NewReader"
Public Const cProjectNameConst As String = "NewsReader" ' Used for licence validation
Public Const cDatabaseName As String = "NewsReader.MDB"


'' File paths
'Public m_TempDownloadPath As String
Public m_BytesFor2Second As Double
Public m_BytesTotal As Double
Public m_WSTime As Long
Public m_TotalTime As Long
Public m_BufferProcessing As Long


'Public vCrystalReport As CrystalReport

''
'' Other Format Strings

Public Const cLongFieldSize As String = "########"

'' Used by lots of forms (all that have the following as children
Public Enum ChildTypesENUM
    CustomerSearch = 1
End Enum

Public Type GroupTYPE
    Name As String
    HighArticle As Long
    LowArticle As Long
    Postability As String
End Type

Public m_Groups() As GroupTYPE
Public m_MaxGroup As Long

Public Const cCurrencySymbol As String = "£"     ' must be 1 char
Public Const cCurrencyFormat As String = cCurrencySymbol & "#####0.00"

Public Declare Function GetTickCount Lib "kernel32" () As Long

''
Public Function ShowForm(pform As Form) As Boolean
    Call pform.Show
    Call pform.ZOrder
End Function

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'' Registory stuff

Private Function SetFormPicture(pFormname As Form)
End Function

''
Public Sub AllFormsLoad(pform As Form)

End Sub

''
Public Sub AllFormsUnLoad(pform As Form)

End Sub

''
Public Sub AllFormsHide(pform As Form)

End Sub

''
Public Sub AllFormsShow(pform As Form)

End Sub


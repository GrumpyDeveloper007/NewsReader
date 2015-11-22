Attribute VB_Name = "GlobalDBAccess"
Option Explicit
''*************************************************************************
''
'' Coded by Dale Pitman
''


'Public Function GetGroupName(pUID As Long) As String
'    Dim rsGroup As Recordset
'    GetGroupName = ""
'    If OpenRecordset(rsGroup, "SELECT * FROM [Group] WHERE UID=" & pUID, dbOpenSnapshot) Then
'        If rsGroup.EOF = False Then
'            GetGroupName = rsGroup!GroupName
'        End If
'    End If
'End Function
'
Public Function GetGroupID(pName As String) As Long
    Dim rsGroup As Recordset
    GetGroupID = -1
    If OpenRecordset(rsGroup, "SELECT * FROM [Group] WHERE GroupName='" & pName & "'", dbOpenSnapshot) Then
        If rsGroup.EOF = False Then
            GetGroupID = rsGroup!UID
        End If
    End If
End Function

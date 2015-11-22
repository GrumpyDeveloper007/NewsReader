Attribute VB_Name = "ArticleProcessing"
Option Explicit
''*************************************************************************
''
'' Coded by Dale Pitman
''

'' Scan through the file table looking for matches to the autohide table, set hide status if match
Public Sub ProcessAutoHide(pGroupType As Long)
    Dim rstemp As Recordset
    Dim rsAutoHide As Recordset
    Dim i As Long
    Dim FileName As String
    Dim clsArticleProcessor As New cArticleProcessing
    Dim Hidden As Boolean

    
    MDIMain.LBLAction = "Processing Autohides"
    If (OpenRecordset(rsAutoHide, "SELECT * FROM [AutoHide]", dbOpenSnapshot)) Then
    
    End If
    
    'If (rsAutoHide.EOF = False) Then
        i = 0
        If (OpenRecordset(rstemp, "SELECT * FROM [File] WHERE Hide=False AND GroupTypeID=" & pGroupType, dbOpenDynaset)) Then
            Do While (rstemp.EOF = False)
                Hidden = False
                If i Mod 50 = 0 Then
                    MDIMain.LBLAction = "Processing Autohides - " & i
                End If
                i = i + 1
                If rstemp!FileName <> "" Then
                    FileName = clsArticleProcessor.GetFileNameWithNoExtenstion(rstemp!FileName)
                    
                    If InStr(1, rstemp!FileName, ".EXE", vbTextCompare) > 0 Or InStr(1, rstemp!FileName, "german", vbTextCompare) > 0 Or InStr(1, rstemp!Name, "german", vbTextCompare) > 0 Or InStr(1, rstemp!FileName, "nordic", vbTextCompare) > 0 Or InStr(1, rstemp!Name, "nordic", vbTextCompare) > 0 Or InStr(1, rstemp!Name, "vip pw", vbTextCompare) > 0 Or InStr(1, rstemp!FileName, "vip pw", vbTextCompare) > 0 Then
                        rstemp!Hide = True
                        rstemp.Update
                        Hidden = True
                    End If
                    
                    
                    If MDIMain.CBOGroupType.Text = "Console" Then
                        If UCase(Left$(rstemp!FileName, 4)) = "SYN-" Or UCase(Left$(rstemp!FileName, 4)) = "VOR-" Or UCase(Left$(rstemp!FileName, 4)) = "GMB-" Or UCase(Left$(rstemp!FileName, 4)) = "DMZ-" Then
                            rstemp!Hide = True
                            rstemp.Update
                            Hidden = True
                        Else
                            If UCase(Left$(rstemp!FileName, 3)) = "QF-" Or UCase(Left$(rstemp!FileName, 2)) = "P-" Then
                                rstemp!Hide = True
                                rstemp.Update
                                Hidden = True
                            Else
                                If InStr(1, rstemp!FileName, "JPN", vbTextCompare) > 0 Or InStr(1, rstemp!Name, "JPN", vbTextCompare) > 0 _
                                Or InStr(1, rstemp!FileName, "JAP", vbTextCompare) > 0 Or InStr(1, rstemp!Name, "JAP", vbTextCompare) > 0 _
                                Or InStr(1, rstemp!FileName, "USA", vbTextCompare) > 0 Or InStr(1, rstemp!Name, "USA", vbTextCompare) > 0 _
                                Or InStr(1, rstemp!FileName, "NTSC", vbTextCompare) > 0 Or InStr(1, rstemp!Name, "NTSC", vbTextCompare) > 0 Then
                                    rstemp!Hide = True
                                    rstemp.Update
                                    Hidden = True
                                Else
                                End If
                            End If
                        End If
                    End If
                    
                    
                    If Hidden = False Then
                        If (InStr(1, rstemp!Name & FileName, ".xvid", vbTextCompare) > 0 And FRMOptions.FilterXVID) Or (InStr(1, rstemp!Name & FileName, ".svcd", vbTextCompare) > 0 And FRMOptions.FilterSVCD) Then
                            rstemp!Hide = True
                            rstemp.Update
                        Else
                            If (rsAutoHide.EOF = False) Then
                                Call rsAutoHide.MoveFirst
                                Do While (rsAutoHide.EOF = False)
                                    If FileName = rsAutoHide!FileName Then
                                        rstemp!Hide = True
                                        rstemp.Update
                                        Exit Do
                                    End If
                                    Call rsAutoHide.MoveNext
                                Loop
                            End If
                        End If
                    End If
                End If
            
            
                Call rstemp.MoveNext
                DoEvents
            Loop
        
        End If
    'End If
End Sub


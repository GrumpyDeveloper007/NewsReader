VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "mswinsck.ocx"
Begin VB.Form frmIMDBHolder 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   Begin MSWinsockLib.Winsock WinsockHttp 
      Left            =   0
      Top             =   0
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      RemoteHost      =   "uk.imdb.com"
      RemotePort      =   80
   End
End
Attribute VB_Name = "frmIMDBHolder"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
''*************************************************************************
'' This form is designed to look up imdb tags in description and convert them to film names
''
'' Coded by Dale Pitman - PyroDesign

Private m_IMDBFilmName As String
Private m_IMDBSummary As String
Private m_IMDBBuffer As String

Private m_rxBuffer As String

Public m_SearchForIMDB As Boolean


'' Just search for any numeric string >7 chars
Private Function GetIMDBNumber(pString As String) As String
    Dim FoundChars As Long
    Dim IMDBStart As Long
    Dim i As Long
    IMDBStart = -1
    GetIMDBNumber = ""
    For i = 1 To Len(pString)
        If (IsNumeric(Mid$(pString, i, 1)) = True) Then
            FoundChars = FoundChars + 1
        Else
            If (IMDBStart > -1 And FoundChars > 6) Then
                GetIMDBNumber = Format(Mid$(pString, IMDBStart + 1, i - IMDBStart - 1), "0000000")
                Exit For
            End If
            FoundChars = 0
        End If
        
        If (FoundChars > 4) Then
            IMDBStart = i - FoundChars
        End If
    Next
End Function

Private Sub WinsockHttp_DataArrival(ByVal bytesTotal As Long)
    Dim rcv As String
    On Error Resume Next
    WinsockHttp.GetData rcv, vbString
    On Error GoTo 0
    
    m_IMDBBuffer = m_IMDBBuffer & rcv
    m_rxBuffer = m_IMDBBuffer
    '' Look for the film name
    Dim TitlePos As Long
    Dim PlotSummaryPos As Long
    
    TitlePos = InStr(m_IMDBBuffer, "<title>")
    PlotSummaryPos = InStr(m_IMDBBuffer, "Plot Summary:")
    If (TitlePos > 0) Then
        TitlePos = TitlePos + 7
        m_IMDBFilmName = Mid$(m_IMDBBuffer, TitlePos, InStr(TitlePos, m_IMDBBuffer, "</title>") - TitlePos)
        If (PlotSummaryPos > 0) Then
            If (InStr(PlotSummaryPos, m_IMDBBuffer, vbLf) > 0) Then
                PlotSummaryPos = PlotSummaryPos + 13 + 4
                m_IMDBSummary = Mid$(m_IMDBBuffer, PlotSummaryPos, InStr(PlotSummaryPos, m_IMDBBuffer, vbLf) - PlotSummaryPos)
                WinsockHttp.Close
            End If
        End If
    End If
'<title>Koroshiya 1 (2001)</title>
'Plot Summary:
End Sub

Public Sub CMDGetIMDBTags_Click()
    Dim co As String

    Dim rstemp As Recordset
    Dim tempstring As String
    Dim i As Long
    
    Dim IMDBCacheNumber(2000) As String
    Dim IMDBCacheName(2000) As String
    Dim IMDBCacheSummary(2000) As String
    Dim IMDBCacheMax As Long
    Dim t As Long
    Dim DontCache As Boolean
    
    If m_SearchForIMDB = True Then
            
        MDIMain.LBLAction = "Searching for IMDB tags"
        
        i = 0
        If (OpenRecordset(rstemp, "SELECT * FROM  File WHERE IMDBSearchDone=false AND grouptypeid=" & FRMMain.m_GroupTypeID & " ORDER BY Name", dbOpenDynaset)) Then
            Do While (rstemp.EOF = False)
                MDIMain.LBLProgress(0) = i & "(" & rstemp.RecordCount & ")"
                i = i + 1
                tempstring = GetIMDBNumber(rstemp!Name)
                If (tempstring = "") Then
                    ' try filename
                    tempstring = GetIMDBNumber(rstemp!FileName)
                End If
                
                If (tempstring <> "") Then
                    m_IMDBFilmName = ""
                    m_IMDBBuffer = ""
                    m_IMDBSummary = ""
                    m_rxBuffer = ""
                    
                    'Search cache
                    DontCache = False
                    For t = 0 To IMDBCacheMax - 1
                        If (tempstring = IMDBCacheNumber(t)) Then
                            DontCache = True
                            m_IMDBFilmName = IMDBCacheName(t)
                            m_IMDBSummary = IMDBCacheSummary(t)
                        End If
                    Next
                    
                    
                    If (DontCache = False) Then
retry:
                        If (WinsockHttp.State <> sckClosed) Then
                            Call WinsockHttp.Close
                        End If
                        Call WinsockHttp.Connect
                        Do While (WinsockHttp.State <= sckConnecting)
                            DoEvents
                        Loop
                        If WinsockHttp.State = 8 Then
                            GoTo retry
                        End If
                        'Call WinsockHttp.SendData("GET /Title?" & tempstring & " HTTP/1.1" & vbCrLf & "Host: www.imdb.com" & vbCrLf & "User-Agent: Mozilla/5.0 (WinNT)" & vbCrLf & vbCrLf)
                        Call WinsockHttp.SendData("GET /title/tt" & tempstring & "/ HTTP/1.1" & vbCrLf & "Host: www.imdb.com" & vbCrLf & "User-Agent: Mozilla/5.0 (WinNT)" & vbCrLf & vbCrLf)
                        'http://www.imdb.com/title/tt0304711/
                        '
                        Do While (WinsockHttp.State <> sckClosed And WinsockHttp.State <> sckClosing And m_IMDBFilmName = "")
                            DoEvents
                        Loop
                        If (WinsockHttp.State <> sckClosed) Then
                            Call WinsockHttp.Close
                        End If
                    End If
                    
                    
                    If (m_IMDBFilmName <> "" _
                        And Left$(m_IMDBFilmName, 4) <> "503 " _
                        And Left$(m_IMDBFilmName, 4) <> "302 ") Then
                        
                        rstemp!IMDBName = Left$(m_IMDBFilmName, 50)
                        rstemp!IMDBNumber = tempstring
                        rstemp!imdbsearchdone = True
                        Call rstemp.Update
                        
                        If (DontCache = False) Then
                            IMDBCacheNumber(IMDBCacheMax) = tempstring
                            IMDBCacheName(IMDBCacheMax) = m_IMDBFilmName
                            IMDBCacheSummary(IMDBCacheMax) = m_IMDBSummary
                            IMDBCacheMax = IMDBCacheMax + 1
                        End If
                    Else
                        ' If it is not found
                        If (Left$(m_IMDBFilmName, 4) <> "302 ") Then
                            rstemp!imdbsearchdone = True
                            Call rstemp.Update
                        End If
    
                    End If
                
                End If
                Call rstemp.MoveNext
                
            Loop
        End If
        MDIMain.LBLProgress(0) = "Done"
        MDIMain.LBLAction = "Done searching for IMDB tags"
        m_rxBuffer = ""
    End If
    '"User-Agent: Sam Spade 1.14"'
End Sub



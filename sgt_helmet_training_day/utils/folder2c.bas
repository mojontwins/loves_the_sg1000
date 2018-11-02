Function makeLiteral (fileName As String) As String
	Dim As Integer i
	Dim As String res
	For i = 1 To Len (fileName)
		If Mid (fileName, i, 1) = "." Then res = res & "_" Else res = res & Mid (fileName, i, 1)
	Next i
	makeLiteral = res
End Function

If Command(2) = "" Then
	Print "My Own Folder2c (as DevKitSMS's doesn't work in my system)"
	Print "No bank support for now. Quick'n'dirty walkaround. I need this fast"
	Print
	Print "$ folder2c folder file"
	Print
	End
End If

Dim As String fileName
Dim As Integer fIn, fOut1, fOut2
Dim As Integer i, ctr
Dim As uByte d

fOut1 = FreeFile: Open Command (2) & ".c" For Output As #fOut1
fOut2 = FreeFile: Open Command (2) & ".h" For Output As #fOut2

fileName = Dir (Command (1) & "\*", &H21)
Do While Len (fileName)
	fIn = FreeFile: Open Command (1) & "\" & fileName For Binary As #fIn
	Print #fOut2, "extern const unsigned char	" & makeLiteral (fileName) & " [];"
	Print #fOut2, "#define						" & Ucase (makeLiteral (fileName)) & "_SIZE 0x" & Hex (Lof (fIn), 4)
	Print #fOut2, ""
	Print #fOut1, "const unsigned char " & makeLiteral (fileName) & " [] = {"
	ctr = 0
	While Not Eof (fIn) 
		Get #fIn, , d
		If ctr = 0 Then Print #fOut1, "	";
		Print #fOut1, "0x" & Lcase (Hex (d, 2));
		If Not Eof (fIn) Then Print #fOut1, ", ";
		ctr = ctr + 1: If ctr = 16 Then Print #fOut1, "": ctr = 0
	Wend
	If ctr > 0 Then Print #fOut1, ""
	Print #fOut1, "};"
	Print #fOut1, ""
	Close #fIn
	fileName = Dir ()
Loop

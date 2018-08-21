#include <IE.au3>
#include <Restart.au3>
#include <String.au3>
#include <Array.au3>
HotKeySet('{F1}', '_CollectCodes')


Global $i = 0
Dim $Code[6]

$nickname = InputBox(@ScriptName, 'LoL Nickname:', "", "", 230, 140)


If @error = 1 Then
	ConsoleWrite('Input box EX')
	Exit
ElseIf $nickname = '' Then
	MsgBox(0, @ScriptName, "Enter your name!")
	_ScriptRestart()
EndIf

_CollectCodes()

While 1
	Sleep(100)
WEnd

Func _CollectCodes()

	If $i = 0 Then
		$Callux = _IECreate('https://woobox.com/ky2yde')
		$IE_NAME = $Callux
	ElseIf $i = 1 Then

		$Heider = _IECreate('https://woobox.com/eqwk74')
		$IE_NAME = $Heider
	ElseIf $i = 2 Then

		$xFaRgAnx = _IECreate('https://woobox.com/3dg3mc')
		$IE_NAME = $xFaRgAnx
	ElseIf $i = 3 Then

		$Willyrex = _IECreate('https://woobox.com/az7x3k')
		$IE_NAME = $Willyrex
	ElseIf $i = 4 Then

		$Mates = _IECreate('https://woobox.com/v5soys')
		$IE_NAME = $Mates
	ElseIf $i = 5 Then

		$Ladd = _IECreate('https://woobox.com/jbrkbq')
		$IE_NAME = $Ladd
	ElseIf $i = 6 Then

		$Arazhul = _IECreate('https://woobox.com/dcuss8')
		$IE_NAME = $Arazhul
	EndIf

	$oDoc = _IEDocGetObj($IE_NAME)
	$oArray = $oDoc.getElementsByTagName("textarea")

	For $element In $oArray
		If $element.name = "custom_2" And $element.id = "custom_2_id" Then
			$element.Value = $nickname
		EndIf
	Next

	$btn = _IEGetObjByName($IE_NAME, 'actionbutton')
	_IEAction($btn, "click")
	_IELoadWait($IE_NAME)
	$CodeSite = _IEBodyReadHTML($IE_NAME)

	If $i = 0 Then
		$Code = _StringBetween($CodeSite, '<div class="component component-voucher just-code">', '</div>')
		$Code = $Code[0]
	ElseIf $i = 1 Then
		$Code = _StringBetween($CodeSite, '<div class="component component-voucher just-code">', '</div>')
		$Code = $Code[0]
	ElseIf $i = 2 Then
		$Code = _StringBetween($CodeSite, '<div class="component component-voucher just-code">', '</div>')
		$Code = $Code[0]
	ElseIf $i = 3 Then
		$Code = _StringBetween($CodeSite, '<div class="component component-voucher just-code">', '</div>')
		$Code = $Code[0]
	ElseIf $i = 4 Then
		$Code = _StringBetween($CodeSite, '<div class="component component-voucher just-code">', '</div>')
		$Code = $Code[0]
	ElseIf $i = 5 Then
		$Code = _StringBetween($CodeSite, '<div class="component component-voucher just-code">', '</div>')
		$Code = $Code[0]
	ElseIf $i = 6 Then
		$Code = _StringBetween($CodeSite, '<div class="component component-voucher just-code">', '</div>')
		$Code = $Code[0]
	EndIf

	ConsoleWrite($Code)
	ClipPut($Code)
	MsgBox(0, @ScriptName, 'CODE copied to clipboard' & @CRLF & 'Paste to the League of Legends client' & @CRLF & 'PRESS F1 FOR NEXT' & ' ' & $i + 1 & '/7')

	$i += 1
	_IEQuit($IE_NAME)
	If $i = 7 Then Exit
;~ 	_ArrayDisplay($Code, @ScriptName)
EndFunc   ;==>_CollectCodes








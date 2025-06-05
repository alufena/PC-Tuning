/*
CREATED By 		Varacolaci
VERSION 			0.1.1.0
BUILD			0649.02072016
*/

#Persistent
OnExit, END

;#####################################################################################
; OPTIMIZATIONS
;#####################################################################################
;http://ahkscript.org/boards/viewtopic.php?f=6&t=6413
#NoEnv
Process, Priority, , H
SetBatchLines, -1
ListLines Off
#KeyHistory 0
SendMode Input
SetTitleMatchMode 2
SetTitleMatchMode Fast
SetKeyDelay, -1, -1, Play
SetMouseDelay, -1
SetWinDelay, 0

START:

InputBox, opacity, Opacity Level, Opacity for the window (25-255)., , 250, 125
if ErrorLevel {
	MsgBox, App will terminate.
	Goto, END
}
    
else {
	if opacity < 26
		opacity = 25
	if opacity > 254
		opacity = 255
}


Loop {
	MouseGetPos,,,vindu,control
	WinGet,vindustatus,ExStyle,ahk_id %vindu%
	Transform,resultat,BitAnd,%vindustatus%,0x8
	
	If resultat <> 0
		ToolTip,^
	Else
		ToolTip,_
	Sleep,50
	
	KeyWait, LButton, D T0.02
	If not ErrorLevel
	{
		MouseGetPos,,,vindu,control
		WinSet,AlwaysOnTop,Toggle,ahk_id %vindu%
		If resultat = 0
		{
			WinActivate,ahk_id %vindu%
			WinSet,Transparent,%opacity%,ahk_id %vindu%
			WinSet,ExStyle,+0x20,ahk_id %vindu%
			ToolTip,^
			Sleep,650
			ToolTip,
			Break
		}
		Else
		{	
			WinSet, Transparent, Off,ahk_id %vindu%
			WinSet, ExStyle, -0x20,ahk_id %vindu%
			ToolTip,_
			Sleep,650 
			WinMinimize,ahk_id %vindu%
			Break
		}
	}
}

Loop {
	KeyWait, RIGHT, D T0.02 	;set your prefeared key to terminate
	If not ErrorLevel
		{   
			ExitApp
		}
	KeyWait, LEFT, D T0.02 	;set your prefeared key to reload
	If not ErrorLevel
		{   
			ToolTip,
			WinSet,AlwaysOnTop,Toggle,ahk_id %vindu%
			WinSet, Transparent, off,ahk_id %vindu%
			WinSet, ExStyle, -0x20,ahk_id %vindu%
			Goto, START
		}
	}

END:
If resultat = 0 
{
	ToolTip,
	WinSet,AlwaysOnTop,Toggle,ahk_id %vindu%
	WinSet, Transparent, off,ahk_id %vindu%
	WinSet, ExStyle, -0x20,ahk_id %vindu%
	MsgBox, Thank you...  Bye!
}
ExitApp
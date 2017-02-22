;Global hot key settings for AJ. ;ctrl=^, alt=!, shift=+

#s::
 ;Show the AHK menu (just menu)
  Menu, Tray, Show
  ;Menu, Tray, Click, 3
  Return

Numlock::
 ;To disable NumLock Key.
  SetNumLockState, Off
  TrayTip, NumLock Disabled.
  Return

Insert::
 ;To disable Insert Key toggling.
  Send, {Insert}
  TrayTip, Insert toggling Disabled.
  Return

#m::
 ;To disable "global minimize key" and make it to be "mouse click on current position" func.
  Click
  Return

#p::
 ;paint
  SetTitleMatchMode, 2
  Run, mspaint
  WinWait, 그림판
  WinActivate, 그림판
  Return

#q::
 ;notepad
  SetTitleMatchMode, 2
  Run, notepad
  WinWait, 메모장
  WinActivate, 메모장
  Return

^#L::
 ;line selection
  Send, {End}+{Home}
  ;Send, {Del}
  Return

#f::
 ;Google. and etc (window repositioning)
  SetTitleMatchMode, 2
  CoordMode, Mouse, Client
  WinMove, A, , , 0
  If WinActive("Google")
  {
    Send, {Home}
    Sleep, 200
    Click, 200, 156
    Send, ^a
  }
  Return

#a::
;temp slot#1 for repeating task.
;now: GDrive file renaming.
Send, {Up}{Up}{Up}{Up}{Up}{Up}
Sleep, 300
Send, {Enter}
Return

#z::
;temp slot#2 for repeating task.
MouseClick, Left, 95, 235
Sleep, 200
Send, {Tab}
Return

#0::
;never run this. example codes
SetTitleMatchMode, 2
WinGetActiveTitle, zTitle
WinGetPos, zX, zY, zWidth, zHeight, A
SplashTextOn, 400, 300, z, WH:`n%zWidth% %zHeight%
zY -= 100
Sleep, 1000
SplashTextOff
;double line spacing
Loop, 10
{
  Send, {F3}
  Sleep, 100
  Send, {Left}{Right}{Enter}
}
return

IME_CHECK(WinTitle)
{
    WinGet,hWnd,ID,%WinTitle%
    Return Send_ImeControl(ImmGetDefaultIMEWnd(hWnd),0x005,"")
}

Send_ImeControl(DefaultIMEWnd, wParam, lParam)
{
    DetectSave := A_DetectHiddenWindows       
    DetectHiddenWindows,ON                           
    SendMessage 0x283, wParam,lParam,,ahk_id %DefaultIMEWnd%
    if (DetectSave <> A_DetectHiddenWindows)
        DetectHiddenWindows,%DetectSave%
    return ErrorLevel
}

ImmGetDefaultIMEWnd(hWnd)
{
    return DllCall("imm32\ImmGetDefaultIMEWnd", Uint,hWnd, Uint)
}

!vk15sc1F2::                    ; I want Alt-[Eng/Han] key to be "Absolutely Hangul(Korean)" mode key. I hate toggling :(
    ret := IME_CHECK("A")
    if %ret% = 0                ; 0 means IME is in English mode now.
    {
        Send, {vk15sc138}       ; Turn IME into Hangul(Korean) mode.
    }
;MsgBox, KR
return

^vk15sc1F2::                    ; I want Ctrl-[Eng/Han] key to be "Absolutely English" mode key. I hate toggling :(
    ret := IME_CHECK("A")
    if %ret% <> 0               ; 1 means IME is in Hangul(Korean) mode now.
    {
        Send, {vk15sc138}       ; Turn IME into English mode.
     }
;MsgBox, EN
return

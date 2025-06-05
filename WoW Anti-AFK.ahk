WinGet, wowid, List, World of Warcraft
#IfWinActive, World of Warcraft

Loop
{
ControlSend,, {1}, ahk_id %wowid1%
ControlSend,, {1}, ahk_id %wowid2%
ControlSend,, {1}, ahk_id %wowid3%
sleep 50
}
return

ScrollLock::
Suspend
Pause,,1
return
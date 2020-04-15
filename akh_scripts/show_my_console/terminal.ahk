
I_Icon = .\terminal.ico
IfExist, %I_Icon%
  Menu, Tray, Icon, %I_Icon%
;return

previous_active := ""

!^t::
if WinExist("ahk_exe WindowsTerminal.exe") {
    if WinActive("ahk_exe WindowsTerminal.exe") {
        WinMinimize, ahk_exe WindowsTerminal.exe
        if (previous_active) {
            WinActivate, ahk_id %previous_active%
        }
    } else {
        previous_active := WinExist("A")
        WinActivate, ahk_exe WindowsTerminal.exe
    }
} else{
    previous_active := WinExist("A")
    run, .\terminal_shortcut
}
return

+SC029::
Send ²
return

^SC029::
MsgBox, exiting!
ExitApp

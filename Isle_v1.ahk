toggleRunW := false
toggleWalkW := false
toggleE := false
toggleELoop := false
guiVisible := false
loopState := false
loopStep := 0

; === Config ===
eTickMs := 100          ; timer tick for E loop
eHoldMs := 1000         ; how long to hold E (ms)
eOffMs  := 3000         ; how long to release E (ms)

; === GUI Creation ===
Gui, Add, Text,, 🎮 Auto Macro Controls
Gui, Add, Checkbox, vRunWChecked gToggleRunW, Run (W + Shift)
Gui, Add, Checkbox, vWalkWChecked gToggleWalkW, Walk (W only)
Gui, Add, Checkbox, vEChecked gToggleE, Hold E
Gui, Add, Checkbox, vELoopChecked gToggleELoop, Loop E (hold / release)
Gui, Add, Button, gStopAll, ❌ Stop All + Exit

; Toggle GUI with Numpad 0
Numpad0::
    guiVisible := !guiVisible
    if (guiVisible)
        Gui, Show,, Auto Key Macro
    else
        Gui, Hide
return

; === Hotkeys ===
; Numpad 1  -> auto run (W + Shift)
Numpad1::
    toggleRunW := !toggleRunW
    if (toggleRunW) {
        ; turn off walk if it was on
        toggleWalkW := false
        GuiControl,, WalkWChecked, 0
    }
    GuiControl,, RunWChecked, %toggleRunW%
    gosub, ToggleRunW
return

; Numpad 3  -> auto walk (W only)
Numpad3::
    toggleWalkW := !toggleWalkW
    if (toggleWalkW) {
        ; turn off run if it was on
        toggleRunW := false
        GuiControl,, RunWChecked, 0
    }
    GuiControl,, WalkWChecked, %toggleWalkW%
    gosub, ToggleWalkW
return

; Numpad 2  -> hold E
Numpad2::
    toggleE := !toggleE
    GuiControl,, EChecked, %toggleE%
    gosub, ToggleE
return

; Numpad 4  -> loop E (hold / release)
Numpad4::
    toggleELoop := !toggleELoop
    GuiControl,, ELoopChecked, %toggleELoop%
    gosub, ToggleELoop
return

; Numpad 9 or GUI button -> stop everything and exit
Numpad9::
StopAll:
    SetTimer, HoldRunW, Off
    SetTimer, HoldWalkW, Off
    SetTimer, HoldE, Off
    SetTimer, LoopHoldE, Off
    loopStep := 0
    Send, {w up}
    Send, {Shift up}
    Send, {e up}
    ExitApp
return

; === Handlers ===
ToggleRunW:
    Gui, Submit, NoHide
    toggleRunW := RunWChecked
    if (toggleRunW) {
        SetTimer, HoldRunW, 10
        ; make sure walk is off
        toggleWalkW := false
        GuiControl,, WalkWChecked, 0
        SetTimer, HoldWalkW, Off
    } else {
        SetTimer, HoldRunW, Off
        Send, {w up}
        Send, {Shift up}
    }
return
ToggleWalkW:
    Gui, Submit, NoHide
    toggleWalkW := WalkWChecked
    if (toggleWalkW) {
        SetTimer, HoldWalkW, 10
        ; make sure run is off
        toggleRunW := false
        GuiControl,, RunWChecked, 0
        SetTimer, HoldRunW, Off
        Send, {Shift up}
    } else {
        SetTimer, HoldWalkW, Off
        Send, {w up}
    }
return

ToggleE:
    Gui, Submit, NoHide
    toggleE := EChecked
    if (toggleE) {
        SetTimer, HoldE, 10
    } else {
        SetTimer, HoldE, Off
        Send, {e up}
    }
return

ToggleELoop:
    Gui, Submit, NoHide
    toggleELoop := ELoopChecked
    if (toggleELoop) {
        loopStep := 0
        SetTimer, LoopHoldE, %eTickMs%
    } else {
        SetTimer, LoopHoldE, Off
        Send, {e up}
    }
return

; === Timer Routines ===
HoldRunW:
    Send, {w down}
    Send, {Shift down}
return

HoldWalkW:
    Send, {w down}
return

HoldE:
    Send, {e down}
return

LoopHoldE:
    loopStep += eTickMs
    if (loopStep <= eHoldMs) {
        Send, {e down}
    } else if (loopStep <= eHoldMs + eOffMs) {
        Send, {e up}
    } else {
        loopStep := 0
    }
return

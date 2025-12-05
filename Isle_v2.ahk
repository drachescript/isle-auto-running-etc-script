; === Config ===
gameTitle := "TheIsle"   ; Window title of the game (adjust if yours is different)

toggleRunW := false
toggleWalkW := false
toggleE := false
toggleELoop := false
guiVisible := false
loopStep := 0

; E loop timing
eTickMs := 100          ; timer tick interval for E loop
eHoldMs := 1000         ; how long to hold E (ms)
eOffMs  := 1000         ; how long to release E (ms)

; === GUI Creation ===
Gui, Add, Text,, Auto Macro Controls
Gui, Add, Checkbox, vRunWChecked gToggleRunW, Run (W + Shift)
Gui, Add, Checkbox, vWalkWChecked gToggleWalkW, Walk (W only)
Gui, Add, Checkbox, vEChecked gToggleE, Hold E
Gui, Add, Checkbox, vELoopChecked gToggleELoop, Loop E (hold / release)
Gui, Add, Button, gStopAll, Stop All + Exit

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
    ControlSend,, {w up}, %gameTitle%
    ControlSend,, {Shift up}, %gameTitle%
    ControlSend,, {e up}, %gameTitle%
    ExitApp
return
ToggleRunW:
    Gui, Submit, NoHide
    toggleRunW := RunWChecked
    if (toggleRunW) {
        SetTimer, HoldRunW, 10
        toggleWalkW := false
        GuiControl,, WalkWChecked, 0
        SetTimer, HoldWalkW, Off
        ControlSend,, {w up}, %gameTitle%
    } else {
        SetTimer, HoldRunW, Off
        ControlSend,, {w up}, %gameTitle%
        ControlSend,, {Shift up}, %gameTitle%
    }
return

ToggleWalkW:
    Gui, Submit, NoHide
    toggleWalkW := WalkWChecked
    if (toggleWalkW) {
        SetTimer, HoldWalkW, 10
        toggleRunW := false
        GuiControl,, RunWChecked, 0
        SetTimer, HoldRunW, Off
        ControlSend,, {Shift up}, %gameTitle%
    } else {
        SetTimer, HoldWalkW, Off
        ControlSend,, {w up}, %gameTitle%
    }
return

ToggleE:
    Gui, Submit, NoHide
    toggleE := EChecked
    if (toggleE) {
        SetTimer, HoldE, 10
    } else {
        SetTimer, HoldE, Off
        ControlSend,, {e up}, %gameTitle%
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
        ControlSend,, {e up}, %gameTitle%
    }
return
; === Timer Routines (send directly to The Isle window) ===

HoldRunW:
    ControlSend,, {w down}, %gameTitle%
    ControlSend,, {Shift down}, %gameTitle%
return

HoldWalkW:
    ControlSend,, {w down}, %gameTitle%
return

HoldE:
    ControlSend,, {e down}, %gameTitle%
return

LoopHoldE:
    loopStep += eTickMs
    if (loopStep <= eHoldMs) {
        ControlSend,, {e down}, %gameTitle%
    } else if (loopStep <= eHoldMs + eOffMs) {
        ControlSend,, {e up}, %gameTitle%
    } else {
        loopStep := 0
    }
return

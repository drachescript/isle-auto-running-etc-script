# Auto Walk / Run Script for The Isle (AutoHotkey)

These AutoHotkey scripts automate basic movement and interaction keys for The Isle.  
You can toggle auto-running, auto-walking, and simple E-loops using numpad keys.

There are two variants:

- `Isle_v1.ahk` – works while The Isle is the active window (classic version)
- `Isle_v2.ahk` – sends keys directly to the game window so it can keep running in the background

---

## Requirements

- Windows
- AutoHotkey v1.x

Download AutoHotkey from the official site:  
`https://www.autohotkey.com/`

Grab the current stable release (v1.x) and install it with the default options.

---

## Files / Versions

**Isle_v1.ahk**

- Uses normal `Send` commands.
- The Isle must stay focused for the keys to apply.
- Good if you always play on one monitor and do not need background automation.

**Isle_v2.ahk**

- Uses `ControlSend` to target the game window directly.
- Default window title is configured as:

  ```ahk
  gameTitle := "TheIsle"

# Auto Walk / Run Script for The Isle (AutoHotkey)

This script uses AutoHotkey to automate basic movement keys (run, walk, and interaction) for The Isle.  
It lets you toggle auto-running, auto-walking, and simple E-loops using numpad keys.

---

## Requirements

- Windows
- AutoHotkey (v1.x)

You can download AutoHotkey from the official site: `https://www.autohotkey.com/`  
Grab the current stable version (not v2 if you are unsure) and install it with the default options.

---

## Installation

1. Install AutoHotkey from the official website.
2. Download this repository as a ZIP or clone it.
3. Place the script file (for example `Isle.ahk`) somewhere easy to reach, such as your Desktop or a dedicated “Scripts” folder.
4. Make sure your keyboard has a numpad or you rebind the hotkeys inside the script if needed.

---

## How to Run the Script

1. Make sure AutoHotkey is installed.
2. Double-click `Isle.ahk`.
3. You should see an “H” AutoHotkey icon appear in your system tray.
4. Start The Isle and load into the game.
5. Use the hotkeys below while the game window is focused.

To stop the script, either press the “Stop All + Exit” button in the script GUI or right-click the AutoHotkey tray icon and choose “Exit”.

---

## Default Hotkeys

These are the default bindings in the script:

- `Numpad0` – Show / hide the small control window
- `Numpad1` – Toggle auto run (holds `W` + `Shift`)
- `Numpad3` – Toggle auto walk (holds `W` only)
- `Numpad2` – Toggle holding `E`
- `Numpad4` – Toggle looping `E` (holds E for a bit, then releases it, on repeat)
- `Numpad9` – Stop everything and exit the script

Only one movement mode (run or walk) can be active at a time. Turning one on will automatically turn the other off.

---

## Customising the Script

If you want to change hotkeys or timings:

1. Right-click `Isle.ahk` and choose “Edit Script”.
2. Adjust the hotkey labels (for example, change `Numpad1::` to `1::` if you prefer the normal 1 key).
3. At the top of the file you will also find timing values for how long `E` is held and released in the loop.  
4. Save the file and restart the script (close it from the tray icon, then dou

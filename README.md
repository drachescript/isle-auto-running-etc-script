
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

  gameTitle := "TheIsle"

* This lets your dinosaur keep moving even if:

  * The game is not focused, or
  * You are typing in Discord or using other applications.

If your game window title is different, edit the line above in `Isle_v2.ahk` and set it to match.

---

## Installation

1. Install AutoHotkey from the official website.
2. Download or clone this repository.
3. Place `Isle_v1.ahk` and/or `Isle_v2.ahk` somewhere easy to reach (Desktop or a “Scripts” folder).
4. Make sure your keyboard has a numpad or adjust the hotkeys in the script if needed.

---

## How to Run

1. Double-click the `.ahk` file you want to use (`Isle_v1.ahk` or `Isle_v2.ahk`).
2. An AutoHotkey “H” icon should appear in your system tray.
3. Start The Isle and load into the game.
4. Use the hotkeys below while playing.

To stop the script, either:

* Press the “Stop All + Exit” button in the GUI, or
* Right-click the AutoHotkey tray icon and choose “Exit”.

---

## Default Hotkeys

These hotkeys are the same for both v1 and v2:

* `Numpad0` – Show / hide the small control window
* `Numpad1` – Toggle auto run (holds `W` + `Shift`)
* `Numpad3` – Toggle auto walk (holds `W` only)
* `Numpad2` – Toggle holding `E` general eating (and gastro for herbis)
* `Numpad4` – Toggle looping `E` (holds E for a while, then releases, on repeat) for gastro eating for carnies etc
* `Numpad9` – Stop everything and exit the script

Only one movement mode (run or walk) can be active at a time. Turning one on will automatically turn the other off.

---

## Customising Hotkeys and Timings

1. Right-click the `.ahk` file and choose “Edit Script”.
2. Change the hotkey labels (for example, from `Numpad1::` to `1::` if you want the normal 1 key).
3. At the top of the file you will find timing values controlling how long `E` is held and released in the loop.
4. Save the file and restart the script (exit from the tray icon, then double-click again).

For `Isle_v2.ahk`, you can also change the `gameTitle` variable if your window name is not `TheIsle`.

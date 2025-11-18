# Remapping keys with udev

To get scancodes and keycodes, run evtest as root, pick your device and press a button. You'll get output similar to the following.

When pressing Caps Lock:
```
-------------- SYN_REPORT ------------
type 4 (EV_MSC), code 4 (MSC_SCAN), value 70039
type 1 (EV_KEY), code 58 (KEY_CAPSLOCK), value 0
-------------- SYN_REPORT ------------
```
When pressing Left Ctrl:
```
-------------- SYN_REPORT ------------
type 4 (EV_MSC), code 4 (MSC_SCAN), value 700e0
type 1 (EV_KEY), code 29 (KEY_LEFTCTRL), value 0
-------------- SYN_REPORT ------------
```
The scancode is the number after `value`, and `KEY_*` is the keycode prefixed with `KEY_`. With the above examples, swapping Caps Lock and Left Ctrl can be done by putting the following in `/etc/udev/hwdb.d/*.hwdb`:
```
evdev:input:*
  KEYBOARD_KEY_70039=leftctrl
  KEYBOARD_KEY_700e0=capslock
```

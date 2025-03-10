{ pkgs, ... }:
{
  console.keyMap = pkgs.writeText "custom.map" ''
    include "${pkgs.kbd}/share/keymaps/i386/qwerty/us.map.gz"

    # Swap Ctrl with Caps Lock
    keycode 29 = Caps_Lock
    keycode 58 = Control
  '';

  services.libinput.mouse = {
    # Disable acceleration
    accelProfile = "flat";
    # Don't interpret both buttons being pressed as middle click
    middleEmulation = false;
    # Disable delay when clicking (I think)
    tappingDragLock = false;
  };
}

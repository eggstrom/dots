{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;

    videoDrivers = [ "nvidia" ];
    excludePackages = with pkgs; [ xterm ];
  };

  services.libinput.mouse = {
    # Disable acceleration
    accelProfile = "flat";
    # Don't interpret both buttons being pressed as middle click
    middleEmulation = false;
    # Disable delay when clicking (I think)
    tappingDragLock = false;
  };
}

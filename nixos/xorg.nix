{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;

    videoDrivers = [ "nvidia" ];
    excludePackages = with pkgs; [ xterm ];
  };

  services.libinput.mouse = {
    accelProfile = "flat"; # Disable mouse acceleration
    tappingDragLock = false; # Disable delay when clicking (I think)
  };
}

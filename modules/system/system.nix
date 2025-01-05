{ settings, ... }:
{
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  time.timeZone = "${settings.timeZone}";
  networking = {
    hostName = "${settings.hostname}";
    networkmanager.enable = true;
  };

  users.users.${settings.username} = {
    isNormalUser = true;
    extraGroups = [
      "docker"
      "libvirtd"
      "networkmanager"
      "wheel"
    ];
  };

  catppuccin.tty.enable = true;
}

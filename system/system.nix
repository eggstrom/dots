{
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "eggos";
    networkmanager.enable = true;
  };
  time.timeZone = "Europe/Ljubljana";

  users.users.eggstrom = {
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

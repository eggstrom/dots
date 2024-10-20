{ settings, ... }: {
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "${settings.hostname}";
    networkmanager.enable = true;
  };

  i18n.defaultLocale = "${settings.locale}";
  time.timeZone = "${settings.timeZone}";
  console.keyMap = "${settings.keyboard.console}";
  services.xserver.xkb.layout = "${settings.keyboard.x11}";

  users.users.${settings.username} = {
    isNormalUser = true;
    extraGroups = [
      "docker"
      "libvirtd"
      "networkmanager"
      "wheel"
    ];
  };

  console.catppuccin.enable = true;
}

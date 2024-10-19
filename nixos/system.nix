{ settings, ... }: {
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "${settings.hostname}";
  networking.networkmanager.enable = true;

  i18n.defaultLocale = "${settings.locale}";
  time.timeZone = "${settings.timeZone}";

  console.keyMap = "${settings.consoleKeyboard}";
  services.xserver.xkb = {
    layout = "${settings.x11Keyboard.layout}";
    variant = "${settings.x11Keyboard.variant}";
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

  console.catppuccin.enable = true;
}

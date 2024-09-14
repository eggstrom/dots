{ settings, ... }: {
  i18n.defaultLocale = "${settings.locale}";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "${settings.locale}";
    LC_IDENTIFICATION = "${settings.locale}";
    LC_MEASUREMENT = "${settings.locale}";
    LC_MONETARY = "${settings.locale}";
    LC_NAME = "${settings.locale}";
    LC_NUMERIC = "${settings.locale}";
    LC_PAPER = "${settings.locale}";
    LC_TELEPHONE = "${settings.locale}";
    LC_TIME = "${settings.locale}";
  };

  time.timeZone = "${settings.timeZone}";

  console.keyMap = "${settings.consoleKeyboard}";
  services.xserver.xkb = {
    layout = "${settings.x11Keyboard.layout}";
    variant = "${settings.x11Keyboard.variant}";
  };
}

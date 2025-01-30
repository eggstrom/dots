{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf (!config.userConfig.minimal) {
  home.packages = with pkgs; [
    acpi
    brightnessctl
    eww
    luajit
    pamixer
    pulseaudio
    pulsemixer
    xdotool
  ];

  xdg.configFile.eww = {
    source = ./home/.config/eww;
    recursive = true;
  };
}

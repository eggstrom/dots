{ pkgs, ... }:
{
  home.packages = with pkgs; [
    acpi
    brightnessctl
    eww
    luajit
    mpc
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

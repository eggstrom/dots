{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    acpi
    brightnessctl
    eww
    luajit
    mpc-cli
    pamixer
    pulsemixer
    xdotool
  ];

  services = {
    mpd = {
      enable = true;
      musicDirectory = "${config.xdg.userDirs.music}/playlist";
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "pipewire"
        }
      '';
    };
  };

  xdg.configFile.eww = {
    source = ../dotfiles/.config/eww;
    recursive = true;
  };
}

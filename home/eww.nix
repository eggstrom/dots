{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    eww
    luajit
    pamixer
    pulsemixer
    mpc-cli
    brightnessctl
    acpi
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

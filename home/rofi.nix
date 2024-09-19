{ pkgs, ... }:
{
  home.packages = with pkgs; [ rofi ];

  xdg.configFile.rofi = {
    source = ../dotfiles/.config/rofi;
    recursive = true;
  };
}

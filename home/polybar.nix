{ pkgs, ... }:
{
  home.packages = with pkgs; [ polybarFull ];

  xdg.configFile.polybar = {
    source = ../dotfiles/.config/polybar;
    recursive = true;
  };
}

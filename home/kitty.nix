{ pkgs, ... }:
{
  home.packages = with pkgs; [ kitty ];

  xdg.configFile.kitty = {
    source = ../dotfiles/.config/kitty;
    recursive = true;
  };
}

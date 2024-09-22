{ pkgs, ... }:
{
  home.packages = with pkgs; [ wezterm ];

  xdg.configFile.wezterm = {
    source = ../dotfiles/.config/wezterm;
    recursive = true;
  };
}

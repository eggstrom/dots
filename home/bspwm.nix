{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bspwm
    sxhkd
  ];

  xdg.configFile = {
    bspwm = {
      source = ../dotfiles/.config/bspwm;
      recursive = true;
    };
    sxhkd = {
      source = ../dotfiles/.config/sxhkd;
      recursive = true;
    };
  };
}

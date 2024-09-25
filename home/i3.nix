{ pkgs, ... }:
{
  home.packages = with pkgs; [
    i3
    i3lock-color
    maim
    picom-pijulius
    xclip
    xdotool
  ];

  xdg.configFile = {
    i3 = {
      source = ../dotfiles/.config/i3;
      recursive = true;
    };
    picom = {
      source = ../dotfiles/.config/picom;
      recursive = true;
    };
    xinitrc.source = ../dotfiles/.config/xinitrc;
  };
}

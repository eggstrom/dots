{ pkgs, ... }:
{
  home.packages = with pkgs; [
    i3
    i3lock
    picom
    maim
    xclip
  ];

  xdg.configFile = {
    i3 = {
      source = ./home/.config/i3;
      recursive = true;
    };
    "picom.conf".source = ./home/.config/picom.conf;
    xinitrc.source = ./home/.config/xinitrc;
  };
}

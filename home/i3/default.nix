{ pkgs, ... }:
{
  home.packages = with pkgs; [
    i3
    i3lock-color
    maim
    picom
    xclip
  ];

  xdg.configFile = {
    "i3/config".source = ./home/.config/i3/config;
    "i3/lock.sh" = {
      source = ./home/.config/i3/config;
      executable = true;
    };

    "picom/picom.conf".source = ./home/.config/picom/picom.conf;
    "xinitrc".source = ./home/.config/xinitrc;
  };
}

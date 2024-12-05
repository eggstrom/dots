{ pkgs, ... }:
{
  home.packages = with pkgs; [ rofi ];

  xdg.configFile.rofi = {
    source = ./home/.config/rofi;
    recursive = true;
  };
}

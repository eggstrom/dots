{ pkgs, ... }:
{
  home.packages = with pkgs; [ polybarFull ];

  xdg.configFile.polybar = {
    source = ./home/.config/polybar;
    recursive = true;
  };
}

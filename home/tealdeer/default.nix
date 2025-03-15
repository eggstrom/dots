{ pkgs, ... }:
{
  home.packages = with pkgs; [ tealdeer ];
  xdg.configFile.tealdeer = {
    source = ./home/.config/tealdeer;
    recursive = true;
  };
}

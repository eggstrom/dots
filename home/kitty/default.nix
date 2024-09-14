{ pkgs, ... }:
{
  home.packages = with pkgs; [ kitty ];

  xdg.configFile.kitty = {
    source = ./home/.config/kitty;
    recursive = true;
  };
}

{ pkgs, ... }:
{
  home.packages = with pkgs; [ wezterm ];

  xdg.configFile.wezterm = {
    source = ./home/.config/wezterm;
    recursive = true;
  };
}

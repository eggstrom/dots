{ pkgs, ... }:
{
  home.packages = with pkgs; [ wezterm ];
  xdg.configFile."wezterm/wezterm.lua".source = ./home/.config/wezterm/wezterm.lua;
}

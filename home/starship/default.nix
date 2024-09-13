{ pkgs, ... }:
{
  home.packages = with pkgs; [ starship ];
  xdg.configFile."starship.toml".source = ./home/.config/starship.toml;
}

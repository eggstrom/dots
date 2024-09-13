{ pkgs, ... }:
{
  home.packages = with pkgs; [ kitty ];
  xdg.configFile."kitty/kitty.conf".source = ./home/.config/kitty/kitty.conf;
}

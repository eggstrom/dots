{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      yazi
      xorg.xwininfo
    ];
    file.".local/bin/setbg".source = ./home/.local/bin/setbg;
  };
  xdg.configFile.yazi = {
    source = ./home/.config/yazi;
    recursive = true;
  };
}

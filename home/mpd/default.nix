{ pkgs, ... }:
{
  home.packages = with pkgs; [
    mpc
    mpd
  ];

  xdg.configFile = {
    mpd = {
      source = ./home/.config/mpd;
      recursive = true;
    };
    systemd = {
      source = ./home/.config/systemd;
      recursive = true;
    };
  };
}

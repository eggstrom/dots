{ pkgs, ... }:
{
  home.packages = with pkgs; [ polybarFull ];

  xdg.configFile = {
    "polybar/config.ini".source = ./home/.config/polybar/config.ini;
    "polybar/launch.sh" = {
      source = ./home/.config/polybar/launch.sh;
      executable = true;
    };
    "polybar/time.sh" = {
      source = ./home/.config/polybar/time.sh;
      executable = true;
    };
  };
}

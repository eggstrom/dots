{ pkgs, ... }:
{
  home.packages = with pkgs; [ rofi ];

  xdg.configFile = {
    "rofi/config.rasi".source = ./home/.config/rofi/config.rasi;

    "rofi/scripts/power.sh" = {
      source = ./home/.config/rofi/scripts/power.sh;
      executable = true;
    };
    "rofi/scripts/run-command.sh" = {
      source = ./home/.config/rofi/scripts/run-command.sh;
      executable = true;
    };
    "rofi/scripts/run.sh" = {
      source = ./home/.config/rofi/scripts/run.sh;
      executable = true;
    };

    "rofi/themes/default.rasi".source = ./home/.config/rofi/themes/default.rasi;
    "rofi/themes/power.rasi".source = ./home/.config/rofi/themes/power.rasi;
    "rofi/themes/run.rasi".source = ./home/.config/rofi/themes/run.rasi;
  };
}

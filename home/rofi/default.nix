{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf (!config.userConfig.minimal) {
  home.packages = with pkgs; [ rofi ];

  xdg.configFile.rofi = {
    source = ./home/.config/rofi;
    recursive = true;
  };
}

{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf (!config.userConfig.minimal) {
  home.packages = with pkgs; [
    kitty
    kitty-themes
  ];

  xdg.configFile.kitty = {
    source = ./home/.config/kitty;
    recursive = true;
  };
}

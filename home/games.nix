{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf (!config.userConfig.minimal) {
  home.packages = with pkgs; [
    mcpelauncher-ui-qt
    prismlauncher
    steam
    steam-run
    wineWowPackages.stable
  ];
}

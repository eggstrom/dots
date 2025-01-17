{ pkgs, ... }:
{
  home.packages = with pkgs; [
    mcpelauncher-ui-qt
    prismlauncher
    steam
    steam-run
    wineWowPackages.stable
  ];
}

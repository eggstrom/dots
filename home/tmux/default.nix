{ pkgs, ... }:
{
  home.packages = with pkgs; [
    tmux
    tmuxPlugins.catppuccin
  ];

  xdg.configFile.tmux = {
    source = ./home/.config/tmux;
    recursive = true;
  };
}

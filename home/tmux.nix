{ pkgs, ... }:
{
  home.packages = with pkgs; [
    tmux
    tmuxPlugins.catppuccin
  ];

  xdg.configFile.tmux = {
    source = ../dotfiles/.config/tmux;
    recursive = true;
  };
}

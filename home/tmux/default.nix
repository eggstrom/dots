{ pkgs, ... }:
{
  home.packages = with pkgs; [
    tmux
    tmuxPlugins.catppuccin
  ];

  xdg.configFile = {
    "tmux/binds.sh" = {
      source = ./home/.config/tmux/binds.sh;
      executable = true;
    };
    "tmux/tmux.conf".source = ./home/.config/tmux/tmux.conf;
  };
}

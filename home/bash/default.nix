{ pkgs, ... }:
{
  home.packages = with pkgs; [ bash-completion ];

  xdg.configFile = {
    inputrc.source = ./home/.config/inputrc;
    bash = {
      source = ./home/.config/bash;
      recursive = true;
    };
  };
}

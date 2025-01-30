{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      zsh
      zsh-autosuggestions
      zsh-completions
      zsh-syntax-highlighting
    ];
  };

  xdg.configFile = {
    shell = {
      source = ./home/.config/shell;
      recursive = true;
    };
    zsh = {
      source = ./home/.config/zsh;
      recursive = true;
    };
  };
}

{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      zsh
      zsh-autosuggestions
      zsh-completions
      zsh-syntax-highlighting
    ];

    file.".zshenv".source = ../dotfiles/.zshenv;
  };

  xdg.configFile = {
    shell = {
      source = ../dotfiles/.config/shell;
      recursive = true;
    };
    zsh = {
      source = ../dotfiles/.config/zsh;
      recursive = true;
    };
  };
}

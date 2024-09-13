{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      zsh
      zsh-autosuggestions
      zsh-completions
      zsh-syntax-highlighting
    ];

    file.".zshenv".source = ./home/.zshenv;
  };

  xdg.configFile = {
    "shell/aliases.sh".source = ./home/.config/shell/aliases.sh;
    "shell/env.sh".source = ./home/.config/shell/env.sh;
    "zsh/.zlogin".source = ./home/.config/zsh/.zlogin;
    "zsh/.zshrc".source = ./home/.config/zsh/.zshrc;
  };
}

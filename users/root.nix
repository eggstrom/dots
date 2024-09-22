{ inputs, ... }:
{
  home.username = "root";

  imports = [
    ../home/misc.nix
    ../home/neovim.nix
    ../home/nix.nix
    ../home/starship.nix
    ../home/tmux.nix
    ../home/yazi.nix
    ../home/zsh.nix
    inputs.catppuccin.homeManagerModules.catppuccin
  ];
}

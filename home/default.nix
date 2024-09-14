{ inputs, settings, ... }:
{
  programs.home-manager.enable = true;
  home = {
    stateVersion = "24.05";
    username = settings.username;
    homeDirectory = "/home/${settings.username}";
  };

  # Make registry use this flake's version of nixpkgs
  nix.registry.nixpkgs.flake = inputs.nixpkgs;

  imports = [
    ./i3
    ./kitty
    ./neovim
    ./polybar
    ./rofi
    ./starship
    ./tmux
    ./zsh
    ./misc.nix
  ];
}

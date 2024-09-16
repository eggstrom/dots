{ inputs, settings, ... }:
{
  programs.home-manager.enable = true;
  home = {
    stateVersion = "24.05";
    username = settings.username;
    homeDirectory = "/home/${settings.username}";
  };

  nix = {
    # Make registry use this flake's version of nixpkgs
    registry.nixpkgs.flake = inputs.nixpkgs;

    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
  };

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

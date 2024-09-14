{
  system.stateVersion = "24.05";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  # Disable stinky defaults
  programs.nano.enable = false;
  environment.shellAliases = {
    l = null;
    ll = null;
    ls = null;
  };

  imports = [
    ./audio.nix
    ./boot.nix
    ./graphics.nix
    ./locale.nix
    ./networking.nix
    ./services.nix
    ./users.nix
    ./xorg.nix
    ./zsh.nix
  ];
}

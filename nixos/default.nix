{
  system.stateVersion = "24.05";

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];

      # Optimise store on every build
      auto-optimise-store = true;
    };

    gc = {
      # Run garbage collector weekly
      automatic = true;
      # Delete generations older than 7 days
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs.config.allowUnfree = true;

  # Disable stinky defaults
  programs.nano.enable = false;
  environment.shellAliases = {
    l = null;
    ll = null;
    ls = null;
  };

  # Generate caches for searching man pages
  documentation.man.generateCaches = true;

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

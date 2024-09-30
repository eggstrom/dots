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
}

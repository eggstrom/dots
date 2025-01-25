{
  system.stateVersion = "24.05";

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
        "pipe-operators"
      ];

      # Give wheel group additional rights
      trusted-users = [ "@wheel" ];
      # Optimise store on every build
      auto-optimise-store = true;
      # .nix-{defexpr,profile} -> .local/state/nix/{defexpr,profile}
      use-xdg-base-directories = true;
    };

    gc = {
      # Run garbage collector weekly
      automatic = true;
      # Delete generations older than 7 days
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs.config.allowUnfree = true;

  # Make programs that require FHS compliance work
  services.envfs.enable = true;
  programs.nix-ld.enable = true;
}

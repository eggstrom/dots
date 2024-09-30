{
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
    ./nix.nix
    ./services.nix
    ./users.nix
    ./xorg.nix
    ./zsh.nix
  ];
}

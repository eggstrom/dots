let
  inherit (builtins)
    attrNames
    filter
    map
    readDir
    ;
in
{ pkgs, ... }:
{
  # Remove pointless defaults
  programs.nano.enable = false;
  environment.shellAliases = {
    l = null;
    ll = null;
    ls = null;
  };

  # Import everything in current directory
  # imports = map (path: ./. + "/${path}") (
  #   filter (file: file != "default.nix") (attrNames (readDir ./.))
  # );

  imports = [
    ./audio.nix
    ./boot.nix
    ./graphics.nix
    ./locale.nix
    ./networking.nix
    ./services.nix
    ./xorg.nix
    ./zsh.nix
  ];
}

let
  inherit (builtins)
    attrNames
    filter
    map
    readDir
    ;
in
{ config, ... }:
{
  programs.home-manager.enable = true;
  home = {
    stateVersion = "24.05";
    username = "eggstrom";
    homeDirectory = "/home/${config.home.username}";
  };

  imports = map (path: ./. + "/${path}") (
    filter (file: file != "default.nix") (attrNames (readDir ./.))
  );
}

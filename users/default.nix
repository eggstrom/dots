{ inputs, settings, ... }:
{
  home.username = "${settings.username}";

  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
    ../home
  ];
}

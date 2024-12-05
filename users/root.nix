{ inputs, ... }:
{
  home = {
    username = "root";
    homeDirectory = "/root";
  };

  imports = [
    ../modules/required
    inputs.catppuccin.homeManagerModules.catppuccin
  ];
}

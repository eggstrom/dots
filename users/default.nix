{
  config,
  inputs,
  settings,
  ...
}:
{
  home = {
    username = "${settings.username}";
    homeDirectory = "/home/${config.home.username}";
  };

  imports = [
    ../modules/required
    ../modules/optional
    inputs.catppuccin.homeManagerModules.catppuccin
  ];
}

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
    inputs.catppuccin.homeManagerModules.catppuccin
    ../home
  ];
}

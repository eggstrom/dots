{ settings, ... }:
{
  home.username = "${settings.username}";

  imports = [ ../home ];
}

{ settings, ... }:
{
  users.users.${settings.username} = {
    isNormalUser = true;
    extraGroups = [
      "docker"
      "networkmanager"
      "wheel"
    ];
  };
}

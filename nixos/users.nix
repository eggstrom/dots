{ settings, ... }:
{
  users.users.${settings.username} = {
    isNormalUser = true;
    extraGroups = [
      "docker"
      "libvirtd"
      "networkmanager"
      "wheel"
    ];
  };
}

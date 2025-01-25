{
  config,
  options,
  userConfigs,
  ...
}:
{
  options.systemConfig = {
    hostname = options.networking.hostName;
    timezone = options.time.timeZone;
  };

  config = {
    boot.loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    networking = {
      hostName = config.systemConfig.hostname;
      networkmanager.enable = true;
    };
    time.timeZone = config.systemConfig.timezone;

    users.users =
      userConfigs
      |> builtins.mapAttrs (
        username: _: {
          isNormalUser = true;
          extraGroups = [
            "docker"
            "libvirtd"
            "networkmanager"
            "wheel"
          ];
        }
      );

    catppuccin.tty.enable = true;
  };
}

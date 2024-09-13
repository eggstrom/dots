{
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Disable bell sound
  services.pipewire.extraConfig.pipewire = {
    "no-bell.conf"."context.properties"."module.x11.bell" = false;
  };
}

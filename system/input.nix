{
  services.libinput.mouse = {
    # Disable acceleration
    accelProfile = "flat";
    # Don't interpret both buttons being pressed as middle click
    middleEmulation = false;
    # Disable delay when clicking (I think)
    tappingDragLock = false;
  };

  services.keyd = {
    enable = true;

    keyboards.default = {
      ids = [ "*" ];
      settings = {
        global.overload_tap_timeout = 200;
        main = {
          capslock = "overload(control, esc)";
          rightalt = "layer(rightalt)";
        };
      };

      # These need to be in extraConfig because their order matters
      extraConfig = ''
        [rightalt:A]
        c = č
        s = š
        z = ž

        [rightalt+shift]
        c = Č
        s = Š
        z = Ž
      '';
    };
  };
}

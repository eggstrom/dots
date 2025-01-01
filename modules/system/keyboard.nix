{
  services.keyd = {
    enable = true;

    keyboards.default = {
      ids = [ "*" ];
      settings = {
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

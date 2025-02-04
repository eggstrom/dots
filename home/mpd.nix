{ config, ... }:
{
  services = {
    mpd = {
      enable = true;
      musicDirectory = "${config.xdg.userDirs.music}/playlist";
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "pipewire"
        }
      '';
    };
  };
}

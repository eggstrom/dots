{ config, pkgs, ... }:
{
  # Enable GnuPG for cryptography
  programs.gpg = {
    enable = true;
    # ~/.gnupg/ -> ~/.local/share/gnupg/
    homedir = "${config.xdg.dataHome}/gnupg";
  };
  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-tty;
  };

  # Enable pass for managing secrets
  programs.password-store = {
    enable = true;
    package = pkgs.pass-nodmenu;
    settings = {
      # ~/.password-store/ -> ~/.local/share/password-store/
      PASSWORD_STORE_DIR = "${config.xdg.dataHome}/password-store";
    };
  };

  # Enable libsecret with pass backend
  services.pass-secret-service.enable = true;
}

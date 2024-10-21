{
  config,
  pkgs,
  settings,
  ...
}:
{
  # Enable GnuPG for cryptography
  programs.gpg = {
    enable = true;
    homedir = "${config.xdg.dataHome}/gnupg";
  };
  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-tty;
  };

  # Enable pass for managing passwords
  programs.password-store = {
    enable = true;
    package = pkgs.pass-nodmenu;
    settings = {
      PASSWORD_STORE_DIR = "${config.xdg.dataHome}/password-store";
    };
  };

  # Enable Git
  programs.git = {
    enable = true;
    userName = "${settings.git.username}";
    userEmail = "${settings.git.email}";
    extraConfig.credential = {
      # Use main account for credentials by default
      username = "${settings.git.username}";
      helper = "${pkgs.git-credential-manager}/bin/git-credential-manager";
      # Use pass for storing credentials
      credentialStore = "gpg";
      guiPrompt = false;
    };
  };

  # Enable TUI for Git
  programs.lazygit = {
    enable = true;
    catppuccin.enable = true;
  };
}

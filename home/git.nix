{
  config,
  lib,
  options,
  pkgs,
  ...
}:
{
  options.userConfig.git = {
    username = options.programs.git.userName;
    email = options.programs.git.userEmail;
  };

  config = {
    # Enable Git
    programs.git = {
      enable = true;
      userName = config.userConfig.git.username;
      userEmail = config.userConfig.git.email;
      extraConfig.credential = {
        # Use main account for credentials by default
        username = lib.mkIf (config.userConfig.git.username != null) config.userConfig.git.username;
        helper = "${pkgs.git-credential-manager}/bin/git-credential-manager";
        # Use pass for storing credentials
        credentialStore = "gpg";
        guiPrompt = false;
      };
    };

    # Create script for conveniently setting username and email
    home.packages = with pkgs; [
      (writeShellScriptBin "git-user" ''
        set -euo pipefail

        git rev-parse
        case "$#" in
        0)
          git config --unset user.name || :
          git config --unset user.email || :
          git config --unset credential.username || :
          ;;
        2)
          git config user.name "$1"
          git config user.email "$2"
          git config credential.username "$1"
          ;;
        *)
          exit 1
          ;;
        esac
      '')
    ];

    # Enable GitHub CLI
    programs.gh.enable = true;

    # Enable TUI for Git
    programs.lazygit = {
      enable = true;
      settings.gui.border = "single";
    };
    catppuccin.lazygit.enable = true;
  };
}

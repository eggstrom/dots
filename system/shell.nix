{ lib, pkgs, ... }:
let
  configHome = ''''${XDG_CONFIG_HOME:-"$HOME/.config"}'';
  bashXdgInit =
    paths:
    paths
    |> map (
      path:
      let
        absolutePath = "${configHome}/bash/${path}";
      in
      # bash
      ''[[ -r "${absolutePath}" ]] && . "${absolutePath}"''
    )
    |> lib.strings.concatStringsSep "\n";
in
{
  # Make Zsh the default shell
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  # Required for system package completion
  environment.pathsToLink = [ "/share/zsh" ];

  programs.bash = {
    # .bash_profile -> .config/bash/bash_profile
    # .profile -> .config/bash/profile
    shellInit = bashXdgInit [
      "bash_profile"
      "profile"
    ];
    # .bashrc -> .config/bash/bashrc
    interactiveShellInit = bashXdgInit [ "bashrc" ];
  };

  # .zshenv -> .config/zsh/.zshenv
  programs.zsh.shellInit = # zsh
    ''
      export ZDOTDIR="${configHome}/zsh"
    '';
}

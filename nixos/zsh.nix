{ pkgs, ... }:
{
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Required for system package completion
  environment.pathsToLink = [ "/share/zsh" ];
}

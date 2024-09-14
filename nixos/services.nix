{
  services = {
    fstrim.enable = true;
    udisks2.enable = true;
  };

  # Make programs that require FHS work
  services.envfs.enable = true;
  programs.nix-ld.enable = true;

  # Disable GUI password prompt
  programs.ssh.enableAskPassword = false;

  # Required for fonts 'n' stuff, I think
  programs.dconf.enable = true;

  virtualisation.docker.enable = true;
}

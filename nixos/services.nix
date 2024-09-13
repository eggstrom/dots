{
  services = {
    fstrim.enable = true;
    udisks2.enable = true;
  };

  # Make programs that require FHS work
  services.envfs.enable = true;
  programs.nix-ld.enable = true;

  virtualisation.docker.enable = true;
}

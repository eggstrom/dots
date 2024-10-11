{
  # Disable stinky defaults
  programs.nano.enable = false;
  environment.shellAliases = {
    l = null;
    ll = null;
    ls = null;
  };

  services = {
    fstrim.enable = true;
    udisks2.enable = true;
  };

  # Make programs that require FHS compliance work
  services.envfs.enable = true;
  programs.nix-ld.enable = true;

  # Disable GUI password prompt
  programs.ssh.enableAskPassword = false;

  # Required for fonts 'n' stuff, I think
  programs.dconf.enable = true;

  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  # Generate caches for searching man pages
  documentation.man.generateCaches = true;
}

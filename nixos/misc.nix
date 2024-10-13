{
  # Disable stinky defaults
  programs.nano.enable = false;
  environment.shellAliases = {
    l = null;
    ll = null;
    ls = null;
  };

  # Generate caches for searching man pages
  documentation.man.generateCaches = true;

  # Make programs that require FHS compliance work
  services.envfs.enable = true;
  programs.nix-ld.enable = true;

  services = {
    fstrim.enable = true;
    # Enable daemon for device mounting
    udisks2.enable = true;
  };

  # Enable dconf for managing configurations
  programs.dconf.enable = true;

  # Enable running AppImages
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  # Enable virt-manager and Docker
  virtualisation = {
    libvirtd.enable = true;
    docker.enable = true;
  };
  programs.virt-manager.enable = true;

  # Disable GUI password prompt
  programs.ssh.enableAskPassword = false;
}

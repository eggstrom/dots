{
  programs.zathura = {
    enable = true;
  };

  xdg.mimeApps.defaultApplications = {
    "application/pdf" = [ "org.pwmt.zathura.desktop" ];
  };

  catppuccin.zathura.enable = true;
}

{pkgs, ...}: {
  home.packages = with pkgs; [
    bspwm
    sxhkb
  ];
}

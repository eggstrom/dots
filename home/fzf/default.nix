{ pkgs, ... }:
let
  scripts = pkgs.stdenv.mkDerivation {
    name = "fzf-scripts-test6";
    src = ./src;

    installPhase = ''
      mkdir -p "$out/src" "$out/bin"
      cp -r . "$out/src"

      for script in scripts/*; do
        path="$out/src/$script"
        if [[ -d "$path" ]]; then
          path+=/main.sh
        fi

        name="''${script#scripts/}"
        name="fzf-''${name%.sh}"

        ln -s "$path" "$out/bin/$name"
      done
    '';
  };
in
{
  programs.fzf = {
    enable = true;

    defaultCommand = "fd -u";
    fileWidgetCommand = "fd -u";
    changeDirWidgetCommand = "fd -utd";

    defaultOptions = [
      "--cycle"
      "--reverse"
      "--height ~50%"
      "--no-scrollbar"
      "--no-separator"
      "--preview-border bold"

      "--prompt '❯ '"
      "--pointer ▶"
      "--ellipsis ''"
      "--color 16"
    ];
    colors = {
      gutter = "-1";
      current-bg = "-1";
      current-fg = "red";
      selected-fg = "magenta";
      hl = "yellow";
      current-hl = "yellow";
      spinner = "blue";
      info = "blue";
    };
  };

  home.packages = with pkgs; [
    scripts
    fd
    mpc
  ];
}

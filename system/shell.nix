let
  xdgInit =
    file: # bash
    ''
      config="''${XDG_CONFIG_HOME:-$HOME/.config}/bash"
      [[ -r "$config/${file}" ]] && . "$config/${file}"
      unset config
    '';
in
{
  programs.bash = {
    # .bash_profile -> .config/bash/bash_profile
    loginShellInit = xdgInit "bash_profile";
    # .bashrc -> .config/bash/bashrc
    interactiveShellInit = xdgInit "bashrc";
  };
}

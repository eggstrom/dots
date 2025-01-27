{ pkgs, ... }:
{
  programs.starship.enable = true;
  xdg.configFile."starship.toml".source = pkgs.runCommandLocal "starship.toml" { } ''
    echo 'add_newline = false' > "$out"
    ${pkgs.starship}/bin/starship preset nerd-font-symbols >> "$out"
  '';
}

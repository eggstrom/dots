{ pkgs, ... }:
{
  # Create wrapper script that enables Vencord and disables smooth scrolling
  home.packages = with pkgs; [
    (writeShellScriptBin "discord" "${
      (discord.override { withVencord = true; })
    }/bin/discord --disable-smooth-scrolling")
  ];

  # Import Catppuccin theme
  xdg.configFile."Vencord/settings/quickCss.css".text = # css
    ''
      @import url("https://catppuccin.github.io/discord/dist/catppuccin-mocha.theme.css");
    '';
}

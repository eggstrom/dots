{ pkgs, ... }:
let
  # Wrapper script that enables Vencord and disables smooth scrolling
  discordWrapper = # bash
    "${(pkgs.discord.override { withVencord = true; })}/bin/discord --disable-smooth-scrolling";
in
{
  home.packages = with pkgs; [
    (writeShellScriptBin "discord" discordWrapper)
  ];

  # Import Catppuccin theme
  xdg.configFile."Vencord/settings/quickCss.css".text = # css
    ''
      @import url("https://catppuccin.github.io/discord/dist/catppuccin-mocha.theme.css");
    '';
}

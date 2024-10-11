{ pkgs, ... }:
{
  # programs.firefox = {
  #   enable = true;
  #   profiles.default = {
  #     isDefault = true;
  #
  #     bookmarks = [
  #       {
  #         name = "YouTube";
  #         url = "https://www.youtube.com";
  #       }
  #       {
  #         name = "Minecraft Wiki";
  #         url = "https://minecraft.wiki/";
  #       }
  #       {
  #         name = "Minecraft Bug Tracker";
  #         url = "https://bugs.mojang.com/projects/MC/summary";
  #       }
  #     ];
  #
  #     search = {
  #       force = true;
  #       engines = {
  #         "Bing".metaData.hidden = true;
  #         "DuckDuckGo".metaData.hidden = true;
  #         "Wikipedia (en)".metaData.hidden = true;
  #       };
  #     };
  #
  #     extensions = with pkgs.nur.repos.rycee.firefox-addons; [
  #       ublock-origin
  #       darkreader
  #     ];
  #
  #     settings = {
  #       "browser.startup.homepage" = "chrome://browser/content/blanktab.html";
  #       "extensions.autoDisableScopes" = 0; # Enable extensions without confirmation
  #       "layout.spellcheckDefault" = 0; # Disable "Check your spelling as you type"
  #     };
  #   };
  #
  #   # https://mozilla.github.io/policy-templates/
  #   policies = {
  #     DisableFirefoxAccounts = true;
  #     DisableFormHistory = true;
  #     DisablePocket = true;
  #     NoDefaultBookmarks = true;
  #   };
  # };
}

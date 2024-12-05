{
  home.sessionVariables.TERMINAL = "kitty";

  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrains Mono NF";
      size = 20;
    };

    keybindings = {
      "ctrl+shift+v" = "paste_from_clipboard";
      "ctrl+plus" = "change_font_size all +1";
      "ctrl+minus" = "change_font_size all -1";
      "ctrl+equal" = "change_font_size all 0";
    };

    settings = {
      remember_window_size = "no";
      initial_window_width = "80c";
      initial_window_height = "24c";

      enable_audio_bell = "no";
      confirm_os_window_close = 0;

      # Disable default keybindings
      clear_all_shortcuts = "yes";
      # Hide cursor when typing
      mouse_hide_wait = -1;
      # Disable ligatures below cursor
      disable_ligatures = "cursor";
      # Remove top-left padding 
      placement_strategy = "top-left";

      startup_session = "startup.conf";
    };

    catppuccin.enable = true;
  };

  xdg.configFile."kitty/startup.conf".text = "launch tmux";
}

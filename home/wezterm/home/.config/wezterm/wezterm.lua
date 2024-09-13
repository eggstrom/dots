local wezterm = require("wezterm")
local config = {}
if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.default_prog = { "tmux" }
config.window_close_confirmation = "NeverPrompt"

-- Appearance
config.color_scheme = "Catppuccin Mocha"
config.window_background_opacity = 0.95
config.window_padding = {
    left = "0",
    right = "0",
    top = "0",
    bottom = "0",
}
config.hide_tab_bar_if_only_one_tab = true

-- Font
config.font = wezterm.font("JetBrains Mono NF")
config.font_size = tonumber(os.getenv("WEZTERM_FONT_SIZE")) or 20
config.harfbuzz_features = {
    "liga=0", -- Ligatures
    "clig=0", -- Common ligatures
    "calt=0", -- Contextual alternates
}

-- Key bindings
config.disable_default_key_bindings = true
config.keys = {
    { mods = "CTRL|SHIFT", key = "c", action = wezterm.action.CopyTo("Clipboard") },
    { mods = "CTRL|SHIFT", key = "v", action = wezterm.action.PasteFrom("Clipboard") },
    { mods = "CTRL",       key = "+", action = wezterm.action.IncreaseFontSize },
    { mods = "CTRL",       key = "-", action = wezterm.action.DecreaseFontSize },
    { mods = "CTRL|SHIFT", key = "=", action = wezterm.action.ResetFontSize },
}

-- Mouse bindings
config.mouse_bindings = {
    {
        event = { Down = { streak = 1, button = { WheelUp = 1 } } },
        mods = "CTRL",
        action = wezterm.action.IncreaseFontSize,
    },
    {
        event = { Down = { streak = 1, button = { WheelDown = 1 } } },
        mods = "CTRL",
        action = wezterm.action.DecreaseFontSize,
    },
}

return config

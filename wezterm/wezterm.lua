local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Attach to or create a Zellij scratch session on start
config.default_prog = {
  "/opt/homebrew/bin/zellij",
  "--layout",
  ".config/zellij/layouts/scratch.kdl",
  "attach",
  "--create",
  "scratch",
}

-- Configure font
config.font = wezterm.font("MonoLisa Nerd Font", { weight = "Medium" })
config.freetype_load_target = "Light"
config.font_size = 12.0
config.line_height = 1.5

-- Configure colors
config.color_scheme = "Tokyo Night (Gogh)"
config.colors = {
  selection_fg = "white",
  selection_bg = "red",
}

-- Configure visuals
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_padding = { left = 30, right = 30, top = 25, bottom = 25 }
config.window_background_opacity = 0.95
config.window_close_confirmation = "NeverPrompt"

-- Configure keybinds
config.keys = {
  {
    key = "Backspace",
    mods = "CTRL",
    action = wezterm.action.QuickSelect,
  },
  {
    key = "Backspace",
    mods = "CTRL|SHIFT",
    action = wezterm.action.ActivateCopyMode,
  },
}

return config

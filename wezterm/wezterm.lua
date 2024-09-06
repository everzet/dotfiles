local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Set default shell to Fish
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
config.line_height = 1.4

-- Configure visuals
config.color_scheme = "Tokyo Night"
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_padding = { left = 30, right = 30, top = 25, bottom = 25 }
config.window_close_confirmation = "NeverPrompt"

return config

local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- 1. Appearance
config.color_scheme = 'Catppuccin Mocha' 
config.font = wezterm.font 'CaskaydiaMono Nerd Font'
config.font_size = 14.0

-- This overrides the background to be darker than standard Mocha
config.colors = {
  background = '#11111b', -- Deep, almost black (Crust/Mantle shade)
}

-- 2. Window Settings
config.initial_cols = 120
config.initial_rows = 30
config.window_decorations = "RESIZE" 
config.window_background_opacity = 0.95
config.macos_window_background_blur = 20

return config

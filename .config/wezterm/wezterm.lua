local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

local colors, _ = wezterm.color.load_scheme(wezterm.config_dir .. "/github-dark-default.toml")
config.colors = colors
config.window_background_opacity = 0.9
config.enable_tab_bar = false

config.font = wezterm.font 'FiraCode Nerd Font'
config.font_size = 11

return config

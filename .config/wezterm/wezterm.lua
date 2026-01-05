local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

local colors, _ = wezterm.color.load_scheme(wezterm.config_dir .. "/github-dark-default.toml")
local wlr_renderer = os.getenv("WLR_RENDERER")

local is_wlr_vulkan = false
if wlr_renderer ~= nil then
	is_wlr_vulkan = string.find(wlr_renderer, "vulkan") ~= nil
end

config.front_end = "WebGpu"
config.colors = colors

if is_wlr_vulkan then
	config.window_background_opacity = 0.97
else
	config.window_background_opacity = 0.9
end

config.enable_tab_bar = false

config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 11

return config

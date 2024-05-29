-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Tokyo Night"

config.font = wezterm.font("FiraCode Nerd Font")

config.hide_tab_bar_if_only_one_tab = true

config.keys = {
	{ key = "Enter", mods = "ALT|SHIFT", action = wezterm.action.SpawnWindow },

	-- paste from clipboard
	{ key = "V", mods = "ALT|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },

	-- paste from the primary selection
	{ key = "V", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("PrimarySelection") },
}

-- and finally, return the configuration to wezterm
return config

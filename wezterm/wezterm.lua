-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
--

local copy_mode = nil
if wezterm.gui then
	copy_mode = wezterm.gui.default_key_tables().copy_mode
	table.insert(copy_mode, { key = "c", mods = "NONE", action = act.CopyMode("MoveLeft") })
	table.insert(copy_mode, { key = "t", mods = "NONE", action = act.CopyMode("MoveDown") })
	table.insert(copy_mode, { key = "s", mods = "NONE", action = act.CopyMode("MoveUp") })
	table.insert(copy_mode, { key = "r", mods = "NONE", action = act.CopyMode("MoveRight") })
	table.insert(copy_mode, { key = "é", mods = "NONE", action = act.CopyMode("MoveForwardWord") })
end

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

	{ key = "b", mods = "ALT|SHIFT", action = wezterm.action.ScrollByPage(-1) },
	{ key = "p", mods = "ALT|SHIFT", action = wezterm.action.ScrollByPage(1) },

	{ key = "s", mods = "CTRL|SHIFT", action = act.ScrollToPrompt(-1) },
	{ key = "t", mods = "CTRL|SHIFT", action = act.ScrollToPrompt(1) },

	{ key = "l", mods = "ALT|SHIFT", action = act.ActivateCopyMode },

	-- display hints to open links with a keyboard key
	{
		key = "L",
		mods = "SHIFT|CTRL",
		action = wezterm.action.QuickSelectArgs({
			label = "open url",
			patterns = {
				"https?://\\S+",
			},
			action = wezterm.action_callback(function(window, pane)
				local url = window:get_selection_text_for_pane(pane)
				wezterm.log_info("opening: " .. url)
				wezterm.open_with(url)
			end),
		}),
	},
}

config.key_tables = {
	copy_mode = copy_mode,
}

-- and finally, return the configuration to wezterm
return config

local wezterm = require("wezterm")

-- Initialize the config builder
local config = wezterm.config_builder()

-- Change color scheme
config.color_scheme = "Kanagawa (Gogh)"

-- Configure fonts
config.font = wezterm.font_with_fallback({
	{ family = "JetBrains Mono", weight = "Regular" },
	{ family = "JetBrains Mono", weight = "Bold" },
	{ family = "JetBrains Mono", italic = true },
	{ family = "JetBrains Mono", weight = "Bold", italic = true },
})

-- Set font size
config.font_size = 12.0

-- Add padding
config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}

-- Disable the wezterm top bar
config.enable_tab_bar = false

-- Set the cursor to be non-blinking
config.default_cursor_style = "SteadyBlock"

-- Disable annoying bell sound
config.audible_bell = "Disabled"

-- Variable to track maximized state
local is_maximized = false

-- Custom keyboard shortcuts
config.keys = {
	{
		key = "F11",
		mods = "",
		action = wezterm.action_callback(function(window, pane)
			if is_maximized then
				window:restore()
				is_maximized = false
			else
				window:maximize()
				is_maximized = true
			end
		end),
	},
	{
		key = "F11",
		mods = "CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
}

-- Finally return the config
return config

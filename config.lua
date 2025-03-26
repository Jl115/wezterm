local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config = {
	default_cursor_style = "BlinkingBar", -- Changed to blinking cursor
	automatically_reload_config = true,
	window_close_confirmation = "NeverPrompt",
	adjust_window_size_when_changing_font_size = false,
	window_decorations = "RESIZE",
	check_for_updates = false,
	use_fancy_tab_bar = false, -- Re-enabled for better visuals 
	tab_bar_at_bottom = false,
	font_size = 12.5,
	max_fps = 144, -- Increased back to 120 for smoother writing experience
	-- Fixed font configuration
	font = wezterm.font {
		family = "JetBrainsMono Nerd Font",
		weight = "Regular",
	},
	enable_tab_bar = true,
	window_padding = {
		left = 3,
		right = 3,
		top = 0,
		bottom = 0,
	},
	-- Performance optimizations - GPU-focused
	animation_fps = 60, -- Higher animation framerate
	cursor_blink_rate = 800, -- Enable cursor blinking (ms)
	enable_scroll_bar = false,
	enable_kitty_graphics = true, -- Enable kitty graphics protocol
	front_end = "WebGpu", -- Use GPU-accelerated rendering
	webgpu_power_preference = "HighPerformance", -- Prioritize performance over power savings
	
	-- Window transparency
	window_background_opacity = 0, -- Add overall window transparency
	
	-- Window size settings (instead of full screen)
	initial_cols = 120,
	initial_rows = 35,
	
	background = {
		{
			source = {
				File = "/Users/" .. os.getenv("USER") .. "/.config/wezterm/rem.jpg",
			},
			hsb = {
				hue = 1.0,
				saturation = 1.02,
				brightness = 0.25,
			},
			-- attachment = { Parallax = 0.3 },
			-- width = "100%",
			-- height = "100%",
		},
		{
			source = {
				Color = "#282c35",
			},
			width = "100%",
			height = "100%",
			opacity = 0.7, -- Increased transparency here
		},
	},
	-- from: https://akos.ma/blog/adopting-wezterm/
	hyperlink_rules = {
		-- Matches: a URL in parens: (URL)
		{
			regex = "\\((\\w+://\\S+)\\)",
			format = "$1",
			highlight = 1,
		},
		-- Matches: a URL in brackets: [URL]
		{
			regex = "\\[(\\w+://\\S+)\\]",
			format = "$1",
			highlight = 1,
		},
		-- Matches: a URL in curly braces: {URL}
		{
			regex = "\\{(\\w+://\\S+)\\}",
			format = "$1",
			highlight = 1,
		},
		-- Matches: a URL in angle brackets: <URL>
		{
			regex = "<(\\w+://\\S+)>",
			format = "$1",
			highlight = 1,
		},
		-- Then handle URLs not wrapped in brackets
		{
			-- Before
			--regex = '\\b\\w+://\\S+[)/a-zA-Z0-9-]+',
			--format = '$0',
			-- After
			regex = "[^(]\\b(\\w+://\\S+[)/a-zA-Z0-9-]+)",
			format = "$1",
			highlight = 1,
		},
		-- implicit mailto link
		{
			regex = "\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b",
			format = "mailto:$0",
		},
	},
}
return config

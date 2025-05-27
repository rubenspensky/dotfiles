local wezterm = require("wezterm")

return {
	-- Shell predeterminado
	default_prog = { "C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe", "-NoLogo" },

	-- Apariencia
	color_scheme = "Kanagawa Dragon (Gogh)",
	font = wezterm.font("JetBrainsMono Nerd Font"),
	font_size = 12.5,
	window_background_opacity = 0.95,
	window_decorations = "RESIZE",
	window_padding = {
		left = 10,
		right = 10,
		top = 5,
		bottom = 5,
	},

	-- Barra de pestañas
	enable_tab_bar = true,
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = false,

	-- Atajos tipo Zellij
	keys = {
		-- Movimiento entre paneles
		{ key = "h", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Left") },
		{ key = "j", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Down") },
		{ key = "k", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Up") },
		{ key = "l", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Right") },

		-- División de paneles
		{ key = "v", mods = "ALT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "s", mods = "ALT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },

		-- Cierre de paneles y tabs
		{ key = "q", mods = "ALT", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
		{ key = "Q", mods = "ALT|SHIFT", action = wezterm.action.CloseCurrentTab({ confirm = true }) },

		-- Pestañas
		{ key = "t", mods = "ALT", action = wezterm.action.SpawnTab("DefaultDomain") },
		{ key = "H", mods = "ALT|SHIFT", action = wezterm.action.ActivateTabRelative(-1) },
		{ key = "L", mods = "ALT|SHIFT", action = wezterm.action.ActivateTabRelative(1) },

		-- Zoom de panel
		{ key = "z", mods = "ALT", action = wezterm.action.TogglePaneZoomState },

		-- Renombrar pestaña
		{
			key = "r",
			mods = "ALT",
			action = wezterm.action.PromptInputLine({
				description = "Renombrar pestaña:",
				action = wezterm.action_callback(function(window, pane, line)
					if line then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},
	},
}

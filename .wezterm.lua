local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.font = wezterm.font 'Hack Nerd Font Mono'
config.color_scheme = 'Bim (Gogh)'
config.font_size = 12
config.adjust_window_size_when_changing_font_size = false
config.tab_bar_at_bottom = true
config.front_end = "Software"

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.colors = {
	background = '#1e1e2e'
}

config.leader = { key = "q", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{
		mods = "LEADER|SHIFT",
		key = "%",
		action = wezterm.action.SplitHorizontal({domain="CurrentPaneDomain"}),
	},
	{
		mods = "LEADER|SHIFT",
		key = '"',
		action = wezterm.action.SplitVertical({domain="CurrentPaneDomain"}),
	},
	{
		key="c",
		mods="LEADER",
		action=wezterm.action{SpawnTab="CurrentPaneDomain"}
	},
	-- navigate tabs keymaps
	{key="h", mods="CTRL", action=wezterm.action{ActivateTabRelative=-1}},
	{key="j", mods="CTRL", action=wezterm.action{ActivateTabRelative=1}},
	{key="1", mods="LEADER", action=wezterm.action{ActivateTab=0}},
	{key="2", mods="LEADER", action=wezterm.action{ActivateTab=1}},
	{key="3", mods="LEADER", action=wezterm.action{ActivateTab=2}},
	{key="4", mods="LEADER", action=wezterm.action{ActivateTab=3}},
	{key="5", mods="LEADER", action=wezterm.action{ActivateTab=4}},
	{key="6", mods="LEADER", action=wezterm.action{ActivateTab=5}},
	{key="7", mods="LEADER", action=wezterm.action{ActivateTab=6}},
	{key="8", mods="LEADER", action=wezterm.action{ActivateTab=7}},
	{key="9", mods="LEADER", action=wezterm.action{ActivateTab=8}},
	{key="j", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Down"}},
	{key="k", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Up"}},
	{key="h", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Left"}},
	{key="l", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Right"}},
	{key="x", mods="LEADER", action=wezterm.action{CloseCurrentTab={confirm=true}}},

}

return config

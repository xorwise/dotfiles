local wezterm = require 'wezterm'

local config = wezterm.config_builder()
config.default_prog = {
    "/usr/bin/fish"
}

config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font_size = 14.0
config.colors = {
    foreground = "#c5c9c5",
    background = "#121212",

    cursor_bg = "#c8c093",
    cursor_fg = "#121212",

    selection_fg = "#c8c093",
    selection_bg = "#2d4f67",

    scrollbar_thumb = "#16161d",
    split = "#16161d",
    ansi = { "#0D0C0C", "#C4746E", "#8A9A7B", "#C4B28A", "#8BA4B0", "#A292A3", "#8EA4A2", "#C8C093" },
    brights = { "#A6A69C", "#E46876", "#87A987", "#E6C384", "#7FB4CA", "#938AA9", "#7AA89F", "#C5C9C5" },
    indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
}
config.enable_tab_bar = false


return config

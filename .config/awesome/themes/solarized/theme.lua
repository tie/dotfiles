--------------------------------------------------------------------------------
-- Author: Ivan Trubach
-- Copyright (c) 2016 Ivan Trubach
--------------------------------------------------------------------------------
-- Theme: Solarized Dark
--
-- Colorscheme: solarized by ethan schoonover
-- 	http://ethanschoonover.com/solarized
--------------------------------------------------------------------------------
theme = {}
--------------------------------------------------------------------------------
local themes_dir = os.getenv("HOME") .. "/.config/awesome/themes/solarized"
theme.wallpaper  = themes_dir .. "/wall/solarized.png"
--------------------------------------------------------------------------------
-- System font
theme.fontName     = "Go"
theme.monoFontName = "Go Mono"
theme.fontSize     = 19
theme.font         = theme.fontName .. " " .. theme.fontSize
-- Icons font
theme.iconFontName = "FontAwesome"
--------------------------------------------------------------------------------
-- Solarized colors ------------------------------------------------------------
theme.colors = {
	base03  = "#002b36",
	base02  = "#073642",
	base01  = "#586e75",
	base00  = "#657b83",
	base0   = "#839496",
	base1   = "#93a1a1",
	base2   = "#eee8d5",
	base3   = "#fdf6e3",
	yellow  = "#b58900",
	orange  = "#cb4b16",
	red     = "#dc322f",
	magenta = "#d33682",
	violet  = "#6c71c4",
	blue    = "#268bd2",
	cyan    = "#2aa198",
	green   = "#859900",
}
--------------------------------------------------------------------------------
-- General ---------------------------------------------------------------------
theme.bg_normal     = theme.colors.base03
theme.bg_focus      = theme.colors.base02
--theme.bg_urgent     = ???
--theme.bg_minimize   = ???
--theme.bg_systray    = ???

theme.fg_normal     = theme.colors.base01
theme.fg_focus      = theme.colors.base00
--theme.fg_urgent     = ???
--theme.fg_minimize   = ???

theme.border_width  = 1
theme.border_normal = theme.colors.base02
theme.border_focus  = theme.colors.base1
--theme.border_marked = ???
--------------------------------------------------------------------------------
-- Taglist ---------------------------------------------------------------------
theme.taglist_bg_focus    = theme.colors.base02
theme.taglist_bg_occupied = theme.colors.base03
theme.taglist_bg_empty    = theme.colors.base03
--theme.taglist_bg_urgent   = ???

theme.taglist_fg_focus    = theme.colors.base00
theme.taglist_fg_empty    = theme.colors.base01
theme.taglist_fg_occupied = theme.colors.base01
--theme.taglist_fg_urgent   = ???
--------------------------------------------------------------------------------
-- Tasklist --------------------------------------------------------------------
theme.tasklist_bg_focus  = theme.colors.base03
--theme.tasklist_bg_urgent = ???

theme.tasklist_fg_focus  = theme.colors.base00
--theme.tasklist_fg_urgent = ???
--------------------------------------------------------------------------------
-- Titlebar --------------------------------------------------------------------
--theme.titlebar_bg_focus  = ???
--theme.titlebar_bg_normal = ???

--theme.titlebar_fg_focus  = ???
--theme.titlebar_fg_normal = ???
--------------------------------------------------------------------------------
-- Tooltip ---------------------------------------------------------------------
--theme.tooltip_font         = ???
--theme.tooltip_opacity      = ???
--theme.tooltip_fg_color     = ???
--theme.tooltip_bg_color     = ???
--theme.tooltip_border_width = ???
--theme.tooltip_border_color = ???
--------------------------------------------------------------------------------
-- Mouse finder ----------------------------------------------------------------
--theme.mouse_finder_color           = ???
--theme.mouse_finder_timeout         = ???
--theme.mouse_finder_animate_timeout = ???
--theme.mouse_finder_radius          = ???
--theme.mouse_finder_factor          = ???
--------------------------------------------------------------------------------
-- Misc ------------------------------------------------------------------------
--theme.textbox_widget_margin_top     = 0
theme.notify_fg                     = theme.fg_normal
theme.notify_bg                     = theme.bg_normal
theme.notify_border                 = theme.border_focus
--theme.awful_widget_height           = 14
--theme.awful_widget_margin_top       = 2
theme.menu_height                   = 32
theme.menu_width                    = 280
--------------------------------------------------------------------------------
-- Icons -----------------------------------------------------------------------
theme.awesome_icon                  = themes_dir .."/icons/awesome16.png"

theme.submenu_icon                  = themes_dir .. "/icons/submenu.png"
theme.taglist_squares_sel           = themes_dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel         = themes_dir .. "/icons/square_unsel.png"

theme.layout_tile                   = themes_dir .. "/icons/tile.png"
theme.layout_tilegaps               = themes_dir .. "/icons/tilegaps.png"
theme.layout_tileleft               = themes_dir .. "/icons/tileleft.png"
theme.layout_tilebottom             = themes_dir .. "/icons/tilebottom.png"
theme.layout_tiletop                = themes_dir .. "/icons/tiletop.png"
theme.layout_fairv                  = themes_dir .. "/icons/fairv.png"
theme.layout_fairh                  = themes_dir .. "/icons/fairh.png"
theme.layout_spiral                 = themes_dir .. "/icons/spiral.png"
theme.layout_dwindle                = themes_dir .. "/icons/dwindle.png"
theme.layout_max                    = themes_dir .. "/icons/max.png"
theme.layout_fullscreen             = themes_dir .. "/icons/fullscreen.png"
theme.layout_magnifier              = themes_dir .. "/icons/magnifier.png"
theme.layout_floating               = themes_dir .. "/icons/floating.png"

theme.arrl_dl                       = themes_dir .. "/icons/arrl_dl.png"
theme.arrl_ld                       = themes_dir .. "/icons/arrl_ld.png"

theme.tasklist_disable_icon         = true
theme.tasklist_floating             = ""
theme.tasklist_maximized_horizontal = ""
theme.tasklist_maximized_vertical   = ""
--------------------------------------------------------------------------------

return theme

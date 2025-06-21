local gears = require("gears")
local theme = {}

local themes_path = gears.filesystem.get_configuration_dir() .. "/themes/"

-- ░█▀▀░█▀█░█░░░█▀█░█▀▄░█▀▀
-- ░█░░░█░█░█░░░█░█░█▀▄░▀▀█
-- ░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀

local colors = {
  eerie_black = '#171D1C',
  neon_blue   = '#5863f8',
  picton_blue = '#37ff8b',--'#97cecd',
  sandy       = '#ff9b42',
  green_ish   = '#c9dcb3',
  green_light = '#97cecd',
  cerise      = '#da4167',
  red         = '#fe6965',
  transparent = '#00000000',
  dark_no_opacity = '#071822',
  dark            = '#1d2021'--'#071822cc',
}

-- ░▀█▀░█▀▀░█░█░▀█▀░░░▀█▀░█▀▀░█▀█░█▀█░█▀▀
-- ░░█░░█▀▀░▄▀▄░░█░░░░░█░░█░░░█░█░█░█░▀▀█
-- ░░▀░░▀▀▀░▀░▀░░▀░░░░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀

--theme.clock_icon = "󱑇 "
theme.calendar_icon = "󱁳 "
--theme.fs_icon = " "
theme.ram_icon = "  "
theme.volume_icon = ""
theme.download_icon = " "--" ",
theme.upload_icon = ""
theme.focus_app_icon = "󱟲 " --󱟱 󱟲
theme.taglist_icon = "󱗼 "
theme.workspaces_icon = themes_path .. "workspaces.svg"
theme.tag_1 = themes_path .. "ball_1.svg"
theme.tag_1_selected = themes_path .. "ball_1_dark.svg"
theme.tag_2_selected = themes_path .. "ball_2_dark.svg"
theme.tag_3_selected = themes_path .. "ball_3_dark.svg"
theme.tag_4_selected = themes_path .. "ball_4_dark.svg"
theme.tag_2 = themes_path .. "ball_2.svg"
theme.tag_3 = themes_path .. "ball_3.svg"
theme.tag_4 = themes_path .. "ball_4.svg"
theme.tag_5 = themes_path .. "ball_5.svg"
theme.tag_6 = themes_path .. "ball_6.svg"
theme.tag_7 = themes_path .. "ball_7.svg"
theme.brightness_icon = themes_path .. "brightness.svg"
theme.focused_app_icon = themes_path .. "card-multiple-outline.svg"
theme.calendar_icon = themes_path .. "calendar.svg"
theme.filesystem_icon = themes_path .. "filesystem.svg"
theme.clock_icon = themes_path .. "clock.svg"
theme.arch_icon = themes_path .. "arch.svg"
theme.cpu_icon = themes_path .. "cpu.svg"
theme.ram_icon = themes_path .. "ram.svg"
theme.battery_icon = themes_path .. "battery1.svg"
theme.package_full_icon = themes_path .. "package_check.svg"
theme.package_icon = themes_path .. "package.svg"
theme.pkg_icon = ""
theme.blank_icon = "--"

-- ░▀█▀░█░█░█▀▀░█▄█░█▀▀░░░█░█░█▀█░█▀▄░▀█▀░█▀█░█▀▄░█░░░█▀▀░█▀▀
-- ░░█░░█▀█░█▀▀░█░█░█▀▀░░░▀▄▀░█▀█░█▀▄░░█░░█▀█░█▀▄░█░░░█▀▀░▀▀█
-- ░░▀░░▀░▀░▀▀▀░▀░▀░▀▀▀░░░░▀░░▀░▀░▀░▀░▀▀▀░▀░▀░▀▀░░▀▀▀░▀▀▀░▀▀▀

theme.font  = "Inter 14"

theme.bg_normal = colors.dark
theme.bg_focus = colors.sandy
theme.bg_minimize = colors.red
theme.bg_urgent = colors.red

theme.fg_normal = colors.sandy
theme.fg_focus = colors.dark_no_opacity
theme.fg_urgent = colors.cerise
theme.fg_minimize = colors.picton_blue

theme.wallpaper = themes_path .. "wallpaper.png"
theme.wibar_margin = 0 

-- ░█▀▀░█░░░▀█▀░█▀▀░█▀█░▀█▀
-- ░█░░░█░░░░█░░█▀▀░█░█░░█░
-- ░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░░▀░

theme.border_color_normal = colors.dark_no_opacity
theme.border_color_active = colors.sandy
theme.border_width        = 2
theme.useless_gap = 5

-- ░█▀▀░█▀█░█▀█░█▀█░░░▀█▀░█▀█░░░█▀▄░█▀▀░█▀▀░▀█▀░▀▀█░█▀▀
-- ░▀▀█░█░█░█▀█░█▀▀░░░░█░░█░█░░░█▀▄░█▀▀░▀▀█░░█░░▄▀░░█▀▀
-- ░▀▀▀░▀░▀░▀░▀░▀░░░░░░▀░░▀▀▀░░░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀

theme.snap_bg = colors.sandy
theme.snap_border_width = 2
--theme.snap_shape = gears.shape

-- ░▀█▀░█▀█░█▀█░░░█▀▄░█▀█░█▀▄
-- ░░█░░█░█░█▀▀░░░█▀▄░█▀█░█▀▄
-- ░░▀░░▀▀▀░▀░░░░░▀▀░░▀░▀░▀░▀

theme.wibar_stretch = true
-- theme.wibar_border_width
-- theme.wibar_border_color
theme.wibar_ontop = false
theme.wibar_opacity = 1.0
theme.wibar_height = 30 
theme.wibar_bg = colors.transparent


-- ░█▀▀░█░░░█▀█░█▀▀░█░█░
-- ░█░░░█░░░█░█░█░░░█▀▄░
-- ░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░

theme.clock_fg = colors.dark_no_opacity
theme.clock_bg = colors.sandy

-- ░█▀▀░█▀█░█░░░█▀▀░█▀█░█▀▄░█▀█░█▀▄░
-- ░█░░░█▀█░█░░░█▀▀░█░█░█░█░█▀█░█▀▄░
-- ░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀░▀░▀▀░░▀░▀░▀░▀░

theme.calendar_fg = colors.sandy
theme.calendar_bg = colors.transparent
theme.calendar_border_color = colors.sandy

-- ░█▀█░█▀▀░▀█▀░█░█░█▀█░█▀▄░█░█
-- ░█░█░█▀▀░░█░░█▄█░█░█░█▀▄░█▀▄
-- ░▀░▀░▀▀▀░░▀░░▀░▀░▀▀▀░▀░▀░▀░▀

theme.network_download_fg = colors.dark_no_opacity
theme.network_download_bg = colors.sandy

-- CPU
theme.cpu_fg = colors.sandy
theme.cpu_bg = theme.bg_normal
theme.cpu_border_color = colors.sandy

-- ░█▀█░█▀▀░▀█▀░▀█▀░█░█░█▀▀░░░█▀▀░█░░░▀█▀░█▀▀░█▀█░▀█▀
-- ░█▀█░█░░░░█░░░█░░▀▄▀░█▀▀░░░█░░░█░░░░█░░█▀▀░█░█░░█░
-- ░▀░▀░▀▀▀░░▀░░▀▀▀░░▀░░▀▀▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░░▀░

theme.active_client_fg = colors.sandy
theme.active_client_bg = theme.bg_normal
theme.active_client_border_color = colors.sandy

-- ░▀█▀░█▀█░█▀▀░█░░░▀█▀░█▀▀░▀█▀
-- ░░█░░█▀█░█░█░█░░░░█░░▀▀█░░█░
-- ░░▀░░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀░░▀░

theme.taglist_fg = theme.fg_normal
theme.taglist_bg = theme.bg_normal
theme.taglist_border_color = colors.sandy

-- ░▀█▀░█▀█░█▀▀░█░░░▀█▀░█▀▀░▀█▀░░░░░▀▄░░▀█▀░█▀█░█▀▀░█░█░█░░░▀█▀░█▀▀░▀█▀
-- ░░█░░█▀█░█░█░█░░░░█░░▀▀█░░█░░▄▄▄░░▄▀░░█░░█▀█░▀▀█░█▀▄░█░░░░█░░▀▀█░░█░
-- ░░▀░░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀░░▀░░░░░░▀░░░░▀░░▀░▀░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀▀▀░░▀░

theme.tasklist_bg_focus = colors.sandy
theme.tasklist_bg_unfocus = colors.transparent
theme.tasklist_fg_focus = theme.bg_normal
theme.tasklist_fg_unfocus = theme.fg_normal

return theme

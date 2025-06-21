local beautiful = require("beautiful")
local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local common = require("widgets.wibar.common")
local pacman_widget = require('awesome-wm-widgets.pacman-widget.pacman')
local pacman = pacman_widget()

local stylized_pacman_widget = common.create_stylized_box("bg",pacman)
local widget_wrapper = common.create_widgets_wrapper(stylized_pacman_widget)
return widget_wrapper

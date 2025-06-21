local beautiful = require("beautiful")
local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local common = require("widgets.wibar.common")

local logout = require("awesome-wm-widgets.logout-menu-widget.logout-menu")
local widget_wrapper = common.create_widgets_wrapper(logout)

return widget_wrapper 

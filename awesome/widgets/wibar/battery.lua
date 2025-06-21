local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local gears = require("gears")
local common = require("widgets.wibar.common")

local battery_text = wibox.widget {
  id = "battery_text",
  widget = wibox.widget.textbox
}
-- acpi | awk '{print $4}'
awful.widget.watch("bash -c \"acpi | awk '{print \\$4}'\"", 100,
  function(_, stdout)
    battery_text:set_text(stdout)
  end
)

local battery_icon_widget = common.create_icon_widget(beautiful.battery_icon)
local stylized_widget = common.create_stylized_box("bg",battery_icon_widget,battery_text)
local wrapper_widget = common.create_widgets_wrapper(stylized_widget)
return wrapper_widget

local beautiful = require("beautiful")
local awful = require("awful")
local wibox = require("wibox")
local common = require("widgets.wibar.common")


local brightness_icon_widget = common.create_icon_widget(beautiful.brightness_icon)
--local brightness_text_widget = awful.widget.watch("bash -c 'ddcutil getvcp 10 | awk -F\"=\" \"/current value/ {print $2+0}\"'", 3)
local brightness_text_widget = wibox.widget {
  widget = wibox.widget.textbox
}
awful.widget.watch("ddcutil getvcp 10",60, function(_, stdout)
  print("Raw output:", stdout)
  -- Match one or more digits after 'current value', allowing for any whitespace around '=':
  local brightness = stdout:match("current value%s*=%s*(%d+)")
  brightness_text_widget:set_text(brightness or "N/A")
end)

local stylized_brightness_widget = common.create_stylized_box("fg",brightness_icon_widget,brightness_text_widget)
local widget_wrapper = common.create_widgets_wrapper(stylized_brightness_widget)
return widget_wrapper

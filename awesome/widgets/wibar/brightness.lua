local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local gears = require("gears")
local common = require("widgets.wibar.common")

local brightness_text = wibox.widget {
  id = "brightness_text",
  widget = wibox.widget.textbox
}
 --awesome.emit_signal("brightness::changed", brightness)

local function update_brightness() 
  awful.spawn.easy_async_with_shell("cat /sys/class/backlight/acpi_video0/actual_brightness", function(stdout)
       -- Trim the result 
    local brightness = stdout:gsub("%s+", "") 
    brightness_text:set_text(brightness .. "%")
  end)
end

awesome.connect_signal("brightness::changed", function() 
  update_brightness()
end)

update_brightness()

local brightness_icon_widget = common.create_icon_widget(beautiful.brightness_icon)
local stylized_widget = common.create_stylized_box("bg",brightness_icon_widget,brightness_text)
local wrapper_widget = common.create_widgets_wrapper(stylized_widget)

return wrapper_widget

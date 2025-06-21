local awful = require("awful")
local brightness_widget = require("widgets.wibar.brightness")

local function update_brightness()
    awful.spawn.easy_async_with_shell("cat /sys/class/backlight/acpi_video0/actual_brightness", function(stdout)
        -- Trim the result
        local brightness = stdout:gsub("%s+", "")
        -- Emit the custom signal with the brightness value
        awesome.emit_signal("brightness::changed", brightness)
    end)
end
awesome.connect_signal("brightness::changed", function(brightness)
    brightness_text:set_text(brightness .. "%")
end)

local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local gears = require("gears")
local common = require("widgets.wibar.common")
local idle_prev = 0
local total_prev = 0
local down_prev = 0
local fs_widget = require("awesome-wm-widgets.fs-widget.fs-widget")
local fs = fs_widget({mounts = {'/'}, timeout = 60})
local icon = beautiful.filesystem_icon
local fs_icon = common.create_icon_widget(icon)
-- Helper functions
-- Function to update CPU usage
local function update_cpu(widget, stdout)
    -- Corrected pattern without trailing %s
    local user, nice, system, idle, iowait, irq, softirq, steal, guest, guest_nice = 
        stdout:match('(%d+)%s+(%d+)%s+(%d+)%s+(%d+)%s+(%d+)%s+(%d+)%s+(%d+)%s+(%d+)%s+(%d+)%s+(%d+)')
    -- Ensure all captures are successful
    if user and nice and system and idle and iowait and irq and softirq and steal and guest and guest_nice then
        -- Convert captured strings to numbers
        user = tonumber(user)
        nice = tonumber(nice)
        system = tonumber(system)
        idle = tonumber(idle)
        iowait = tonumber(iowait)
        irq = tonumber(irq)
        softirq = tonumber(softirq)
        steal = tonumber(steal)
        guest = tonumber(guest)
        guest_nice = tonumber(guest_nice)

        -- Calculate total and idle
        local total = user + nice + system + idle + iowait + irq + softirq + steal
        local diff_idle = idle - idle_prev
        local diff_total = total - total_prev

        -- Prevent division by zero
        if diff_total > 0 then
            local diff_usage = (1000 * (diff_total - diff_idle) / diff_total + 5) / 10
            local line = string.format("%02d", math.floor(diff_usage + 0.5)) -- Rounded value
            widget:set_text(line .. "%")
        end

        -- Update previous values
        total_prev = total
        idle_prev = idle
    else
    end

    -- Optional: Garbage collection (not typically needed here)
    collectgarbage('collect')
end

local cpu_info_text = wibox.widget {
      id = "cpu_info_text",
      widget = wibox.widget.textbox
}
local ram_info_text = wibox.widget {
  id = "ram_info_text",
  widget = wibox.widget.textbox
}
awful.widget.watch("sh -c \"free -b | awk '/Mem:/ {printf \\\"%.2f%%\\\", ($3/$2)*100}'\"", 10, function(_, stdout)
    ram_info_text:set_text(stdout)
end)
-- Set up the watch with the optimized command and update function
awful.widget.watch('grep "^cpu " /proc/stat', 1, update_cpu, cpu_info_text)

local download_info_text = wibox.widget {
  id = "down_info_text",
  widget = wibox.widget.textbox
}
awful.widget.watch(shell_command, 5, update_download, download_info_text)

local ram_icon_widget = common.create_icon_widget(beautiful.ram_icon)
local cpu_icon_widget = common.create_icon_widget(beautiful.cpu_icon)
local stylized_cpu_widget = common.create_stylized_box("fg",cpu_icon_widget,cpu_info_text)
local stylized_ram_widget = common.create_stylized_box("bg",ram_icon_widget,ram_info_text)
local stylized_fs_wiget = common.create_stylized_box("bg",fs_icon,fs)
local widget_wrapper = common.create_widgets_wrapper(stylized_fs_wiget, stylized_ram_widget,stylized_cpu_widget)

return widget_wrapper

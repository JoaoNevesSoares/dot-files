local beautiful = require("beautiful")
local wibox     = require("wibox")
local gears     = require("gears")
local calendar_popup = require("awesome-wm-widgets.calendar-widget.calendar")

-- Calendar popup configuration
local calendar_options = {
    theme                 = "outrun",
    start_sunday          = true,
    placement             = "top_right",
    radius                = 8,
    previous_month_button = 1,
    next_month_button     = 3,
}

local create_stylized_box = require("widgets.wibar.common").create_stylized_box
local create_icon_widget = require("widgets.wibar.common").create_icon_widget
local create_widgets_wrapper = require("widgets.wibar.common").create_widgets_wrapper
local calendar_popup_widget = calendar_popup(calendar_options)

local function create_textclock_widget(text)
  local text_widget = wibox.widget {
    format = text,
    widget = wibox.widget.textclock
  }
  return text_widget
end

-- Clock widget components
local clock_icon_widget = create_icon_widget(beautiful.clock_icon)
local calendar_icon_widget = create_icon_widget(beautiful.calendar_icon)
local clock_text_widget = create_textclock_widget('%H:%M')
local calendar_text_widget = create_textclock_widget('%d/%m')

local stylized_clock_widget = create_stylized_box("fg",clock_icon_widget,clock_text_widget)
local stylized_calendar_widget = create_stylized_box("bg",calendar_icon_widget,calendar_text_widget)

-- Toggle the calendar popup on left-click
stylized_calendar_widget:connect_signal("button::press", function(_, _, _, button)
    if button == 1 then calendar_popup_widget.toggle() end
end)

return create_widgets_wrapper(stylized_calendar_widget,stylized_clock_widget)

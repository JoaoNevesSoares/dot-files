local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

local widget = awful.popup {

  widget = {
    {
      {
        text = "hello world",
        widget = wibox.widget.textbox
      },
      bg = beautiful.bg,
      widget = wibox.widget.background
    },
    layout = wibox.layout.fixed.vertical
  },
  placement = awful.placement.centered,
  shape = gears.shape.rounded_rect,
  ontop = true,
  visible = false,
}
return widget

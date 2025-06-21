local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

local wallpaper_widget = function(s)
  awful.wallpaper {
    screen = s,
    widget = {
      image  = gears.surface.crop_surface {
        surface = gears.surface.load_uncached(beautiful.wallpaper),
        ratio = s.geometry.width/s.geometry.height,
      },
      widget = wibox.widget.imagebox,
    },
  }
end

return wallpaper_widget

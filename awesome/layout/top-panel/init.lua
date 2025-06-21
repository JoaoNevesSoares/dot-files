local awful = require("awful")
local wibox = require("wibox")
local connect_workspace = require("widgets.wibar.workspace")
local date_time = require("widgets.wibar.date")
local connect_focused_app = require("widgets.wibar.focused_app")
local system_info = require("widgets.wibar.system")
local logout = require("widgets.wibar.logout")
local pacman = require("widgets.wibar.pacman")
local battery = require("widgets.wibar.battery")
local brightness = require("widgets.wibar.brightness")

local connect_bar = function(s)
  s.bar = awful.wibar({
    position = "top",
    screen = s
  })
  s.bar :setup {
    {
      {
        logout,
        connect_workspace(s),
        connect_focused_app(s),
        spacing = 5,
        layout = wibox.layout.fixed.horizontal,
      },
      left = 4,
      widget = wibox.container.margin
    },
    nil,
    {
      {
        brightness,
        battery,
        pacman,
        system_info,
        date_time,
        spacing = 5,
        layout = wibox.layout.fixed.horizontal,
      },
      right = 4,
      widget = wibox.container.margin
    },
    layout = wibox.layout.align.horizontal,
  }
end

return connect_bar

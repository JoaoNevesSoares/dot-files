local awful = require("awful")
local connect_bar = require("layout.top-panel")
local connect_wallaper = require("widgets.wallpaper")

screen.connect_signal("request::desktop_decoration", function (s)
  awful.tag({"1", "2", "3", "4"}, s)
  s.mybar = connect_bar(s)
end)

screen.connect_signal("request::wallpaper",connect_wallaper)

local awful = require("awful")
local mod = require("bindings.mod")
local menu = require("widgets.menu")
return {
  global_mouse = { awful.button({}, 3, function() menu:toggle() end)},
  workspaces_buttons = {
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({mod.super }, 1, function(t)
      if client.focus then
        client.focus:move_to_tag(t)
      end
    end),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({mod.super }, 3, function(t)
      if client.focus then
        client.focus:toggle_tag(t)
      end 
    end), 
    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
  }
}

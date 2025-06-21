local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")
require("apps")

local myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
   { "terminal", function() awful.spawn(terminal) end},
   { "browser", function() awful.spawn(browser) end}
}
local mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu},
                                    { "open terminal", terminal}
                                  }
                        })

return mymainmenu

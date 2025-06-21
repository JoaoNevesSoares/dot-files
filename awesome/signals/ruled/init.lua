local ruled = require("ruled")
local awful = require("awful")

ruled.notification.connect_signal("request::rules",
  function ()
    ruled.notification.append_rule {
      rule =  { },
      properties = {
        screen = awful.screen.preferred,
        implicit_timeout = 5,
      }
    }
  end
)
ruled.client.connect_signal("request::rules", function()
    ruled.client.append_rule {
        id         = "global",
        rule       = { },
        properties = {
            focus     = awful.client.focus.filter,
            raise     = true,
            screen    = awful.screen.preferred,
            placement = awful.placement.no_overlap+awful.placement.no_offscreen,
        }
    }
end)

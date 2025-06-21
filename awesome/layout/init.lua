local awful = require("awful")

awful.screen.connect_for_each_screen( function (s)

  s.padding = {
    left = 5,
    right = 5,
    top = 8,
    bottom = 10
  }
end)

function move_client(c, x, y, w, h)
  c:geometry({
    x       = x,
    y       = y,
    width   = w,
    height  = h
  })
end

function focus_client(direction)
  local c = client.focus
  if c then
    awful.client.focus.bydirection(direction, c)
  end
end

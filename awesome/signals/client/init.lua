-- ░█▀▀░▀█▀░█▀▀░█▀█░█▀█░█░░░█▀▀
-- ░▀▀█░░█░░█░█░█░█░█▀█░█░░░▀▀█
-- ░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀░▀░▀▀▀░▀▀▀

local awful = require("awful")
local client_keys = require("bindings.client.key")
local mouse_bindings = require("bindings.client.mouse")

client.connect_signal("request::default_keybindings",
  function()
    awful.keyboard.append_client_keybindings(client_keys)
  end
)
client.connect_signal("request::default_mousebindings",
  function()
    awful.mouse.append_client_mousebindings(mouse_bindings)
  end
)

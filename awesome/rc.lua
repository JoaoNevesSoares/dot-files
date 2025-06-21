-- ░█▀█░█░█░█▀▀░█▀▀░█▀█░█▄█░█▀▀░█░█░█▄█
-- ░█▀█░█▄█░█▀▀░▀▀█░█░█░█░█░█▀▀░█▄█░█░█
-- ░▀░▀░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░▀░▀░▀░▀
-- Banner generated using `$toilet -f pagga AwesomeWM`

pcall(require, "luarocks.loader")
require("awful.autofocus")
local awful = require("awful")

-- ░▀█▀░█░█░█▀▀░█▄█░█▀▀
-- ░░█░░█▀█░█▀▀░█░█░█▀▀
-- ░░▀░░▀░▀░▀▀▀░▀░▀░▀▀▀

local gears = require("gears")
local beautiful = require("beautiful")
beautiful.init(gears.filesystem.get_configuration_dir() .. "/themes/theme.lua")

-- ░█▀▀░█▀▀░█▀▄░█▀▀░█▀▀░█▀█░░░█░░░█▀█░█░█░█▀█░█░█░▀█▀
-- ░▀▀█░█░░░█▀▄░█▀▀░█▀▀░█░█░░░█░░░█▀█░░█░░█░█░█░█░░█░
-- ░▀▀▀░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀░▀░░░▀▀▀░▀░▀░░▀░░▀▀▀░▀▀▀░░▀░

require("layout")

-- ░█▀▀░█▀█░█▀█░█▀▀░▀█▀░█▀▀░█░█░█▀▄░█▀█░▀█▀░▀█▀░█▀█░█▀█░█▀▀
-- ░█░░░█░█░█░█░█▀▀░░█░░█░█░█░█░█▀▄░█▀█░░█░░░█░░█░█░█░█░▀▀█
-- ░▀▀▀░▀▀▀░▀░▀░▀░░░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀░▀░░▀░░▀▀▀░▀▀▀░▀░▀░▀▀▀

-- ░█▀█░█▀█░█▀█░█▀▀
-- ░█▀█░█▀▀░█▀▀░▀▀█
-- ░▀░▀░▀░░░▀░░░▀▀▀

require("apps")

-- ░█▀▀░█░░░█▀█░█▀▄░█▀█░█░░░░░█░█░█▀▀░█░█░█▀▀
-- ░█░█░█░░░█░█░█▀▄░█▀█░█░░░░░█▀▄░█▀▀░░█░░▀▀█
-- ░▀▀▀░▀▀▀░▀▀▀░▀▀░░▀░▀░▀▀▀░░░▀░▀░▀▀▀░░▀░░▀▀▀

local global_keys = require("bindings.global.key")
awful.keyboard.append_global_keybindings(global_keys)

-- ░█▀▀░█░░░█▀█░█▀▄░█▀█░█░░░░░█▄█░█▀█░█░█░█▀▀░█▀▀
-- ░█░█░█░░░█░█░█▀▄░█▀█░█░░░░░█░█░█░█░█░█░▀▀█░█▀▀
-- ░▀▀▀░▀▀▀░▀▀▀░▀▀░░▀░▀░▀▀▀░░░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀

local global_mouse = require("bindings.global.mouse").global_mouse
awful.mouse.append_global_mousebindings(global_mouse)

-- ░█▀▀░▀█▀░█▀▀░█▀█░█▀█░█░░░█▀▀
-- ░▀▀█░░█░░█░█░█░█░█▀█░█░░░▀▀█
-- ░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀░▀░▀▀▀░▀▀▀

require("signals")

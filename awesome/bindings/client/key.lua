local awful = require("awful")
local beautiful = require("beautiful")
require("awful.autofocus")
require("layout")
local mod = require("bindings.mod")
local client_keys = {
    awful.key({ mod.alt, mod.ctrl }, "u",
    function(c)
        print("Current centered_pos:", c.centered_pos)
        if c.centered_pos then
            if c.centered_pos == "extended" then
                c.centered_pos = "one_third"
                move_client(
                    c,
                    awful.screen.focused().workarea.width / 3 + beautiful.useless_gap,
                    awful.screen.focused().tiling_area.y,
                    awful.screen.focused().tiling_area.width / 3 - 3 * beautiful.useless_gap,
                    awful.screen.focused().tiling_area.height
                )
            elseif c.centered_pos == "one_third" then
                c.centered_pos = "extended"
                move_client(
                    c,
                    awful.screen.focused().workarea.width / 4,
                    awful.screen.focused().tiling_area.y,
                    awful.screen.focused().workarea.width / 2,
                    awful.screen.focused().tiling_area.height
                )
            end
        else
            c.centered_pos = "extended"
            move_client(
                c,
                awful.screen.focused().workarea.width / 4,
                awful.screen.focused().tiling_area.y,
                awful.screen.focused().workarea.width / 2,
                awful.screen.focused().tiling_area.height
            )
        end
    end, { description = "toggle extended and one_third", group = "client" }),
    awful.key({mod.ctrl, mod.alt}, "j",
        function(c)
            move_client(
                c,
                awful.screen.focused().tiling_area.x,
                awful.screen.focused().tiling_area.y,
                awful.screen.focused().tiling_area.width / 3 - 3*beautiful.useless_gap,
                awful.screen.focused().tiling_area.height)
        end, {description = "move client window to right half", group="client"}),
    --Move client to left 4/4 of the screen 
    awful.key({mod.ctrl, mod.alt}, "k",
        function(c)
            move_client(
                c,
                2 * (awful.screen.focused().workarea.width /3) + 2*beautiful.useless_gap,
                awful.screen.focused().tiling_area.y,
                awful.screen.focused().tiling_area.width / 3 - 3*beautiful.useless_gap,
                awful.screen.focused().tiling_area.height)
        end, {description = "move client window to right half", group="client"}),
    --Move client to left 4/4 of the screen 
    awful.key({mod.ctrl, mod.alt}, "l",
        function(c)
            move_client(
                c,
                3 * (awful.screen.focused().workarea.width /4) + 2*beautiful.useless_gap,
                awful.screen.focused().tiling_area.y,
                awful.screen.focused().tiling_area.width / 4 - 3*beautiful.useless_gap,
                awful.screen.focused().tiling_area.height)
        end, {description = "move client window to right half", group="client"}),
    --Move client to left 4/4 of the screen 
    awful.key({mod.ctrl, mod.alt}, "h",
        function(c)
            move_client(
                c,
                awful.screen.focused().tiling_area.x,
                awful.screen.focused().tiling_area.y,
                awful.screen.focused().tiling_area.width / 4 - 3*beautiful.useless_gap,
                awful.screen.focused().tiling_area.height)
        end, {description = "move client window to left half", group="client"}),
    -- Move client to left half
    awful.key({mod.ctrl, mod.alt}, "Left",
        function (c)
            move_client(
                c,                                              -- client
                awful.screen.focused().tiling_area.x + beautiful.useless_gap,                    -- x coord
                awful.screen.focused().tiling_area.y,               -- y coord
                awful.screen.focused().tiling_area.width / 2 - 3*beautiful.useless_gap, -- width
                awful.screen.focused().tiling_area.height
            )
        end, { description = "move client window to left half", group="client" }),
    -- Move client to left half
    awful.key({mod.alt, mod.ctrl}, "Right",
        function (c)
            move_client(
                c,                                              -- client
                awful.screen.focused().tiling_area.width / 2 + 2*beautiful.useless_gap, -- x coord
                awful.screen.focused().tiling_area.y,               -- y coord
                awful.screen.focused().tiling_area.width / 2 - 3*beautiful.useless_gap, -- width
                awful.screen.focused().tiling_area.height          -- height
            )
        end, { description = "move client window to right half", group="client" }),

    -- Make client fullscreen 
    awful.key({mod.alt, mod.ctrl}, "Return",
        function (c)
            move_client(
                c,                                              -- client
                awful.screen.focused().tiling_area.x,                                              -- x coord
                awful.screen.focused().tiling_area.y,               -- y coord
                awful.screen.focused().tiling_area.width,                                   -- width
                awful.screen.focused().tiling_area.height          -- height
            )
        end, { description = "make client fullscreen", group="client" }),
    awful.key({ mod.super,    }, "q",      function (c) c:kill()                         end,
            {description = "close", group = "client"}),
    awful.key({ mod.super,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
  }
return client_keys

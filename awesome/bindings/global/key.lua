local awful = require("awful")
local mod = require("bindings.mod")
local pop_widget = require("widgets.popup")
local hotkeys_popup = require("awful.hotkeys_popup")
require("apps")

local global_keys = {
  awful.key({mod.alt, mod.shift}, "a",
            function () pop_widget.visible = false end),
  awful.key({mod.alt, mod.shift}, "d",
            function () pop_widget.visible = true end),
  awful.key({mod.super}, "l", function () awful.spawn(betterlockscreen) end,
    { description = "lock screen with betterlockscreen", group="awesome"}),
  awful.key({ mod.alt, mod.shift }, "t", function () awful.spawn(terminal) end,
    {description = "open a terminal", group = "launcher"}),
    -- Launch run prompt
    awful.key({ mod.super},"space",     function () awful.spawn(rofi) end,
              {description = "launch rofi", group = "launcher"}),
    -- Focus client windows
    awful.key({ mod.alt, mod.ctrl }, "o", function () focus_client("left") end,
              {description = "focus left client window", group="floating"}),
    awful.key({ mod.alt, mod.ctrl}, "p", function () focus_client("right") end,
              {description = "focus left client window", group="floating"}),
    awful.key({ mod.super,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ mod.super, mod.ctrl }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ mod.super, mod.shift   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),
    awful.key({}, "XF86MonBrightnessUp",
               function ()
                  awful.spawn.with_shell("./brightness_control.sh INC")
                  awesome.emit_signal("brightness::changed")
                end, {description = "change brightness to up", group = "media row"}),
    awful.key({}, "XF86MonBrightnessDown",
               function ()
                  awful.spawn.with_shell("./brightness_control.sh DEC")
                  awesome.emit_signal("brightness::changed")
                end, {description = "change brightness to down", group = "media row"}),
    awful.key({}, "XF86AudioRaiseVolume",
                function ()
                  awful.spawn.with_shell("amixer sset Master 5%+")
                end, {description = "Increase volume", group = "media row"}),
    awful.key({}, "XF86AudioLowerVolume",
                function ()
                  awful.spawn.with_shell("amixer sset Master 5%-")
                end, {description = "Increase volume", group = "media row"}),
    awful.key({}, "XF86AudioMute",
                function ()
                  awful.spawn.with_shell("amixer sset Master toggle")
                end, {description = "toggle mute volume", group = "media row"}),
    awful.key({ mod.super,           }, "Tab",
        function ()
            switcher.switch(1,"Mod4","Super_L","Shift","Tab")
        end,
        {description = "go back", group = "floating"}),
    awful.key {
        modifiers   = { mod.super },
        keygroup    = "numrow",
        description = "only view tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                tag:view_only()
            end
        end,
    },
    awful.key {
        modifiers = { mod.super, mod.shift },
        keygroup    = "numrow",
        description = "move focused client to tag",
        group       = "tag",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end,
    },
    awful.key({ mod.super, mod.ctrl }, "n",
                 function ()
                     local c = awful.client.restore()
                     -- Focus restored client
                     if c then
                       c:activate { raise = true, context = "key.unminimize" }
                     end
                 end,  {description = "restore minimized", group = "client"}),
}
return global_keys

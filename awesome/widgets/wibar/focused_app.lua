local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local common = require("widgets.wibar.common")

local focused_app_icon = common.create_icon_widget(beautiful.focused_app_icon)

local connect_focused_app = function(s)
  local task_list_widget = awful.widget.tasklist {
    screen = s,
    filter = awful.widget.tasklist.filter.focused,
    widget_template = {
      {
        {
          id = 'clienticon',
          widget = awful.widget.clienticon,
        },
        {
          id = 'client_text',
          widget = wibox.widget.textbox,
        },
        layout = wibox.layout.fixed.horizontal,
        spacing = 5
      },
      create_callback = function(self, c, index, objects)
        local clienticon = self:get_children_by_id('clienticon')[1]
        if clienticon then
          clienticon.client = c
        end
        local client_text = self:get_children_by_id('client_text')[1]
        if client_text then
          client_text.text = c.class -- Display client name or any other property
        end
      end,
      layout = wibox.layout.align.horizontal,
    }
  }
  local stylized_icon_widget = common.create_stylized_box("bg",focused_app_icon)
  local stylized_tasklist_widget = common.create_stylized_box("bg",task_list_widget)
  local widget_wrapper = common.create_widgets_wrapper(stylized_icon_widget,stylized_tasklist_widget)
  return widget_wrapper
end

return connect_focused_app

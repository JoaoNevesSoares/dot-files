local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local workspaces_buttons = require("bindings.global.mouse").workspaces_buttons
local common = require("widgets.wibar.common")

local defaults = common.defaults

local tag_icons = {
  {bg = beautiful.tag_1, fg = beautiful.tag_1_selected},
  {bg = beautiful.tag_2, fg = beautiful.tag_2_selected},
  {bg = beautiful.tag_3, fg = beautiful.tag_3_selected},
  {bg = beautiful.tag_4, fg = beautiful.tag_4_selected}
}

local function get_tag_icon(color, tagindex)
  local icon = tag_icons[tagindex] or tag_icons[#tag_icons]
  return (color == "bg") and icon.bg or icon.fg
end

local function create_tasklist_widget(s, tagindex)
  return awful.widget.tasklist {
    screen = s,
    filter = function(c)
        local target_tag = c.screen.tags[tagindex]
        return target_tag and c.first_tag == target_tag
    end,
    widget_template = {
      {
        id = "clienticon",
        widget = awful.widget.clienticon,
      },
      create_callback = function(self, c, index,objects)
        local clienticon = self:get_children_by_id("clienticon")[1]
        if clienticon then
            clienticon.client = c
        end
      end,
      layout = wibox.layout.align.horizontal,
    }
  }
end

local workspaces_icon_widget = common.create_icon_widget(beautiful.workspaces_icon)
local stylized_icon = common.create_stylized_box("bg",workspaces_icon_widget)

local connect_workspace = function(s)
  local workspaces = awful.widget.taglist {
    screen = s,
    filter = awful.widget.taglist.filter.all,
    buttons = workspaces_buttons,
    widget_template = {
      {
        {
          {
            top = 2,
            left = 2,
            {
              id = "widget_icon",
              resize = false,
              valign = 'center',
              widget = wibox.widget.imagebox
            },
            widget = wibox.container.margin
          },
          id = "widget_layout",
          spacing = defaults.spacing+5,
          layout = wibox.layout.fixed.horizontal
        },
        id = "background_container",
        bg = defaults.bg_normal,
        fg = defaults.bg_focus,
        shape = defaults.inner_shape,
        widget = wibox.container.background
      },
      top = defaults.margin,
      bottom = defaults.margin,
      left = defaults.margin,
      right = defaults.margin,
      widget = wibox.container.margin,
      create_callback = function(self,c,index,objects)
        local layout = self:get_children_by_id('widget_layout')[1]
        layout:add(create_tasklist_widget(s, index))
        self:get_children_by_id('widget_icon')[1].image = get_tag_icon("bg",index)
      end,
      update_callback = function(self,t,index,objects)
        local bg_container = self:get_children_by_id('background_container')[1]
        local icon_widget = self:get_children_by_id('widget_icon')[1]
        if t.selected then
          icon_widget.image = get_tag_icon("fg",index)
          bg_container.bg = defaults.bg_focus
          bg_container.fg = defaults.bg_normal
        else
          icon_widget.image = get_tag_icon("bg",index)
          bg_container.bg = beautiful.tasklist_bg_unfocus
          bg_container.fg = beautiful.tasklist_fg_unfocus
          bg_container.shape = defaults.inner_shape
        end
      end,
    }
  }
  return common.create_widgets_wrapper(stylized_icon,workspaces)
end

return connect_workspace

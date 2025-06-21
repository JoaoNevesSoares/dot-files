local beautiful = require("beautiful")
local wibox     = require("wibox")
local gears     = require("gears")

local defaults = {
    bg_normal      = beautiful.bg_normal or "#222222",
    bg_focus       = beautiful.bg_focus or "#535d6c",
    fg_normal      = beautiful.fg_normal or "#ffffff",
    fg_focus       = beautiful.fg_focus or "#ffcc00",
    border_color   = beautiful.border_color_active or "#ffcc00",

    spacing        = 2,  -- General spacing for widget layouts
    inner_padding  = 0,   -- Padding inside widgets
    margin         = 3,
    border_width   = 2,   -- Border width for styled containers
    inner_shape    = function(cr, w, h) return gears.shape.rounded_rect(cr, w, h, 4) end,
    outer_shape    = function(cr, w, h) return gears.shape.rounded_rect(cr, w, h, 6) end,
}
local function create_stylized_box(color_mode, ...)
  local bg, fg
  if color_mode == "fg" then
    bg = defaults.bg_focus
    fg = defaults.bg_normal
  else
    bg = defaults.bg_normal
    fg = defaults.bg_focus
  end
  local box_template = {
    {
      {
        {
          id = "widget_layout",
          spacing = defaults.spacing,
          layout = wibox.layout.fixed.horizontal
        },
        left = defaults.margin,
        right = defaults.margin,
        top = 0,
        bottom = 0,
        widget = wibox.container.margin
      },
      id = "background_container",
      bg = bg,
      fg = fg,
      shape = defaults.inner_shape,
      widget = wibox.container.background
    },
    top = defaults.margin,
    bottom = defaults.margin,
    widget = wibox.container.margin
  }
  local stylized_widget = wibox.widget(box_template)
  stylized_widget:get_children_by_id("widget_layout")[1]:add(...)
  return stylized_widget
end

local function create_icon_widget(icon_image)
  local icon_widget = wibox.widget {
    id = "widget_icon",
    image = icon_image,
    resize = true,
    widget = wibox.widget.imagebox
  }
  return icon_widget
end
local function create_widgets_wrapper(...)
  local template = {
    {
      {
        {
          id = "place_widgets",
          spacing = defaults.spacing,
          layout = wibox.layout.fixed.horizontal
        },
        left = defaults.margin,
        right = defaults.margin,
        widget = wibox.container.margin
      },
      bg = beautiful.bg_normal,
      fg = beautiful.bg_focus,
      shape_border_width = defaults.border_width,
      shape_border_color = defaults.border_color,
      shape = defaults.outer_shape,
      widget = wibox.container.background
    },
    top = 2,
    widget = wibox.container.margin
  }
  local widget_container = wibox.widget(template)
  widget_container:get_children_by_id("place_widgets")[1]:add(...)
  return widget_container
end

local M = {}
M.defaults = defaults
M.create_stylized_box = create_stylized_box
M.create_icon_widget = create_icon_widget
M.create_widgets_wrapper = create_widgets_wrapper

return M

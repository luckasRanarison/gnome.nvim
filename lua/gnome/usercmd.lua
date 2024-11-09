local M = {}

local color = require("gnome.color")
local notify = require("gnome.notify")
local config = require("gnome.config")

M.pick_color = function(params)
  local format = params.fargs[1] or config.options.color_dialog.default_format

  if not color.is_valid_format(format) then
    local formats = table.concat(color.formats, ", ")
    return notify.error("Invalid color format '", format, "' (supported: ", formats, ")")
  end

  local color_res = color.open_dialog()

  if color_res then
    local color_str = color.format(color_res, format)
    vim.api.nvim_put({ color_str }, "v", true, true)
  end
end

return M

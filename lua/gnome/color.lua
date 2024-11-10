local M = {}

local utils = require("gnome.utils")
local config = require("gnome.config")

---@class Color
---@field red number
---@field green number
---@field blue number
---@field alpha number

---@alias ColorFormat
---| "rgb"
---| "rgba"
---| "hex"
---| "HEX"
---| "hexa"
---| "HEXA"

M.formats = {
  "rgb",
  "rgba",
  "hex",
  "HEX",
  "hexa",
  "HEXA",
}

---@param format string
M.is_valid_format = function(format) return vim.tbl_contains(M.formats, format) end

---@param color Color
---@param format ColorFormat
M.format = function(color, format)
  local r, g, b, a = color.red, color.green, color.green, color.alpha

  if format == "rgb" then return string.format("rgb(%d, %d, %d)", r, g, b) end
  if format == "rgba" then return string.format("rgba(%d, %d, %d, %d)", r, g, b, a) end
  if format == "hex" then return string.format("#%02x%02x%02x", r, g, b) end
  if format == "HEX" then return string.format("#%02X%02X%02X", r, g, b) end
  if format == "hexa" then return string.format("#%02x%02x%02x%02x", r, g, b, a) end
  if format == "HEXA" then return string.format("#%02X%02X%02X%02x", r, g, b, a) end
end

---@return Color?
M.open_dialog = function()
  local script = "color-dialog-gtk" .. config.options.gtk_version:sub(2) .. ".js"
  local output = utils.spawn_gjs_script(script)

  if output ~= "" then return vim.json.decode(output) end
end

return M

local M = {}

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
  local lua_script_path = debug.getinfo(1, "S").source:sub(2)
  local lua_script_dir = vim.fn.fnamemodify(lua_script_path, ":p:h")
  local gjs_script_path = lua_script_dir .. "/../../gjs/color-dialog-gtk3.js"
  local cmd = string.format("gjs %s", gjs_script_path)
  local output = vim.fn.system(cmd)

  if output ~= "" then return vim.json.decode(output) end
end

return M

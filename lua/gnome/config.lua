local M = {}

---@class Gnome.Option
M.options = {
  color_dialog = {
    ---@type "v3" | "v4"
    gtk = "v4",
    ---@type ColorFormat
    default_format = "hex",
  },
}

return M

local M = {}

---@class GnomeUI.Option
M.options = {
  color_dialog = {
    -- TODO: add support for Gtk4
    ---@type "v3"
    gtk = "v3",
    ---@type ColorFormat
    default_format = "hex",
  },
}

return M

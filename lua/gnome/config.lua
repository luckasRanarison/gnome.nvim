local M = {}

---@class Gnome.Option
M.options = {
  ---@type "v3" | "v4"
  gtk_version = "v4",
  override_notify = true,
  color_dialog = {
    ---@type ColorFormat
    default_format = "hex",
  },
}

return M

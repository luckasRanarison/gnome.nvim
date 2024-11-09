local M = {}

local config = require("gnome.config")
local usercmd = require("gnome.usercmd")

vim.api.nvim_create_user_command("GnomeColor", usercmd.pick_color, { nargs = "?" })

---@param options GnomeUI.Option
M.setup = function(options)
  config.options = vim.tbl_deep_extend("keep", options or {}, config.options)
end

return M

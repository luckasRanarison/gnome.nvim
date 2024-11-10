local M = {}

local config = require("gnome.config")
local usercmd = require("gnome.usercmd")
local notify = require("gnome.notify")

vim.api.nvim_create_user_command("GnomeColor", usercmd.pick_color, { nargs = "?" })

---@param options Gnome.Option
M.setup = function(options)
  config.options = vim.tbl_deep_extend("keep", options or {}, config.options)

  if config.options.override_notify then
    notify.set_notify_hook()
    -- notify.debug("vim.notify() was overriden by gnome.nvim")
  end
end

return M

local utils = require("gnome.utils")
local M = {}

---@return fun(...: string)
local notify_fn = function(level)
  return function(...) vim.notify("[gnome.nvim] " .. table.concat({ ... }), level) end
end

M.debug = notify_fn(vim.log.levels.DEBUG)
M.info = notify_fn(vim.log.levels.INFO)
M.warn = notify_fn(vim.log.levels.WARN)
M.error = notify_fn(vim.log.levels.ERROR)

M.set_notify_hook = function()
  ---@diagnostic disable-next-line: duplicate-set-field
  vim.notify = function(msg, level, _)
    local level_str = level and tostring(level) or "2"
    utils.spawn_gjs_script("notification.js", { level_str, '"' .. msg .. '"' })
  end
end

return M

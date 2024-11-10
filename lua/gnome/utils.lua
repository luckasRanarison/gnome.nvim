local M = {}

M.get_gjs_dir = function()
  local lua_script_path = debug.getinfo(1, "S").source:sub(2)
  local lua_script_dir = vim.fn.fnamemodify(lua_script_path, ":p:h")

  return lua_script_dir .. "/../../gjs"
end

return M

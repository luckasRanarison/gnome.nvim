local M = {}

---@param script string
---@param args string[]?
M.spawn_gjs_script = function(script, args)
  local lua_script_path = debug.getinfo(1, "S").source:sub(2)
  local lua_script_dir = vim.fn.fnamemodify(lua_script_path, ":p:h")

  local gjs_dir = lua_script_dir .. "/../../gjs/"
  local gjs_script_path = gjs_dir .. script

  local args_str = table.concat(args or {}, " ")
  local cmd = { "gjs", "-I", gjs_dir, gjs_script_path, args_str, "2>/dev/null" }
  local output = vim.fn.system(table.concat(cmd, " "))

  return output
end

---@param suggestions string[]
M.make_completion = function(suggestions)
  return function(arg_lead)
    local filtered = vim.tbl_filter(
      function(entry) return vim.startswith(entry, arg_lead) end,
      suggestions
    )
    return filtered
  end
end

return M

local M = {}

M.get_gjs_dir = function()
  local lua_script_path = debug.getinfo(1, "S").source:sub(2)
  local lua_script_dir = vim.fn.fnamemodify(lua_script_path, ":p:h")

  return lua_script_dir .. "/../../gjs"
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

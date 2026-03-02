---@param child table The table that should extend the parent
---@param parent table The extended parent table
---@return table child The child table with its __index modified
local function inherit(child, parent)
  child.__index = function(tbl, key)
    local own = rawget(tbl, key)
    if own ~= nil then return own end
    return parent[key]
  end
  return child
end

return { inherit = inherit }

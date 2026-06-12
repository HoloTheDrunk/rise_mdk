---@class Transform
---@field public _remo TransformRemo
local Transform = {}
Transform.__index = Transform

---@param value integer | REManagedObject | userdata
---@return Transform
function Transform.new(value)
  return setmetatable({
    _remo = sdk.to_managed_object(value) --[[@as TransformRemo]]
  }, Transform) --[[@as Transform]]
end

function Transform:get_children()
  local children = {}
  local child = self._remo:call("get_Child")
  while child do
    table.insert(children, child)
    child = child:call("get_Next")
  end
  return children[1] and children
end

return Transform

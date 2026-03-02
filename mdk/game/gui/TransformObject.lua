local oop = require("mdk.utils.oop")
local PlayObject = require("mdk.game.gui.PlayObject")

---@class TransformObject : PlayObject
---@field _remo TransformObjectRemo
local TransformObject = oop.inherit({}, PlayObject)

---@param value integer|TransformObjectRemo|userdata
---@return TransformObject
function TransformObject.new(value)
  return setmetatable({
    _remo = sdk.to_managed_object(value),
  }, TransformObject) --[[@as TransformObject]]
end

---@return PlayObject
function TransformObject:get_child()
  return PlayObject.new(self._remo:call("get_Child"))
end

return TransformObject

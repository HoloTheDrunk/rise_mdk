local Joint = require("mdk.game.Joint")

---@class JointList
---@field public _remo JointListRemo
local JointList = {}
JointList.__index = JointList

---@param value integer | REManagedObject | userdata
---@return JointList
function JointList.new(value)
  return setmetatable({
    _remo = sdk.to_managed_object(value) --[[@as JointListRemo]],
  }, JointList) --[[@as JointList]]
end

---@return integer
function JointList:get_count()
  return self._remo:call("get_Count")
end

---@param index number
---@return Joint | nil
function JointList:get_joint(index)
  local res = self._remo:call("get_Item", index)
  if not res then
    return nil
  end
  return Joint.new(res)
end

return JointList

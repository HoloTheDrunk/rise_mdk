local JointList = require("mdk.game.JointList")

---@class HitInfo
---@field public _remo HitInfoRemo Reference to the engine-side object.
local HitInfo = {}
HitInfo.__index = HitInfo --[[@as function]]

---@return HitInfo
function HitInfo.new(value)
  return setmetatable({
    _remo = sdk.to_managed_object(value) --[[@as HitInfoRemo]]
  }, HitInfo) --[[@as HitInfo]]
end

---@return Vector3f
function HitInfo:get_world_position()
  return self._remo:call("get_Position")
end

---@return JointList?
function HitInfo:get_joint_list()
  local remo = self._remo:call("get_DamageShapeFollowJoints")
  if not remo then return nil end
  return JointList.new(remo)
end

---@return { pos: Vector3f, joint: Joint | nil }
function HitInfo:get_detailed_position()
  local hit_pos = self:get_world_position()

  local joints = self:get_joint_list()
  if joints and joints:get_count() > 0 then
    local joint = joints:get_joint(0)
    if joint and joint:is_valid() then
      return {
        pos = joint:world_to_local(hit_pos),
        joint = joint
      }
    end
  end

  return {
    pos = hit_pos,
    joint = nil
  }
end

return HitInfo

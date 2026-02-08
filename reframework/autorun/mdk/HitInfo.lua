local JointList = require("JointList")

---@class HitInfo
---@field private _remo HitInfoRemo Reference to the engine-side object.
local HitInfo = {}
HitInfo.__index = HitInfo --[[@as function]]

---@return HitInfo
function HitInfo.new(value)
  ---@type HitInfo
  local res = {
    _remo = sdk.to_managed_object(value) --[[@as HitInfoRemo]]
  }
  setmetatable(res, HitInfo)
  return res
end

---@return number
function HitInfo:get_physical_damage()
  return self._remo:call("get_PhysicalDamage")
end

---@param value number
---@return nil
function HitInfo:set_physical_damage(value)
  self._remo:call("set_PhysicalDamage", value)
end

---@return number
function HitInfo:get_elemental_damage()
  return self._remo:call("get_ElementDamage")
end

---@param value number
---@return nil
function HitInfo:set_elemental_damage(value)
  self._remo:call("set_ElementDamage", value)
end

---@return number
function HitInfo:get_part_break_damage()
  return self._remo:call("get_PhysicalPartsBreakVitalDamage")
end

---@param value number
---@return nil
function HitInfo:set_part_break_damage(value)
  self._remo:call("set_PhysicalPartsBreakVitalDamage", value)
end

---@return integer
function HitInfo:get_attacker_id()
  return self._remo:call("get_AttackerID")
end

---    0: player
---other: idk
---@return integer
function HitInfo:get_attacker_type()
  return self._remo:call("get_DamageAttackerType")
end

---@return Vector3f
function HitInfo:get_world_position()
  return self._remo:call("get_Position")
end

---@return JointList
function HitInfo:get_joint_list()
  return JointList.new(self._remo:call("get_DamageShapeFollowJoints"))
end

---@return { pos: Vector3f, joint: unknown | nil }
function HitInfo:get_detailed_position()
  local hit_pos = self:get_world_position()

  local joints = self:get_joint_list()
  if joints:get_count() > 0 then
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

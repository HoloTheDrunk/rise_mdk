---@class DamageInfo
---@field public _remo DamageInfoRemo Reference to the engine-side object.
local DamageInfo = {}
DamageInfo.__index = DamageInfo --[[@as function]]

---@return DamageInfo
function DamageInfo.new(value)
  ---@type DamageInfo
  local res = {
    _remo = sdk.to_managed_object(value) --[[@as DamageInfoRemo]]
  }
  setmetatable(res, DamageInfo)
  return res
end

---@return number
function DamageInfo:get_physical_damage()
  return self._remo:call("get_PhysicalDamage")
end

---@param value number
---@return nil
function DamageInfo:set_physical_damage(value)
  self._remo:call("set_PhysicalDamage", value)
end

---@return number
function DamageInfo:get_elemental_damage()
  return self._remo:call("get_ElementDamage")
end

---@param value number
---@return nil
function DamageInfo:set_elemental_damage(value)
  self._remo:call("set_ElementDamage", value)
end

---@return number
function DamageInfo:get_part_break_damage()
  return self._remo:call("get_PhysicalPartsBreakVitalDamage")
end

---@param value number
---@return nil
function DamageInfo:set_part_break_damage(value)
  self._remo:call("set_PhysicalPartsBreakVitalDamage", value)
end

---@return integer
function DamageInfo:get_attacker_id()
  return self._remo:call("get_AttackerID")
end

---    0: player
---other: idk
---@return DamageAttackerType
function DamageInfo:get_attacker_type()
  return self._remo:call("get_DamageAttackerType")
end

return DamageInfo

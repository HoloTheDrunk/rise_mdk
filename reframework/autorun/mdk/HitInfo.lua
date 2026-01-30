---@module "HitInfoRemo.d.lua"

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

return HitInfo

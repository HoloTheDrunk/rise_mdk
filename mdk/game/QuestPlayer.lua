---@class QuestPlayer
---@field public _remo QuestPlayerRemo
local QuestPlayer = {}
QuestPlayer.__index = QuestPlayer

---@param value integer | REManagedObject | userdata
---@return QuestPlayer
function QuestPlayer.new(value)
  return setmetatable({
    _remo = sdk.to_managed_object(value) --[[@as QuestPlayerRemo]]
  }, QuestPlayer) --[[@as QuestPlayer]]
end

---@return integer
function QuestPlayer:get_index()
  return self._remo:get_field("_PlayerIndex")
end

---Creates a damaging explosive shell at the given position, but
---importantly does not return a reference to it. If you want to modify the
---damage values, you'll want to intercept it afterwards, for example in the
---monster-side damage calculation, as shells have a [DamageAttackerType] of
---"invalid".
---@param pos Vector3f
---@return nil
function QuestPlayer:create_damaging_shell(pos)
  self._remo:call("setEquipSkill223Shell", pos)
end

return QuestPlayer

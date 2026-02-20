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

return QuestPlayer

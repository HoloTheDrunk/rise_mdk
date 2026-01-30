---@class QuestPlayer
---@field public _remo REManagedObject
local QuestPlayer = {}
QuestPlayer.__index = QuestPlayer

---@return QuestPlayer
function QuestPlayer.new(value)
  ---@type QuestPlayer
  local res = {
    _remo = sdk.to_managed_object(value) --[[@as REManagedObject]]
  }
  setmetatable(res, QuestPlayer)
  return res
end

return QuestPlayer

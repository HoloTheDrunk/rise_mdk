---@class QuestPlayer
---@field public _remo QuestPlayerRemo
local QuestPlayer = {}
QuestPlayer.__index = QuestPlayer

---@return QuestPlayer
function QuestPlayer.new(value)
  ---@type QuestPlayer
  local res = {
    _remo = sdk.to_managed_object(value) --[[@as QuestPlayerRemo]]
  }
  setmetatable(res, QuestPlayer)
  return res
end

function QuestPlayer:get_index()
  return self._remo:get_field("_PlayerIndex")
end

return QuestPlayer

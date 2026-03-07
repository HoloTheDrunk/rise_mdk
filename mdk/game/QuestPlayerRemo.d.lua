---@meta

---@class QuestPlayerRemo : REManagedObject
---Corresponds to [snow.player.PlayerQuestBase]
QuestPlayerRemo = {}

---@param method string Name of the function
---@param ... unknown Any arguments to be passed to the function
---@return unknown
---@overload fun(self, method: "get_PlayerData"): PlayerDataRemo
function PlayerDataRemo:call(method, ...) end

---@param field string
---@return unknown
---@overload fun(self, field: "_PlayerIndex"): integer
function QuestPlayerRemo:get_field(field) end

---@meta

---@class LobbyManagerRemo : REManagedObject
LobbyManagerRemo = {}

---@param method string Name of the function
---@param ... unknown Any arguments to be passed to the function
---@return unknown
---@overload fun(self, method: "IsQuestOnline"): boolean
function LobbyManagerRemo:call(method, ...) end

---@param field string Name of the field
---@return unknown
---@overload fun(self, field: "_myselfQuestIndex"): integer
function LobbyManagerRemo:get_field(field) end

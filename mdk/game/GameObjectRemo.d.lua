---@meta

---@class GameObjectRemo : REManagedObject
---Corresponds to [via.GameObject].
GameObjectRemo = {}

---@param method string Name of the function
---@param ... unknown Any arguments to be passed to the function
---@return unknown
---@overload fun(self, method: "getComponent(System.Type)", type: REManagedObject): ComponentRemo
function GameObjectRemo:call(method, ...) end

---@param field string Name of the field
---@return unknown
function GameObjectRemo:get_field(field) end

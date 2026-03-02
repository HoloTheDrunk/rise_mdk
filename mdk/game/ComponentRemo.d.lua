---@meta

---@class ComponentRemo : REManagedObject
---Corresponds to [via.Component].
ComponentRemo = {}

---@param method string Name of the function
---@param ... unknown Any arguments to be passed to the function
---@return unknown
---@overload fun(self, field: "get_GameObject"): GameObjectRemo
function ComponentRemo:call(method, ...) end

---@param field string Name of the field
---@return unknown
function ComponentRemo:get_field(field) end

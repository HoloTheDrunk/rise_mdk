---@meta

---@class WeaponHudRemo : REManagedObject
---Corresponds to [TODO:fillthisin].
WeaponHudRemo = {}

---@param method string Name of the function
---@param ... unknown Any arguments to be passed to the function
---@return unknown
---@overload fun(self, method: "getComponent(System.Type)", type: REManagedObject): ComponentRemo
function WeaponHudRemo:call(method, ...) end

---@param field string Name of the field
---@return unknown
function WeaponHudRemo:get_field(field) end

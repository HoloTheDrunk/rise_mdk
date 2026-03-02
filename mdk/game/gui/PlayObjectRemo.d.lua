---@meta

---@class PlayObjectRemo : REManagedObject
---Corresponds to [via.gui.PlayObject].
PlayObjectRemo = {}

---@param name string
---@param ... unknown
---@return unknown
---@overload fun(self, name: "get_Next"): PlayObjectRemo
function PlayObjectRemo:call(name, ...) end

---@param field string Name of the field
---@return unknown
function PlayObjectRemo:get_field(field) end

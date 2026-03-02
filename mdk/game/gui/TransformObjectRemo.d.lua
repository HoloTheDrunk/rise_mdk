---@meta

---@class TransformObjectRemo : PlayObjectRemo
---Corresponds to [via.gui.TransformObject].
TransformObjectRemo = {}

---@param name string
---@param ... unknown
---@return unknown
---@overload fun(self, name: "get_Next"): PlayObjectRemo
---@overload fun(self, name: "get_Child"): PlayObjectRemo
function TransformObjectRemo:call(name, ...) end

---@param field string Name of the field
---@return unknown
function TransformObjectRemo:get_field(field) end

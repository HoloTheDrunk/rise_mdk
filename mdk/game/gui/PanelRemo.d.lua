---@meta

---@class PanelRemo : TransformObjectRemo
---Corresponds to [via.gui.Panel].
PanelRemo = {}

---@param name string
---@param ... unknown
---@return unknown
---@overload fun(self, name: "get_Next"): PlayObjectRemo
---@overload fun(self, name: "get_Child"): PlayObjectRemo
function PanelRemo:call(name, ...) end

---@param field string Name of the field
---@return unknown
function PanelRemo:get_field(field) end

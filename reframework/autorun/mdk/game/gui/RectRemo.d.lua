---@meta

---@class RectRemo : TransformObjectRemo
---Corresponds to [via.gui.Rect].
RectRemo = {}

---@param name string
---@param ... unknown
---@return unknown
---@overload fun(self, name: "get_Child"): TransformObjectRemo
---@overload fun(self, name: "get_Next"): TransformObjectRemo
---@overload fun(self, name: "set_ControlPoint", anchor: Anchor)
---@overload fun(self, name: "set_Position", position: Vector3f): nil
---@overload fun(self, name: "set_Size", size: Vector3f): nil
function RectRemo:call(name, ...) end

---@param field string Name of the field
---@return unknown
function RectRemo:get_field(field) end

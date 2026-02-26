---@meta

---@class PanelRemo : REManagedObject
PanelRemo = {}

---@param name string
---@param ... unknown
---@return unknown
---@overload fun(self, name: "get_Child"): PanelRemo
---@overload fun(self, name: "get_Next"): PanelRemo
---@overload fun(self, name: "set_ControlPoint", anchor: Anchor)
---@overload fun(self, name: "set_Position", position: Vector3f): nil
---@overload fun(self, name: "set_Size", size: Vector3f): nil
function PanelRemo:call(name, ...) end

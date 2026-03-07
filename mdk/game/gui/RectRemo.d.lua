---@meta

---@class RectRemo : TransformObjectRemo
---Corresponds to [via.gui.Rect].
RectRemo = {}

---@overload fun(self, name: "set_ControlPoint", anchor: Anchor)
---@overload fun(self, name: "set_Position", position: Vector3f): nil
---@overload fun(self, name: "set_Size", size: Vector3f): nil
RectRemo.call = TransformObjectRemo.call

RectRemo.get_field = TransformObjectRemo.get_field

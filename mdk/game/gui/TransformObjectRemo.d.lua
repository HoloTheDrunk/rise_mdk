---@meta

---@class TransformObjectRemo : PlayObjectRemo
---Corresponds to [via.gui.TransformObject].
TransformObjectRemo = {}

---@overload fun(self, name: "get_Child"): PlayObjectRemo
TransformObjectRemo.call = PlayObjectRemo.call

TransformObjectRemo.get_field = PlayObjectRemo.get_field

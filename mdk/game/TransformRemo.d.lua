---@meta

---@class TransformRemo : REManagedObject
---Corresponds to [via.Transform]
TransformRemo = {}

---@param method string Name of the function
---@param ... unknown Any arguments to be passed to the function
---@return unknown
---@overload fun(self, method: "get_Child"): TransformRemo
---@overload fun(self, method: "get_Position"): Vector3f
---@overload fun(self, method: "set_Position", pos: Vector3f): nil
---@overload fun(self, method: "get_LocalPosition"): Vector3f
---@overload fun(self, method: "set_LocalPosition", pos: Vector3f): nil
---@overload fun(self, method: "get_Rotation"): Quaternion
---@overload fun(self, method: "set_Rotation", rot: Quaternion): nil
---@overload fun(self, method: "get_LocalRotation"): Quaternion
---@overload fun(self, method: "set_LocalRotation", rot: Quaternion): nil
---@overload fun(self, method: "get_Scale"): Vector3f
---@overload fun(self, method: "get_LocalScale"): Vector3f
---@overload fun(self, method: "get_LocalScale"): nil
function PlayerDataRemo:call(method, ...) end

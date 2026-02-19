---@meta

---@class JointRemo : REManagedObject
---Corresponds to [via.Joint].
JointRemo = {}

---@param method string Name of the function
---@param ... unknown Any arguments to be passed to the function
---@return unknown
---@overload fun(self, method: "get_Valid"): boolean
---@overload fun(self, method: "get_WorldMatrix"): Matrix4x4f
function JointRemo:call(method, ...) end

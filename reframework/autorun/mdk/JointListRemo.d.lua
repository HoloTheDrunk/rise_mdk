---@meta

---@class JointListRemo : REManagedObject
JointListRemo = {}

---@param method string Name of the function
---@param ... unknown Any arguments to be passed to the function
---@return unknown
---@overload fun(self, method: "get_Count"): integer
---@overload fun(self, method: "get_Item", index: number): JointRemo | nil
function HitInfoRemo:call(method, ...) end

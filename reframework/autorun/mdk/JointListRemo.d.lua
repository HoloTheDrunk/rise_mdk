---@meta

---@class JointListRemo : REManagedObject
---Corresponds to [System.Collections.ObjectModel.ReadOnlyCollection`1<via.Joint>]
JointListRemo = {}

---@param method string Name of the function
---@param ... unknown Any arguments to be passed to the function
---@return unknown
---@overload fun(self, method: "get_Count"): integer
---@overload fun(self, method: "get_Item", index: number): JointRemo | nil
function HitInfoRemo:call(method, ...) end

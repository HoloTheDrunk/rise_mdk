---@meta

---@class HitInfoRemo : REManagedObject
---Corresponds to [snow.DamageReceiver.HitInfo].
HitInfoRemo = {}

---@param method string Name of the function
---@param ... unknown Any arguments to be passed to the function
---@return unknown
---@overload fun(self, method: "get_Position"): Vector3f
---@overload fun(self, method: "get_DamageShapeFollowJoints"): JointListRemo
function HitInfoRemo:call(method, ...) end

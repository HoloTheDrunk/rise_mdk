---@meta

---@class HitInfoRemo : REManagedObject
HitInfoRemo = {}

---@param method string Name of the function
---@param ... unknown Any arguments to be passed to the function
---@return unknown
---@overload fun(self, method: "get_PhysicalDamage"): number
---@overload fun(self, method: "set_PhysicalDamage", value: number): nil
---@overload fun(self, method: "get_ElementDamage"): number
---@overload fun(self, method: "set_ElementDamage", value: number): nil
---@overload fun(self, method: "get_PhysicalPartsBreakVitalDamage"): number
---@overload fun(self, method: "set_PhysicalPartsBreakVitalDamage", value: number): nil
---@overload fun(self, method: "get_AttackerID"): integer
---@overload fun(self, method: "get_AttackerType"): integer
---@overload fun(self, method: "get_Position"): Vector3f
---@overload fun(self, method: "get_DamageShapeFollowJoints"): JointListRemo
function HitInfoRemo:call(method, ...) end

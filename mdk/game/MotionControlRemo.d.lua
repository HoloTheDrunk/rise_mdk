---@meta

---@class MotionControlRemo : REManagedObject
MotionControlRemo = {}

---@param field string
---@return unknown
---@overload fun(self, field: "_OldBankID"): integer
---@overload fun(self, field: "_OldMotionID"): integer
function MotionControlRemo:get_field(field) end

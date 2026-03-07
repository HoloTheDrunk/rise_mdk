---@class MotionControl
---@field _remo MotionControlRemo The engine-side object
local MotionControl = {}
MotionControl.__index = MotionControl

---@param value integer | REManagedObject | userdata
---@return MotionControl
function MotionControl.new(value)
  return setmetatable({
    _remo = sdk.to_managed_object(value) --[[@as MotionControlRemo]]
  }, MotionControl) --[[@as MotionControl]]
end

---@return integer
function MotionControl:get_old_bank_id()
  return self._remo:get_field("_OldBankID")
end

---@return integer
function MotionControl:get_old_motion_id()
  return self._remo:get_field("_OldMotionID")
end

return MotionControl

local oop = require("mdk.utils.oop")
local Component = require("mdk.game.Component")

---@class LongSword : Component
---@field public _remo LongSwordRemo
local LongSword = oop.inherit({}, Component)

---@param value integer | REManagedObject | userdata
---@return LongSword
function LongSword.new(value)
  return setmetatable({
    _remo = sdk.to_managed_object(value) --[[@as LongSwordRemo]]
  }, LongSword) --[[@as LongSword]]
end

---@return integer
function LongSword:get_gauge_level()
  return self._remo:get_field("_LongSwordGaugeLv")
end

---@param level integer
---@return nil
function LongSword:set_gauge_level(level)
  self._remo:set_field("_LongSwordGaugeLv", level)
end

return LongSword

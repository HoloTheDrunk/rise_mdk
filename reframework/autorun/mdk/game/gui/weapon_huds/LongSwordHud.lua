local oop          = require("mdk.utils.oop")
local Component    = require("mdk.game.Component")
local Panel        = require("mdk.game.gui.Panel")
local Rect         = require("mdk.game.gui.Rect")

---@class LongSwordHud : Component
---@field _remo LongSwordHudRemo
local LongSwordHud = oop.inherit({}, Component)

---@param value integer | LongSwordHudRemo | userdata
---@return LongSwordHud
function LongSwordHud.new(value)
  return setmetatable({
    _remo = sdk.to_managed_object(value),
  }, LongSwordHud) --[[@as LongSwordHud]]
end

---@return Panel
function LongSwordHud:get_main_panel()
  return Panel.new(self._remo:get_field("_pnl_L_Swd"))
end

---@return Panel
function LongSwordHud:get_out_effect_panel()
  return Panel.new(self._remo:get_field("_Ls_OutEffectPanel"))
end

---@return Panel
function LongSwordHud:get_in_gauge_panel()
  return Panel.new(self._remo:get_field("_Ls_InGaugePanel"))
end

---@return Rect
function LongSwordHud:get_in_gauge_rect()
  return Rect.new(self._remo:get_field("_Ls_InGaugeRect"))
end

---@return Panel
function LongSwordHud:get_out_gauge_panel()
  return Panel.new(self._remo:get_field("_Ls_OutGaugePanel"))
end

---@return Rect
function LongSwordHud:get_out_gauge_rect()
  return Rect.new(self._remo:get_field("_Ls_OutGaugeRect"))
end

---@return number
function LongSwordHud:in_gauge_max_size_x()
  return self._remo:get_field("InGaugeMaxSizeX")
end

---@return number
function LongSwordHud:out_gauge_max_size_x()
  return self._remo:get_field("OutGaugeMaxSizeX")
end

return LongSwordHud

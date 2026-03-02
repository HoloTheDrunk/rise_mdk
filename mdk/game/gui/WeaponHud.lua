local GameObject     = require("mdk.game.GameObject")
local oop            = require("mdk.utils.oop")

---@alias WeaponHudType REManagedObject

---@enum WeaponHudTypes
local WeaponHudTypes = {
  long_sword = sdk.find_type_definition("snow.gui.GuiHud_Weapon_L_Swd"):get_runtime_type() --[[@as REManagedObject]],
  insect_glaive = sdk.find_type_definition("snow.gui.GuiHud_Weapon_I_Glaive"):get_runtime_type() --[[@as REManagedObject]],
  bow = sdk.find_type_definition("snow.gui.GuiHud_Weapon_Bow"):get_runtime_type() --[[@as REManagedObject]],
  bowgun = sdk.find_type_definition("snow.gui.GuiHud_Weapon_Bowgun"):get_runtime_type() --[[@as REManagedObject]],
  charge_blade = sdk.find_type_definition("snow.gui.GuiHud_Weapon_C_Axe"):get_runtime_type() --[[@as REManagedObject]],
  dual_blades = sdk.find_type_definition("snow.gui.GuiHud_Weapon_D_Bld"):get_runtime_type() --[[@as REManagedObject]],
  gunlance = sdk.find_type_definition("snow.gui.GuiHud_Weapon_G_Lan"):get_runtime_type() --[[@as REManagedObject]],
  hammer = sdk.find_type_definition("snow.gui.GuiHud_Weapon_Ham"):get_runtime_type() --[[@as REManagedObject]],
  hunting_horn = sdk.find_type_definition("snow.gui.GuiHud_Weapon_Horn"):get_runtime_type() --[[@as REManagedObject]],
  switch_axe = sdk.find_type_definition("snow.gui.GuiHud_Weapon_S_Axe"):get_runtime_type() --[[@as REManagedObject]],
}

---@class WeaponHud : GameObject
---@field _remo WeaponHudRemo
local WeaponHud      = oop.inherit({}, GameObject)

---@param value integer | WeaponHudRemo | userdata
---@return WeaponHud
function WeaponHud.new(value)
  return setmetatable({
    _remo = sdk.to_managed_object(value),
  }, WeaponHud) --[[@as WeaponHud]]
end

---@param weapon_hud_type WeaponHudTypes
---@return Component
function WeaponHud:get_unique_weapon_ui(weapon_hud_type)
  return self:get_component(weapon_hud_type)
end

return { WeaponHudTypes, WeaponHud }

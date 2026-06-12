local Component = require("mdk.game.Component")
local LongSword = require("mdk.game.weapons.LongSword")

---@class QuestPlayer
---@field public _remo QuestPlayerRemo
local QuestPlayer = {}
QuestPlayer.__index = QuestPlayer

---@param value integer | REManagedObject | userdata
---@return QuestPlayer
function QuestPlayer.new(value)
  return setmetatable({
    _remo = sdk.to_managed_object(value) --[[@as QuestPlayerRemo]]
  }, QuestPlayer) --[[@as QuestPlayer]]
end

---@return integer
function QuestPlayer:get_index()
  return self._remo:get_field("_PlayerIndex")
end

---Creates a damaging explosive shell at the given position, but
---importantly does not return a reference to it. If you want to modify the
---damage values, you'll want to intercept it afterwards, for example in the
---monster-side damage calculation, as shells have a [DamageAttackerType] of
---"invalid".
---@param pos Vector3f
---@return nil
function QuestPlayer:create_damaging_shell(pos)
  self._remo:call("setEquipSkill223Shell", pos)
end

---@return BehaviorTree
function QuestPlayer:get_behavior_tree()
  return self._remo
      :call("get_GameObject")
      :call("getComponent(System.Type)", sdk.typeof("via.behaviortree.BehaviorTree"))
end

---@param speed number
function QuestPlayer:set_animation_speed(speed)
  self._remo
      :call("get_MotLayer0Speed")
      :call("setSpeed", 0, speed)
end

---@enum (key) WeaponType
---@diagnostic disable-next-line: unused-local
local weapon_external_name = {
  great_sword = 0,
  long_sword = 1,
  sword_and_shield = 2,
  dual_blades = 3,
  lance = 4,
  gunlance = 5,
  hammer = 6,
  hunting_horn = 7,
  switch_axe = 8,
  charge_blade = 9,
  insect_glaive = 10,
  light_bowgun = 11,
  heavy_bowgun = 12,
  bow = 13
}

local weapon_internal_name = {
  great_sword = "GreatSword",
  long_sword = "LongSword",
  sword_and_shield = "ShortSword",
  dual_blades = "DualBlades",
  lance = "Lance",
  gunlance = "GunLance",
  hammer = "Hammer",
  hunting_horn = "Horn",
  switch_axe = "SlashAxe",
  charge_blade = "ChargeAxe",
  insect_glaive = "InsectGlaive",
  light_bowgun = "LightBowgun",
  heavy_bowgun = "HeavyBowgun",
  bow = "Bow",
}

---@param weapon WeaponType
---@return Component?
function QuestPlayer:get_weapon(weapon)
  local go = self._remo:call("get_GameObject")
  local name = "snow.player." .. weapon_internal_name[weapon]
  local wp = go:call("getComponent(System.Type)", sdk.typeof(name))
  if wp then
    return Component.new(wp)
  end
  return nil
end

---@return LongSword?
function QuestPlayer:get_long_sword()
  local go = self._remo:call("get_GameObject")
  local wp = go:call("getComponent(System.Type)", sdk.typeof("snow.player.LongSword"))
  if wp then
    return LongSword.new(wp)
  end
  return nil
end

return QuestPlayer

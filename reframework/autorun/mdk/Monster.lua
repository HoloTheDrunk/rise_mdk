---@class Monster
---@field protected _remo MonsterRemo Reference to the engine-side object.
---@field protected _cache table<string, unknown> Cache for reference properties. Saves engine look-ups.
---@field private __index function Used by setting Monster as metatable of Monster instances.
local Monster = {}
Monster.__index = Monster --[[@as function]]

---@return Monster
function Monster.new(value)
  ---@type Monster
  local res = {
    _remo = sdk.to_managed_object(value) --[[@as MonsterRemo]],
    _cache = {},
    __index = nil,
  }
  setmetatable(res, Monster)
  return res
end

---@return REManagedObject
function Monster:getDamageField()
  local cached = self._cache["<DamageParam>k__BackingField"];
  if (cached == nil) then
    cached = self._remo:get_field("<DamageParam>k__BackingField");
    self._cache["<DamageParam>k__BackingField"] = cached
  end
  return cached
end

function Monster:getPartsDamageInfo()
  local damage_field = self:getDamageField()
  return damage_field:get_field("_EnemyPartsDamageInfo"):call("get_PartsInfo"):get_elements()
end

return Monster

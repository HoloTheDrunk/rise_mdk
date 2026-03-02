---@enum DamageAttackerType
local types = {
  player_weapon = 0,
  barrel_bomb_large = 1,
  trapbugs = 2,
  ---Likely nitrotoad
  nitro = 3,
  ---Not super sure about this one, probably hellfire_explosion?
  onibi_mine = 4,
  ballista_hate = 5,
  capture_smoke_bomb = 6,
  capture_bullet = 7,
  barrel_bomb_small = 8,
  kunai = 9,
  water_beetle = 10,
  detonation_grenade = 11,
  kabutowari = 12,
  flash_bomb = 13,
  emplacement_057_ballista_one_shot_binder = 15,
  emplacement_057_cannon_kantsu = 16,
  rampage_ballista = 16,
  rampage_cannon = 17,
  rampage_gatling = 18,
  rampage_trap = 19,
  rampage_npc = 20,
  rampage_flame_thrower = 21,
  rampage_dragonator = 22,
  otomo = 23,
  otomo_airou_shell_013 = 25,
  otomo_airou_shell_101 = 26,
  fg_004 = 27,
  ec_bat_explode = 27,
  ec_wall_trap_bug_explode = 28,
  ec_piranha = 29,
  ec_flash = 30,
  ec_sand_wall_shooter = 31,
  ec_foreset_wall_shooter = 32,
  ec_swamp_leech = 33,
  ec_penetrate_flesh = 34,
  max = 35,
  invalid = 36,
}

---@param attacker_type DamageAttackerType
---@return string?
local function name_from_id(attacker_type)
  for name, id in pairs(types) do
    if id == attacker_type then
      return name
    end
  end
  return nil
end

return { types = types, name_from_id = name_from_id }

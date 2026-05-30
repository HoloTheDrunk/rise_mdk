---@class Hook
---@field public typedef string
---@field public method string

local hooks = {
  ---Hooks pertaining to the player character.
  player = {
    ---Fired when a player is created in a quest.
    ---Pre-callback args:
    --- 2: [QuestPlayer]
    start = { typedef = "snow.player.PlayerQuestBase", method = "start" },
    ---Fired once every frame on all players.
    ---Pre-callback args:
    --- 2: [QuestPlayer]
    update = { typedef = "snow.player.PlayerQuestBase", method = "update" },
    ---Fired when the game tries to determine how much hitstop to apply.
    ---Pre-callback args:
    --- 2: [LongSword|Hammer|etc...]
    --- 3: [GameObject]
    update_hit_stop = { typedef = "snow.player.PlayerQuestBase", method = "updateHitStop" },
    motion_control = {
      ---Fired after at the end of a frame, after the scene has been rendered.
      ---Pre-callback args:
      --- 2: [MotionControl]
      late_update = { typedef = "snow.player.PlayerMotionControl", method = "lateUpdate" }
    },
  },
  ---Hooks pertaining to the enemies (usually monsters, it's in the name of the game).
  enemy = {
    ---Fired when an enemy (monster) takes damage.
    ---Pre-callback args:
    --- 2: [Monster]
    --- 3: [HitInfo]
    stock_damage = { typedef = "snow.enemy.EnemyCharacterBase", method = "stockDamage" },
    ---Fired after the damage from a hit has been calculated based on hitzone values.
    ---Pre-callback args:
    --- 2: [Monster] | the weapon sometimes? | eldritch monstrosity of a hook
    --- 3: [DamageInfo]
    --- 4: [HitInfo]
    after_damage_calc = { typedef = "snow.enemy.EnemyCharacterBase", method = "afterCalcDamage_DamageSide" },
  }
};

---@param hook Hook The hook you want to add logic to.
---@param pre_callback fun(args: any): nil Code added before the hooked function is run.
---@param post_callback? fun(args: any): nil Code added after the hooked function has run.
local function attach_hook(hook, pre_callback, post_callback)
  sdk.hook(
    sdk.find_type_definition(hook.typedef):get_method(hook.method) --[[@as REMethodDefinition]],
    pre_callback,
    post_callback
  );
end

return {
  hooks = hooks,
  attach_hook = attach_hook,
}

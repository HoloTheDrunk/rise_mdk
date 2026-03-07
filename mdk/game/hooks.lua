---@class Hook
---@field public typedef string
---@field public method string

local hooks = {
  player = {
    ---Fired when a player is created in a quest.
    ---Callback args:
    --- 2: [QuestPlayer]
    start = { typedef = "snow.player.PlayerQuestBase", method = "start" },
    ---Fired once every frame on all players.
    ---Callback args:
    --- 2: [QuestPlayer]
    update = { typedef = "snow.player.PlayerQuestBase", method = "update" },
    ---Fired when the game tries to determine how much hitstop to apply.
    ---Callback args:
    --- 2: [LongSword|Hammer|etc...]
    --- 3: [GameObject]
    updateHitStop = { typedef = "snow.player.PlayerQuestBase", method = "updateHitStop" },
    motion_control = {
      ---Fired after at the end of a frame, after the scene has been rendered.
      ---No args
      late_update = { typedef = "snow.player.PlayerMotionControl", method = "lateUpdate" }
    },
  },
  enemy = {
    ---Fired when an enemy (monster) takes damage.
    ---Callback args:
    --- 2: [Monster]
    --- 3: [HitInfo]
    stockDamage = { typedef = "snow.enemy.EnemyCharacterBase", method = "stockDamage" },
  }
};

---@param hook Hook The hook you want to add logic to.
---@param callback fun(args: any): nil Refer to the documentation of the desired callback to parse the hook arguments.
---@diagnostic disable-next-line:unused-function
local function attach_hook(hook, callback)
  sdk.hook(
    sdk.find_type_definition(hook.typedef):get_method(hook.method) --[[@as REMethodDefinition]],
    callback
  );
end

return {
  hooks = hooks,
  attach_hook = attach_hook,
}

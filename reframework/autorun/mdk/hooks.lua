---@module "Monster"
---@module "HitInfo"

---@class Hook
---@field public typedef string
---@field public method string

local hooks = {
  player = {
    ---Fired when a player is created in a quest.
    ---Callback args:
    --- 1: unknown
    --- 2: [QuestPlayer]
    init = { typedef = "snow.player.PlayerQuestBase", method = "start" },
  },
  enemy = {
    ---Fired when an enemy (monster) takes damage.
    ---Callback args:
    --- 1: unknown
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

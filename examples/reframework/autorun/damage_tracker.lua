---Silencing warnings from the without_mdk variant.
---@diagnostic disable:unused-function,unused-local
---@diagnostic disable:param-type-mismatch,need-check-nil

local mdk = require("mdk.prelude")
local attach_hook = mdk.attach_hook
local hooks = mdk.hooks

local totalDamage = 0

local function with_mdk()
  attach_hook(hooks.player.init, function() totalDamage = 0 end)

  attach_hook(hooks.enemy.stockDamage, function(args)
    local hitInfo = mdk.HitInfo.new(args[3])
    local physicalDamage = hitInfo:get_physical_damage()
    totalDamage = totalDamage + physicalDamage
  end)
end

local function without_mdk()
  sdk.hook(
    sdk.find_type_definition("snow.player.PlayerQuestBase"):get_method("start"),
    function() totalDamage = 0 end
  )

  sdk.hook(
    sdk.find_type_definition("snow.enemy.EnemyCharacterBase"):get_method("stockDamage"),
    function(args)
      local hitInfo = sdk.to_managed_object(args[3])
      local physicalDamage = hitInfo:call("get_PhysicalDamage")
      totalDamage = totalDamage + physicalDamage
    end
  )
end

re.on_draw_ui(function()
  if imgui.tree_node("Monster Damage Tracker") then
    imgui.text(string.format("Total damage: %d", totalDamage))
    imgui.tree_pop()
  end
end)

with_mdk()

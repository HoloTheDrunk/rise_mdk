local GameObject = require("mdk.game.GameObject")

---@class Component
---@field public _remo ComponentRemo Reference to the engine-side object.
local Component = {}
Component.__index = Component --[[@as function]]

---@param value integer | ComponentRemo | userdata
---@return Component
function Component.new(value)
  return setmetatable({
    _remo = sdk.to_managed_object(value) --[[@as ComponentRemo]]
  }, Component) --[[@as Component]]
end

---@return GameObject
function Component:get_game_object()
  return GameObject.new(self._remo:call("get_GameObject"))
end

return Component

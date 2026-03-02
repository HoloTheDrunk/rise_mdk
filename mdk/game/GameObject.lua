local Component = require("mdk.game.Component")

---@class GameObject
---@field public _remo GameObjectRemo Reference to the engine-side object.
local GameObject = {}
GameObject.__index = GameObject --[[@as function]]

---@param value integer | GameObjectRemo | userdata
---@return GameObject
function GameObject.new(value)
  return setmetatable({
    _remo = sdk.to_managed_object(value) --[[@as GameObjectRemo]]
  }, GameObject) --[[@as GameObject]]
end

---@param type REManagedObject
---@return Component
function GameObject:get_component(type)
  return Component.new(self._remo:call("getComponent(System.Type)", type))
end

return GameObject

local oop = require("mdk.utils.oop")
local TransformObject = require("mdk.game.gui.TransformObject")

---@class Panel : TransformObject
---@field _remo PanelRemo
local Panel = oop.inherit({}, TransformObject)

---@param value integer|PanelRemo|userdata
---@return Panel
function Panel.new(value)
  return setmetatable({
    _remo = sdk.to_managed_object(value),
  }, Panel) --[[@as Panel]]
end

return Panel

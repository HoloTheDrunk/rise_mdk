local oop = require("mdk.utils.oop")
local TransformObject = require("mdk.game.gui.TransformObject")

---@class Rect : TransformObject
---@field _remo RectRemo
local Rect = oop.inherit({}, TransformObject)

---@param value integer|RectRemo|userdata
---@return Rect
function Rect.new(value)
  return setmetatable({
    _remo = sdk.to_managed_object(value),
  }, Rect) --[[@as Rect]]
end

return Rect

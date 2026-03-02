---@class PlayObject
---@field _remo PlayObjectRemo
local PlayObject = {}
PlayObject.__index = PlayObject --[[@as function]]

---@param value integer|PlayObjectRemo|userdata
---@return PlayObject
function PlayObject.new(value)
  return setmetatable({
    _remo = sdk.to_managed_object(value),
  }, PlayObject) --[[@as PlayObject]]
end

return PlayObject

---@class Transition
---@field start number
---@field target number
---@field start_time number
---@field duration number
---@field curve fun(x: number): number
local Transition = {}
Transition.__index = Transition --[[@as function]]

local function linear(x) return x end
local function ease_in(x) return x * x end
local function ease_out(x) return (1 - x) * (1 - x) end

---@param start number
---@param target number
---@param start_time number
---@param duration number
---@param curve? fun(x: number): number Default ease_in
function Transition.new(start, target, start_time, duration, curve)
  return setmetatable({
    start = start,
    target = target,
    start_time = start_time,
    duration = duration,
    curve = curve or ease_in,
  }, Transition)
end

---@param t number? Current time
---@return number current
function Transition:get(t)
  local x = ((t or time()) - self.start_time) / self.duration
  local y = self.curve(x)
  return self.target * y + self.start * (1. - y)
end

return {
  Transition = Transition,
  curves = {
    linear = linear,
    ease_in = ease_in,
    ease_out = ease_out,
  }
}

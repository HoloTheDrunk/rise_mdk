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
---@return Transition
function Transition.new(start, target, start_time, duration, curve)
  return setmetatable({
    start = start,
    target = target,
    start_time = start_time,
    duration = duration,
    curve = curve or ease_in,
  }, Transition) --[[@as Transition]]
end

---@param time number Current time in seconds
---@return number current
function Transition:get(time)
  local t = math.min(math.max(self.start_time, time), self.start_time + self.duration)
  local x = (t - self.start_time) / self.duration
  local y = self.curve(x)
  return self.target * y + self.start * (1. - y)
end

---@param t number Current time in seconds
---@return boolean
function Transition:is_done(t)
  return t > self.start_time + self.duration
end

return {
  Transition = Transition,
  curves = {
    linear = linear,
    ease_in = ease_in,
    ease_out = ease_out,
  }
}

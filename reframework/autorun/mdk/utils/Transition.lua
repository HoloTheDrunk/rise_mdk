---@class Transition
---@field start number
---@field target number
---@field start_time number
---@field duration number
---@field curve fun(x: number): number
local Transition = {}
Transition.__index = Transition --[[@as function]]

---@alias Easing fun(x: number): number

--Used by easing functions
local c1 = 1.70158
local c2 = c1 * 1.525
local c3 = c1 + 1
local c4 = (2 * math.pi) / 3
local c5 = (2 * math.pi) / 4.5

---@type Easing
local function bounce_out(x)
  local n1 = 7.5625
  local d1 = 2.75

  if (x < 1 / d1) then
    return n1 * x * x
  elseif (x < 2 / d1) then
    x = x - 1.5 / d1
    return n1 * x * x + 0.75
  elseif (x < 2.5 / d1) then
    x = x - 2.25 / d1
    return n1 * x * x + 0.9375
  else
    x = x - 2.625 / d1
    return n1 * x * x + 0.984375
  end
end

---@type table<string, Easing>
---See [easings.net](https://easings.net) for a quick overview.
local curves = {
  linear = function(x) return x end,
  smoothstep_unclamped = function(x) return 3 * x ^ 2 - 2 * x ^ 3 end,
  smoothstep = function(x)
    x = math.min(math.max(0, x), 1)
    return 3 * x ^ 2 - 2 * x ^ 3
  end,
  ease_in_quad = function(x) return x * x end,
  ease_out_quad = function(x) return 1 - (1 - x) ^ 2 end,
  ease_in_out_quad = function(x)
    return x < 0.5 and 2 * x * x or 1 - (-2 * x + 2) ^ 2 / 2
  end,
  ease_in_cubic = function(x) return x * x * x end,
  ease_out_cubic = function(x) return 1 - (1 - x) ^ 3 end,
  ease_in_out_cubic = function(x)
    return x < 0.5 and 4 * x * x * x or 1 - (-2 * x + 2) ^ 3 / 2
  end,
  ease_in_quart = function(x) return x * x * x * x end,
  ease_out_quart = function(x) return 1 - (1 - x) ^ 4 end,
  ease_in_out_quart = function(x)
    return x < 0.5 and 8 * x * x * x * x or 1 - (-2 * x + 2) ^ 4 / 2
  end,
  ease_in_quint = function(x) return x * x * x * x * x end,
  ease_out_quint = function(x) return 1 - (1 - x) ^ 5 end,
  ease_in_out_quint = function(x)
    return x < 0.5 and 16 * x * x * x * x * x or 1 - (-2 * x + 2) ^ 5 / 2
  end,
  ease_in_sine = function(x) return 1 - math.cos((x * math.pi) / 2) end,
  ease_out_sine = function(x) return math.sin((x * math.pi) / 2) end,
  ease_in_out_sine = function(x) return -(math.cos(math.pi * x) - 1) / 2 end,
  ease_in_expo = function(x) return x == 0 and 0 or 2 ^ (10 * x - 10) end,
  ease_out_expo = function(x) return x == 1 and 1 or 1 - 2 ^ (-10 * x) end,
  ease_in_out_expo = function(x)
    return x == 0
        and 0
        or x == 1
        and 1
        or x < 0.5
        and 2 ^ 20 * x - 10 / 2
        or (2 - 2 ^ (-20 * x + 10)) / 2
  end,
  ease_in_circ = function(x) return 1 - math.sqrt(1 - x ^ 2) end,
  ease_out_circ = function(x) return math.sqrt(1 - (x - 1) ^ 2) end,
  ease_in_out_circ = function(x)
    return x < 0.5
        and (1 - math.sqrt(1 - (2 * x) ^ 2)) / 2
        or (math.sqrt(1 - (-2 * x + 2) ^ 2) + 1) / 2
  end,
  ease_in_back = function(x) return c3 * x * x * x - c1 * x * x end,
  ease_out_back = function(x) return 1 + c3 * (x - 1) ^ 3 + c1 * (x - 1) ^ 2 end,
  ease_in_out_back = function(x)
    return x < 0.5
        and ((2 * x) ^ 2 * ((c2 + 1) * 2 * x - c2)) / 2
        or ((2 * x - 2) ^ 2 * ((c2 + 1) * (x * 2 - 2) + c2) + 2) / 2
  end,
  ease_in_elastic = function(x)
    return x == 0
        and 0
        or x == 1
        and 1
        or -2 ^ (10 * x - 10) * math.sin((x * 10 - 10.75) * c4)
  end,
  ease_out_elastic = function(x)
    return x == 0
        and 0
        or x == 1
        and 1
        or 2 ^ (-10 * x) * math.sin((x * 10 - 0.75) * c4) + 1
  end,
  ease_in_out_elastic = function(x)
    return x == 0
        and 0
        or x == 1
        and 1
        or x < 0.5
        and -(2 ^ (20 * x - 10) * math.sin((20 * x - 11.125) * c5)) / 2
        or (2 ^ (-20 * x + 10) * math.sin((20 * x - 11.125) * c5)) / 2 + 1
  end,
  ease_in_bounce = function(x) return 1 - bounce_out(1 - x) end,
  ease_out_bounce = bounce_out,
  ease_in_out_bounce = function(x)
    return x < 0.5
        and (1 - bounce_out(1 - 2 * x)) / 2
        or (1 + bounce_out(2 * x - 1)) / 2
  end,
}

---@param start number
---@param target number
---@param start_time number
---@param duration number
---@param curve? Easing Defaults to a linear curve
---@return Transition
function Transition.new(start, target, start_time, duration, curve)
  return setmetatable({
    start = start,
    target = target,
    start_time = start_time,
    duration = duration,
    curve = curve or curves.linear,
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
  curves = curves,
}

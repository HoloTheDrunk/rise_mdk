---@class State
---@field inner unknown
---@field init fun(): self
---@field is_over fun(self: self): boolean
---@field get_next fun(self: self): State | nil
---@field get_name fun(self: self): string
---@field draw_ui fun(self: self): nil
---@field draw_hud fun(self: self): nil

---@class StateManager
---@field public state State
---@field private _start State
local StateManager = {}
StateManager.__index = StateManager

---@param start State Starting state
---@return self
function StateManager.new(start)
  return setmetatable({
    state = start.init(),
    _start = start,
  }, StateManager)
end

function StateManager:to_next()
  local next = self.state:get_next()
  if not next then
    warn("[StateManager] Reached invalid state with no next: ", self.state:get_name())
    self.state = self._start.init()
  else
    self.state = next
  end
end

function StateManager:update()
  if self.state:is_over() then
    self:to_next()
  end
end

---@generic T : State
---@param state T The state class you want to check against
---@return boolean
function StateManager:is(state)
  return getmetatable(self.state) == state
end

---@generic T : State
---@param state T The state class you want to check against
---@return T | nil state The inner state
function StateManager:as(state)
  if getmetatable(self.state) == state then
    return self.state
  end
  return nil
end

return StateManager

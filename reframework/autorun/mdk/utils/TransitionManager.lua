---@alias TransitionFunc fun(value: number): nil

---@class TransitionManagerEntry
---@field transition Transition
---@field func TransitionFunc

---@class TransitionManager
---@field entries table<string, table<string, TransitionManagerEntry>>
---@field events table<string, boolean>
local TransitionManager = {}
TransitionManager.__index = TransitionManager --[[@as function]]

---@type TransitionManager | nil
local _cache = nil

---@return TransitionManager
function TransitionManager.new()
  if not _cache then
    _cache = setmetatable({
      entries = {},
      events = {},
    }, TransitionManager) --[[@as TransitionManager]]
  end
  return _cache
end

---@param time number Elapsed time since startup in seconds
function TransitionManager:update(time)
  for event, entries in pairs(self.entries) do
    if self.events[event] then
      local to_remove = {}
      for name, entry in pairs(entries) do
        if not entry.transition:is_done(time) then
          entry.func(entry.transition:get(time))
        else
          to_remove[#to_remove + 1] = name
        end
      end
      if #to_remove > 0 then
        for i = 1, #to_remove do
          self.entries[to_remove[i]] = nil
        end
      end
      self.events[event] = false
    end
  end
end

---@param event string The required trigger for <func> to be run
---@param name string
---@param transition Transition
---@param func TransitionFunc
---@param overwrite? boolean Replace the transition if it already exists
---@return boolean success
function TransitionManager:add(event, name, transition, func, overwrite)
  if not self.entries[event] then
    self.entries[event] = {}
  end
  if self.entries[event][name] ~= nil and not overwrite then
    return false
  end
  self.entries[event][name] = { transition = transition, func = func }
  return true
end

---@param name string
---@return TransitionManagerEntry | nil
function TransitionManager:remove(event, name)
  local res = self.entries[event][name]
  self.entries[event][name] = nil
  return res
end

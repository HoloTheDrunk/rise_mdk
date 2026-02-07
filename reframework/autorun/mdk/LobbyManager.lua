---@class LobbyManager
---@field private _remo LobbyManagerRemo Reference to the engine-side object.
local LobbyManager = {}
LobbyManager.__index = LobbyManager --[[@as function]]

---@type LobbyManager | nil
local _cache = nil

---@return LobbyManager
function LobbyManager.new()
  if _cache == nil then
    _cache = {
      _remo = sdk.get_managed_singleton("snow.LobbyManager") --[[@as LobbyManagerRemo]]
    }
  end
  return _cache
end

---@return boolean
function LobbyManager:is_quest_online()
  return self._remo:call("IsQuestOnline")
end

---@return integer
function LobbyManager:get_own_player_index()
  return self._remo:get_field("_myselfQuestIndex")
end

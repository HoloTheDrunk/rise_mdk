local LobbyManager = require("LobbyManager")

---@param player QuestPlayer
---@return boolean
local function is_own_player(player)
  local lobby_manager = LobbyManager.new()
  if lobby_manager:is_quest_online() and lobby_manager:get_own_player_index() ~= player:get_index() then
    return false
  end
  return true
end

local application = sdk.find_type_definition("via.Application") --[[@as RETypeDefinition]]
local _get_uptime = application:get_method("get_UpTimeSecond") --[[@as REMethodDefinition]]
---@return number seconds The time since program start with sub-second precision as decimals
local function get_uptime()
  return _get_uptime:call(nil)
end

return { is_own_player = is_own_player, get_uptime = get_uptime }

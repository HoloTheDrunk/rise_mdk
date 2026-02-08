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

return { is_own_player = is_own_player }

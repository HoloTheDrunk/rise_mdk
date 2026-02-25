local application = sdk.find_type_definition("via.Application") --[[@as RETypeDefinition]]
local _get_uptime = application:get_method("get_UpTimeSecond") --[[@as REMethodDefinition]]
---@return number seconds The time since program start with sub-second precision as decimals
local function get_uptime()
  return _get_uptime:call(nil)
end

return { get_uptime = get_uptime }

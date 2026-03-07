---@meta

---@class PlayerDataRemo : REManagedObject
---Corresponds to [snow.player.PlayerData]
PlayerDataRemo = {}

---@param method string Name of the function
---@param ... unknown Any arguments to be passed to the function
---@return unknown
---@overload fun(self, method: "get_vital"): integer
---@overload fun(self, method: "getFloatVital"): number
---@overload fun(self, method: "setVital", health: integer): nil
function PlayerDataRemo:call(method, ...) end

---@param field string
---@return unknown
---@overload fun(self, field: "_stamina"): number
---@overload fun(self, field: "_staminaMax"): number
---@overload fun(self, field: "_Attack"): number
---@overload fun(self, field: "_ElementType"): number
---@overload fun(self, field: "_ElementAttack"): number
---@overload fun(self, field: "_ElementType2nd"): number
---@overload fun(self, field: "_ElementAttack2nd"): number
---@overload fun(self, field: "_CriticalRate"): number
---@overload fun(self, field: "_Defence"): number
---@overload fun(self, field: "_ResistanceElement"): number[]
function PlayerDataRemo:get_field(field) end

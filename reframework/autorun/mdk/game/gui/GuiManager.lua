---@class GuiManager
---@field public _remo GuiManagerRemo Reference to the engine-side object.
local GuiManager = {}
GuiManager.__index = GuiManager --[[@as function]]

---@type GuiManager | nil
local _cache = nil

---@return GuiManager
function GuiManager.new()
  if not _cache then
    _cache = setmetatable({
      _remo = sdk.get_managed_singleton("snow.gui.GuiManager") --[[@as GuiManagerRemo]]
    }, GuiManager) --[[@as GuiManager]]
  end
  return _cache
end

function GuiManager:get_weapon_hud()
  return self._remo:get_field("guiHudWeaponUIObject")
end

return GuiManager

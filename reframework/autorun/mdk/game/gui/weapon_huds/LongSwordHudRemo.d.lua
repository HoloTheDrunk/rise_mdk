---@meta

---@class LongSwordHudRemo : REManagedObject
---Corresponds to [snow.gui.GuiHud_Weapon_L_Swd].
LongSwordHudRemo = {}

---@param method string Name of the function
---@param ... unknown Any arguments to be passed to the function
---@return unknown
function LongSwordHudRemo:call(method, ...) end

---@param field string Name of the field
---@return unknown
---@overload fun(self, field: "isInGaugeEffectMin_Off"): boolean
---@overload fun(self, field: "_pnl_L_Swd"): PanelRemo
---@overload fun(self, field: "_Ls_OutEffectPanel"): PanelRemo
---@overload fun(self, field: "_Ls_InGaugePanel"): PanelRemo
---@overload fun(self, field: "_Ls_InGaugeRect"): RectRemo
---@overload fun(self, field: "_Ls_OutGaugePanel"): PanelRemo
---@overload fun(self, field: "_Ls_OutGaugeRect"): RectRemo
---@overload fun(self, field: "InGaugeMaxSizeX"): number
---@overload fun(self, field: "OutGaugeMaxSizeX"): number
function LongSwordHudRemo:get_field(field) end

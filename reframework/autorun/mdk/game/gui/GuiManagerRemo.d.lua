---@meta

---@class GuiManagerRemo : REManagedObject
GuiManagerRemo = {}

---@param method string Name of the function
---@param ... unknown Any arguments to be passed to the function
---@return unknown
function GuiManagerRemo:call(method, ...) end

---@param field string Name of the field
---@return unknown
function GuiManagerRemo:get_field(field) end

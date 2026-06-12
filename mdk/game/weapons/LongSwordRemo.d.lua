---@meta

---@class LongSwordRemo : ComponentRemo
---Corresponds to [snow.player.PlayerQuestBase]
LongSwordRemo = {}

---@overload fun(self, field: "_LongSwordGaugeLv"): integer
LongSwordRemo.get_field = ComponentRemo.get_field

---@overload fun(self, field: "_LongSwordGaugeLv", level: integer): nil
LongSwordRemo.set_field = ComponentRemo.set_field

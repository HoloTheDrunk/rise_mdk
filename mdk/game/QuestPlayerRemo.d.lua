---@meta

---@class QuestPlayerRemo : ComponentRemo
---Corresponds to [snow.player.PlayerQuestBase]
QuestPlayerRemo = {}

---@overload fun(self, method: "get_PlayerData"): PlayerDataRemo
---@overload fun(self, method: "setEquipSkill223Shell"): nil
QuestPlayerRemo.call = ComponentRemo.call

---@overload fun(self, field: "_PlayerIndex"): integer
QuestPlayerRemo.get_field = ComponentRemo.get_field

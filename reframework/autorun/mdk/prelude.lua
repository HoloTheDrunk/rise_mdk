local hooks = require("mdk.game.hooks")

return {
  LobbyManager = require("mdk.game.LobbyManager"),
  --
  QuestPlayer = require("mdk.game.QuestPlayer"),
  Monster = require("mdk.game.Monster"),
  DamageAttackerType = require("mdk.game.DamageAttackerType"),
  DamageInfo = require("mdk.game.DamageInfo"),
  HitInfo = require("mdk.game.HitInfo"),
  Joint = require("mdk.game.Joint"),
  JointList = require("mdk.game.JointList"),
  hooks = hooks.hooks,
  attach_hook = hooks.attach_hook,
  motions = require("mdk.game.motions"),
  --
  Transition = require("mdk.utils.Transition"),
  TransitionManager = require("mdk.utils.TransitionManager"),
}

return {
  Component = require("mdk.game.Component"),
  DamageAttackerType = require("mdk.game.DamageAttackerType"),
  DamageInfo = require("mdk.game.DamageInfo"),
  GameObject = require("mdk.game.GameObject"),
  HitInfo = require("mdk.game.HitInfo"),
  Joint = require("mdk.game.Joint"),
  JointList = require("mdk.game.JointList"),
  LobbyManager = require("mdk.game.LobbyManager"),
  Monster = require("mdk.game.Monster"),
  MotionControl = require("mdk.game.MotionControl"),
  QuestPlayer = require("mdk.game.QuestPlayer"),
  --
  hooks = require("mdk.game.hooks"),
  motions = require("mdk.game.motions"),
  time = require("mdk.game.time"),
  --Submodules
  gui = require("mdk.game.gui._mod"),
  weapons = require("mdk.game.weapons._mod"),
}

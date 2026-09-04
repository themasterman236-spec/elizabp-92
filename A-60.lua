---====== Load spawner ======---

local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/Not-Guestly/Modes/refs/heads/main/Entity-Spawner-Fixed-By-Guestly%20(Outernal)"))()

---====== Create entity ======---

local entity = Spawner:Create({
 Entity = {
  Name = "A-60",
  Asset = "https://github.com/themasterman236-spec/elizabp-92/raw/main/A-60.rbxm",
  HeightOffset = 4
 },
 Lights = {
  Flicker = {
   Enabled = false,
   Duration = 1
  },
  Shatter = false,
  Repair = false
 },
 Earthquake = {
  Enabled = false
 },
 CameraShake = {
  Enabled = true,
  Range = 100,
  Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
 },
 Movement = {
  Speed = 130,
  Delay = 1.5,
  Reversed = false
 },
 Rebounding = {
  Enabled = true,
  Type = "Ambush", -- "Blitz"
  Min = 2,
  Max = 2,
  Delay = 0.5
 },
 Damage = {
  Enabled = true,
  IgnoreHiding = false,
  Range = 40,
  Amount = 125
 },
 Crucifixion = {
  Enabled = true,
  Range = 40,
  Resist = false,
  Break = true
 },
 Death = {
  Type = "Curious", -- "Curious"
  Hints = {"You died to A-60...", "He is not hard to beat...", "Just hide...", "Good luck!"},
  Cause = ""
 }
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)

entity:SetCallback("OnEnterRoom", function(room: Model, firstTime: boolean)
    if firstTime == true then
        print("Entity has entered room: ".. room.Name.. " for the first time")
    else
        print("Entity has entered room: ".. room.Name.. " again")
    end
end)

entity:SetCallback("OnLookAt", function(lineOfSight: boolean)
 if lineOfSight == true then
  print("Player is looking at entity")
 else
  print("Player view is obstructed by something")
 end
end)

entity:SetCallback("OnRebounding", function(startOfRebound: boolean)
    if startOfRebound == true then
        print("Entity has started rebounding")
 else
        print("Entity has finished rebounding")
 end
end)

entity:SetCallback("OnDespawning", function()
    print("Entity is despawning")
end)

entity:SetCallback("OnDespawned", function()
    print("Entity has despawned")
if not getgenv().A60AchievementExecuted then
    getgenv().A60AchievementExecuted = true

    loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()({
        Title = "Im here",
        Desc = "Don't run away",
        Reason = "Encounter A-60",
        Image = "rbxassetid://12485947561",
    })
end
end)

entity:SetCallback("OnDamagePlayer", function(newHealth: number)
 if newHealth <= 0 then
  print("Entity has killed the player")
 else
  print("Entity has damaged the player")
 end
end)

--[[

DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.

entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)

]]--

---====== Run entity ======---

entity:Run(true)

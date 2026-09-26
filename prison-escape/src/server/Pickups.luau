local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Config = require(ReplicatedStorage.Shared.Config)
local Net = require(ReplicatedStorage.Shared.Net)
local Arena = require(script.Parent.Arena)
local Skills = require(script.Parent.Skills)

local Pickups = {}

local STYLES = {
	Ammo = { color = Color3.fromRGB(255, 80, 70), label = "+" .. Config.Pickups.AmmoPerPickup .. " AMMO" },
	Speed = { color = Color3.fromRGB(90, 255, 120), label = "SPEED" },
	Recharge = { color = Color3.fromRGB(190, 120, 255), label = "RECHARGE" },
	Shield = { color = Color3.fromRGB(90, 200, 255), label = "SHIELD" },
}

local rng = Random.new()
local active: { [BasePart]: string } = {}
-- Bumped every start/stop so respawns scheduled during an old round never fire into a new one.
local generation = 0

local function randomSkillKind(): string
	local kinds = Config.Pickups.SkillKinds
	return kinds[rng:NextInteger(1, #kinds)]
end

local function spawnPickup(kind: string)
	local position = Arena.randomFieldPoint(rng)
	if not position then
		return
	end
	local style = STYLES[kind]

	local part = Instance.new("Part")
	part.Name = kind .. "Pickup"
	part.Size = Vector3.new(1.6, 1.6, 1.6)
	part.CFrame = CFrame.new(position + Vector3.new(0, 2.5, 0)) * CFrame.Angles(math.rad(45), 0, math.rad(45))
	part.Anchored = true
	part.CanCollide = false
	part.CanQuery = false
	part.CanTouch = false
	part.Material = Enum.Material.Neon
	part.Color = style.color
	part:SetAttribute("PickupKind", kind)

	local light = Instance.new("PointLight")
	light.Color = style.color
	light.Range = 10
	light.Brightness = 1.5
	light.Parent = part

	local billboard = Instance.new("BillboardGui")
	billboard.Size = UDim2.fromOffset(120, 28)
	billboard.StudsOffset = Vector3.new(0, 2.2, 0)
	billboard.MaxDistance = 150
	billboard.LightInfluence = 0
	billboard.Parent = part

	local label = Instance.new("TextLabel")
	label.Size = UDim2.fromScale(1, 1)
	label.BackgroundTransparency = 1
	label.Text = style.label
	label.TextColor3 = style.color
	label.TextStrokeTransparency = 0.3
	label.TextScaled = true
	label.Font = Enum.Font.FredokaOne
	label.Parent = billboard

	part.Parent = Arena.PickupFolder
	active[part] = kind
end

local function canCollect(player: Player, kind: string): boolean
	if kind == "Ammo" then
		return Net.GameState:GetAttribute("Phase") == "Playing" and player:GetAttribute("Role") == "Cop"
	end
	return Skills.isActivePrisoner(player)
end

local function give(player: Player, kind: string)
	if kind == "Ammo" then
		player:SetAttribute("Ammo", (player:GetAttribute("Ammo") or 0) + Config.Pickups.AmmoPerPickup)
	else
		Skills.applyPickup(player, kind)
	end
	Net.Notify:FireClient(player, "Picked up " .. STYLES[kind].label)
end

local function scheduleRespawn(kind: string)
	local scheduledIn = generation
	task.delay(Config.Pickups.RespawnTime, function()
		if scheduledIn == generation then
			spawnPickup(if kind == "Ammo" then "Ammo" else randomSkillKind())
		end
	end)
end

local function collect()
	local radius = Config.Pickups.CollectRadius
	for part, kind in active do
		for _, player in Players:GetPlayers() do
			local character = player.Character
			local root = if character then character:FindFirstChild("HumanoidRootPart") :: BasePart? else nil
			if root and canCollect(player, kind) and (root.Position - part.Position).Magnitude <= radius then
				active[part] = nil
				part:Destroy()
				give(player, kind)
				scheduleRespawn(kind)
				break
			end
		end
	end
end

function Pickups.start()
	generation += 1
	for _ = 1, Config.Pickups.AmmoOnField do
		spawnPickup("Ammo")
	end
	for _ = 1, Config.Pickups.SkillsOnField do
		spawnPickup(randomSkillKind())
	end

	local runningIn = generation
	task.spawn(function()
		while runningIn == generation do
			collect()
			task.wait(0.1)
		end
	end)
end

function Pickups.stop()
	generation += 1
	for part in active do
		part:Destroy()
	end
	table.clear(active)
end

return Pickups

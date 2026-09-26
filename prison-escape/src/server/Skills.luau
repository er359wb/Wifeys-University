local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterPlayer = game:GetService("StarterPlayer")
local Workspace = game:GetService("Workspace")

local Config = require(ReplicatedStorage.Shared.Config)
local Net = require(ReplicatedStorage.Shared.Net)

local Skills = {}

-- Client and server clocks are synced but not perfectly, so a press right as a cooldown ends can arrive a bit early.
local READY_TOLERANCE = 0.25

type Boost = { bonus: number, expiresAt: number }

local boosts: { [Player]: { [string]: Boost } } = {}
local frozen: { [Player]: boolean } = {}

local function getHumanoid(player: Player): Humanoid?
	local character = player.Character
	return if character then character:FindFirstChildOfClass("Humanoid") else nil
end

local function baseSpeed(player: Player): number
	local role = player:GetAttribute("Role")
	if role == "Cop" then
		return Config.Cop.WalkSpeed
	elseif role == "Prisoner" then
		return Config.Prisoner.WalkSpeed
	end
	return StarterPlayer.CharacterWalkSpeed
end

function Skills.isActivePrisoner(player: Player): boolean
	return Net.GameState:GetAttribute("Phase") == "Playing"
		and player:GetAttribute("Role") == "Prisoner"
		and player:GetAttribute("Status") == "Active"
end

function Skills.refreshSpeed(player: Player)
	local humanoid = getHumanoid(player)
	if not humanoid then
		return
	end
	if frozen[player] then
		humanoid.WalkSpeed = 0
		return
	end

	local speed = baseSpeed(player)
	local playerBoosts = boosts[player]
	if playerBoosts then
		local now = os.clock()
		for source, boost in playerBoosts do
			if boost.expiresAt > now then
				speed += boost.bonus
			else
				playerBoosts[source] = nil
			end
		end
	end
	humanoid.WalkSpeed = speed
end

function Skills.addSpeedBoost(player: Player, source: string, bonus: number, duration: number)
	local playerBoosts = boosts[player] or {}
	boosts[player] = playerBoosts
	playerBoosts[source] = { bonus = bonus, expiresAt = os.clock() + duration }
	Skills.refreshSpeed(player)
	task.delay(duration, Skills.refreshSpeed, player)
end

function Skills.setFrozen(player: Player, isFrozen: boolean)
	frozen[player] = isFrozen
	local humanoid = getHumanoid(player)
	if humanoid then
		humanoid.JumpHeight = if isFrozen then 0 else StarterPlayer.CharacterJumpHeight
		humanoid.JumpPower = if isFrozen then 0 else StarterPlayer.CharacterJumpPower
	end
	Skills.refreshSpeed(player)
end

function Skills.giveShield(player: Player)
	player:SetAttribute("Shield", true)
	local character = player.Character
	if character and not character:FindFirstChild("ShieldHighlight") then
		local highlight = Instance.new("Highlight")
		highlight.Name = "ShieldHighlight"
		highlight.FillColor = Color3.fromRGB(90, 200, 255)
		highlight.FillTransparency = 0.6
		highlight.OutlineColor = Color3.fromRGB(200, 240, 255)
		highlight.DepthMode = Enum.HighlightDepthMode.Occluded
		highlight.Parent = character
	end
end

function Skills.consumeShield(player: Player): boolean
	if not player:GetAttribute("Shield") then
		return false
	end
	player:SetAttribute("Shield", false)
	local character = player.Character
	local highlight = if character then character:FindFirstChild("ShieldHighlight") else nil
	if highlight then
		highlight:Destroy()
	end
	return true
end

function Skills.applyPickup(player: Player, kind: string)
	if kind == "Speed" then
		local boost = Config.Pickups.SpeedBoost
		Skills.addSpeedBoost(player, "SpeedPickup", boost.SpeedBonus, boost.Duration)
	elseif kind == "Recharge" then
		player:SetAttribute("SprintReadyAt", 0)
		player:SetAttribute("DriftReadyAt", 0)
	elseif kind == "Shield" then
		Skills.giveShield(player)
	end
end

function Skills.reset(player: Player)
	boosts[player] = nil
	frozen[player] = nil
end

local function onUseSkill(player: Player, skillName: unknown)
	if skillName ~= "Sprint" and skillName ~= "Drift" then
		return
	end
	if not Skills.isActivePrisoner(player) then
		return
	end

	local attribute = skillName .. "ReadyAt"
	local now = Workspace:GetServerTimeNow()
	if now + READY_TOLERANCE < (player:GetAttribute(attribute) or 0) then
		return
	end

	-- Drift moves the character, which the client physically owns, so the client performs it; the server only tracks the cooldown.
	if skillName == "Sprint" then
		local sprint = Config.Prisoner.Sprint
		player:SetAttribute(attribute, now + sprint.Cooldown)
		Skills.addSpeedBoost(player, "Sprint", sprint.SpeedBonus, sprint.Duration)
	else
		player:SetAttribute(attribute, now + Config.Prisoner.Drift.Cooldown)
	end
end

function Skills.init()
	Net.UseSkill.OnServerEvent:Connect(onUseSkill)
	Players.PlayerRemoving:Connect(Skills.reset)
end

return Skills

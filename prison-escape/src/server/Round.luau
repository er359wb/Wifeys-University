local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local Config = require(ReplicatedStorage.Shared.Config)
local Net = require(ReplicatedStorage.Shared.Net)
local Arena = require(script.Parent.Arena)
local Gun = require(script.Parent.Gun)
local Pickups = require(script.Parent.Pickups)
local Skills = require(script.Parent.Skills)

local Round = {}

local GameState = Net.GameState
local ROUND_ATTRIBUTES = { "Role", "Status", "Ammo", "HasStash", "Shield", "SprintReadyAt", "DriftReadyAt" }

local rng = Random.new()
local participants: { Player } = {}
local connections: { RBXScriptConnection } = {}
local cop: Player? = nil
local copGone = false

local function now(): number
	return Workspace:GetServerTimeNow()
end

local function setPhase(phase: string, duration: number?)
	GameState:SetAttribute("PhaseEndsAt", if duration then now() + duration else 0)
	GameState:SetAttribute("Phase", phase)
end

local function notify(text: string)
	Net.Notify:FireAllClients(text)
end

local function getAliveCharacter(player: Player): (Model?, Humanoid?, BasePart?)
	local character = player.Character
	if not character then
		return nil, nil, nil
	end
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	local root = character:FindFirstChild("HumanoidRootPart") :: BasePart?
	if not humanoid or not root or humanoid.Health <= 0 then
		return nil, nil, nil
	end
	return character, humanoid, root
end

local function readyPlayers(): { Player }
	local ready = {}
	for _, player in Players:GetPlayers() do
		if getAliveCharacter(player) then
			table.insert(ready, player)
		end
	end
	return ready
end

local function pickCop(players: { Player }): Player
	if GameState:GetAttribute("CopSelection") == "Choose" then
		local chosenId = GameState:GetAttribute("ChosenCopUserId")
		for _, player in players do
			if player.UserId == chosenId then
				return player
			end
		end
	end
	return players[rng:NextInteger(1, #players)]
end

local function addWin(player: Player)
	local leaderstats = player:FindFirstChild("leaderstats")
	local wins = if leaderstats then leaderstats:FindFirstChild("Wins") else nil
	if wins and wins:IsA("IntValue") then
		wins.Value += 1
	end
end

local function place(character: Model, cframe: CFrame)
	character:PivotTo(cframe + Vector3.new(0, 3, 0))
end

local function catch(player: Player)
	if player:GetAttribute("Status") == "Active" then
		player:SetAttribute("Status", "Caught")
		notify(player.DisplayName .. " was caught!")
	end
end

local function attachStash(character: Model)
	local torso = character:FindFirstChild("UpperTorso") or character:FindFirstChild("Torso")
	if not torso or not torso:IsA("BasePart") then
		return
	end
	local bag = Instance.new("Part")
	bag.Name = "StashBag"
	bag.Size = Vector3.new(1.6, 1.8, 0.9)
	bag.Material = Enum.Material.Fabric
	bag.Color = Color3.fromRGB(235, 190, 60)
	bag.CanCollide = false
	bag.Massless = true
	bag.CFrame = torso.CFrame * CFrame.new(0, 0, 0.95)

	local weld = Instance.new("Weld")
	weld.Part0 = torso
	weld.Part1 = bag
	weld.C0 = CFrame.new(0, 0, 0.95)
	weld.Parent = bag
	bag.Parent = character
end

local function setupCop(player: Player, character: Model, humanoid: Humanoid, prisonerCount: number)
	player:SetAttribute("Role", "Cop")
	player:SetAttribute("Ammo", GameState:GetAttribute("AmmoPerPlayer") * prisonerCount)
	place(character, Arena.CopSpawn.CFrame)

	-- The Cop's parts go in their own collision group so only the Cop is blocked by the safe zone barrier.
	local function applyGroup(instance: Instance)
		if instance:IsA("BasePart") then
			instance.CollisionGroup = Arena.COP_GROUP
		end
	end
	for _, descendant in character:GetDescendants() do
		applyGroup(descendant)
	end
	table.insert(connections, character.DescendantAdded:Connect(applyGroup))

	local highlight = Instance.new("Highlight")
	highlight.Name = "CopHighlight"
	highlight.FillColor = Color3.fromRGB(255, 60, 60)
	highlight.FillTransparency = 0.75
	highlight.OutlineColor = Color3.fromRGB(255, 90, 90)
	highlight.DepthMode = Enum.HighlightDepthMode.Occluded
	highlight.Parent = character

	local tool = Gun.create()
	tool.Parent = player:FindFirstChildOfClass("Backpack")
	humanoid:EquipTool(tool)
end

local function setupPrisoner(player: Player, character: Model, spawnCFrame: CFrame)
	player:SetAttribute("Role", "Prisoner")
	player:SetAttribute("Status", "Active")
	player:SetAttribute("HasStash", false)
	player:SetAttribute("Shield", false)
	player:SetAttribute("SprintReadyAt", 0)
	player:SetAttribute("DriftReadyAt", 0)
	place(character, spawnCFrame + Vector3.new(rng:NextNumber(-3, 3), 0, rng:NextNumber(-3, 3)))
end

local function startRound(players: { Player })
	local chosenCop = pickCop(players)
	cop = chosenCop
	copGone = false
	participants = players
	GameState:SetAttribute("CopUserId", chosenCop.UserId)
	GameState:SetAttribute("PrisonersLeft", #players - 1)

	local spawns = Arena.prisonerSpawnCFrames()
	local spawnIndex = rng:NextInteger(1, #spawns)
	for _, player in players do
		local character, humanoid = getAliveCharacter(player)
		if not character or not humanoid then
			continue
		end

		Skills.reset(player)
		for _, child in character:GetChildren() do
			if child:IsA("ForceField") then
				child:Destroy()
			end
		end

		if player == chosenCop then
			setupCop(player, character, humanoid, #players - 1)
		else
			setupPrisoner(player, character, spawns[spawnIndex])
			spawnIndex = spawnIndex % #spawns + 1
		end
		Skills.setFrozen(player, true)

		table.insert(
			connections,
			humanoid.Died:Connect(function()
				if player == cop then
					copGone = true
				else
					catch(player)
				end
			end)
		)
	end
end

local function updatePrisoners(): number
	local active = 0
	for _, player in participants do
		if player:GetAttribute("Status") ~= "Active" then
			continue
		end
		local character, _, root = getAliveCharacter(player)
		if not character or not root then
			catch(player)
			continue
		end

		if not player:GetAttribute("HasStash") then
			if Arena.isInStashZone(root.Position) then
				player:SetAttribute("HasStash", true)
				attachStash(character)
				notify(player.DisplayName .. " grabbed the stash!")
			end
		elseif Arena.isInSafeZone(root.Position) then
			player:SetAttribute("Status", "Escaped")
			notify(player.DisplayName .. " escaped with the stash!")
			Skills.reset(player)
			Skills.refreshSpeed(player)
			character:PivotTo(Arena.LobbySpawn.CFrame + Vector3.new(0, 4, 0))
			continue
		end
		active += 1
	end
	return active
end

local function cleanup()
	for _, connection in connections do
		connection:Disconnect()
	end
	table.clear(connections)

	for _, player in participants do
		for _, name in ROUND_ATTRIBUTES do
			player:SetAttribute(name, nil)
		end
		Skills.reset(player)
		task.spawn(player.LoadCharacterAsync, player)
	end
	participants = {}
	cop = nil
	GameState:SetAttribute("CopUserId", 0)
	GameState:SetAttribute("Winner", "")
	GameState:SetAttribute("ResultText", "")
end

local function finishRound()
	Pickups.stop()
	Gun.clear()

	local escaped = {}
	for _, player in participants do
		if player:GetAttribute("Status") == "Escaped" then
			table.insert(escaped, player)
			addWin(player)
		end
	end

	local winner, resultText
	if #escaped > 0 then
		winner = "Prisoners"
		resultText = if #escaped == 1
			then escaped[1].DisplayName .. " got the stash out!"
			else #escaped .. " prisoners got the stash out!"
	elseif copGone or not cop then
		winner, resultText = "None", "The Cop left the round."
	else
		winner, resultText = "Cop", cop.DisplayName .. " caught every prisoner!"
		addWin(cop)
	end

	GameState:SetAttribute("Winner", winner)
	GameState:SetAttribute("ResultText", resultText)
	GameState:SetAttribute("PrisonersLeft", 0)
	setPhase("Results", Config.ResultsTime)
	task.wait(Config.ResultsTime)
	cleanup()
end

local function runPlayingPhase()
	for _, player in participants do
		Skills.setFrozen(player, false)
	end
	local roundTime = GameState:GetAttribute("RoundTime")
	local endsAt = now() + roundTime
	setPhase("Playing", roundTime)

	while not copGone do
		local active = updatePrisoners()
		GameState:SetAttribute("PrisonersLeft", active)
		if active == 0 then
			return
		end
		if now() >= endsAt then
			for _, player in participants do
				if player:GetAttribute("Status") == "Active" then
					player:SetAttribute("Status", "Caught")
				end
			end
			notify("Time's up! Everyone still out there was caught.")
			return
		end
		task.wait(0.1)
	end
end

local function playRound(players: { Player })
	startRound(players)
	Pickups.start()
	setPhase("Countdown", Config.CountdownTime)
	if cop then
		notify(cop.DisplayName .. " is the Cop!")
	end
	task.wait(Config.CountdownTime)

	if not copGone then
		runPlayingPhase()
	end
	finishRound()
end

local function onPlayerRemoving(player: Player)
	local index = table.find(participants, player)
	if index then
		table.remove(participants, index)
	end
	if player == cop then
		copGone = true
	end
end

function Round.run()
	Players.PlayerRemoving:Connect(onPlayerRemoving)
	GameState:SetAttribute("CopUserId", 0)
	GameState:SetAttribute("PrisonersLeft", 0)
	GameState:SetAttribute("Winner", "")
	GameState:SetAttribute("ResultText", "")

	while true do
		setPhase("Waiting")
		while #readyPlayers() < Config.MinPlayers do
			task.wait(1)
		end

		setPhase("Intermission", Config.IntermissionTime)
		local intermissionEnds = os.clock() + Config.IntermissionTime
		while os.clock() < intermissionEnds and #Players:GetPlayers() >= Config.MinPlayers do
			task.wait(0.5)
		end

		local players = readyPlayers()
		if #players >= Config.MinPlayers then
			playRound(players)
		end
	end
end

return Round

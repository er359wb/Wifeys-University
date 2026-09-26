local Players = game:GetService("Players")

local Arena = require(script.Arena)
local Gun = require(script.Gun)
local Lobby = require(script.Lobby)
local Round = require(script.Round)
local Skills = require(script.Skills)

Arena.build()
Lobby.init()
Skills.init()
Gun.init()

local function onPlayerAdded(player: Player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	local wins = Instance.new("IntValue")
	wins.Name = "Wins"
	wins.Parent = leaderstats
	leaderstats.Parent = player

	player.RespawnLocation = Arena.LobbySpawn
	-- Anyone who spawned before the arena existed is standing somewhere random, so respawn them in the lobby.
	if player.Character then
		player:LoadCharacterAsync()
	end
end

Players.PlayerAdded:Connect(onPlayerAdded)
for _, player in Players:GetPlayers() do
	task.spawn(onPlayerAdded, player)
end

Round.run()

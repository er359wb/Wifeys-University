local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Config = require(ReplicatedStorage.Shared.Config)
local Net = require(ReplicatedStorage.Shared.Net)

local Lobby = {}

local GameState = Net.GameState
local joinOrder: { Player } = {}

-- The private server owner hosts when present; otherwise whoever has been in the server longest.
local function refreshHost()
	local host: Player? = nil
	if game.PrivateServerOwnerId ~= 0 then
		host = Players:GetPlayerByUserId(game.PrivateServerOwnerId)
	end
	host = host or joinOrder[1]
	GameState:SetAttribute("HostUserId", if host then host.UserId else 0)
end

local function onChangeSetting(player: Player, name: any, value: any)
	if player.UserId ~= GameState:GetAttribute("HostUserId") then
		return
	end

	if name == "CopSelection" then
		if typeof(value) == "string" and table.find(Config.Settings.CopSelection.Options, value) then
			GameState:SetAttribute("CopSelection", value)
		end
	elseif name == "AmmoPerPlayer" or name == "RoundTime" then
		if typeof(value) == "number" and value == value then
			local setting = Config.Settings[name]
			local stepped = math.round(value / setting.Step) * setting.Step
			GameState:SetAttribute(name, math.clamp(stepped, setting.Min, setting.Max))
		end
	elseif name == "ChosenCopUserId" then
		if typeof(value) == "number" and (value == 0 or Players:GetPlayerByUserId(value)) then
			GameState:SetAttribute("ChosenCopUserId", value)
		end
	end
end

local function onPlayerAdded(player: Player)
	if not table.find(joinOrder, player) then
		table.insert(joinOrder, player)
	end
	refreshHost()
end

local function onPlayerRemoving(player: Player)
	local index = table.find(joinOrder, player)
	if index then
		table.remove(joinOrder, index)
	end
	if GameState:GetAttribute("ChosenCopUserId") == player.UserId then
		GameState:SetAttribute("ChosenCopUserId", 0)
	end
	refreshHost()
end

function Lobby.init()
	GameState:SetAttribute("CopSelection", Config.Settings.CopSelection.Default)
	GameState:SetAttribute("AmmoPerPlayer", Config.Settings.AmmoPerPlayer.Default)
	GameState:SetAttribute("RoundTime", Config.Settings.RoundTime.Default)
	GameState:SetAttribute("ChosenCopUserId", 0)

	Players.PlayerAdded:Connect(onPlayerAdded)
	Players.PlayerRemoving:Connect(onPlayerRemoving)
	for _, player in Players:GetPlayers() do
		onPlayerAdded(player)
	end
	Net.ChangeSetting.OnServerEvent:Connect(onChangeSetting)
end

return Lobby

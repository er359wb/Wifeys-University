local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local Shared = ReplicatedStorage:WaitForChild("Shared")
local Config = require(Shared:WaitForChild("Config"))
local Net = require(Shared:WaitForChild("Net"))
local Controls = require(script.Parent.Controls)

local player = Players.LocalPlayer
local GameState = Net.GameState

local Hud = {}

local COLORS = {
	Panel = Color3.fromRGB(18, 20, 26),
	Button = Color3.fromRGB(48, 52, 64),
	Text = Color3.fromRGB(240, 240, 240),
	Muted = Color3.fromRGB(165, 170, 182),
	Cop = Color3.fromRGB(255, 85, 80),
	Prisoner = Color3.fromRGB(255, 165, 60),
	Safe = Color3.fromRGB(90, 190, 255),
	Stash = Color3.fromRGB(255, 210, 60),
	Good = Color3.fromRGB(100, 230, 120),
}

local MAX_FEED = 4
local FEED_TIME = 4

local DEFAULTS: { [string]: { [string]: any } } = {
	Frame = { BackgroundColor3 = COLORS.Panel, BorderSizePixel = 0 },
	TextLabel = {
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamBold,
		TextColor3 = COLORS.Text,
		TextScaled = true,
	},
	TextButton = {
		BackgroundColor3 = COLORS.Button,
		BorderSizePixel = 0,
		Font = Enum.Font.GothamBold,
		TextColor3 = COLORS.Text,
		TextScaled = true,
	},
}

local function create(className: string, props: { [string]: any }, children: { Instance }?): any
	local instance = Instance.new(className)
	local defaults = DEFAULTS[className]
	if defaults then
		for key, value in defaults do
			(instance :: any)[key] = value
		end
	end
	for key, value in props do
		if key ~= "Parent" then
			(instance :: any)[key] = value
		end
	end
	if children then
		for _, child in children do
			child.Parent = instance
		end
	end
	instance.Parent = props.Parent
	return instance
end

local function corner(radius: number): UICorner
	return create("UICorner", { CornerRadius = UDim.new(0, radius) })
end

local function padding(pixels: number): UIPadding
	local size = UDim.new(0, pixels)
	return create("UIPadding", { PaddingTop = size, PaddingBottom = size, PaddingLeft = size, PaddingRight = size })
end

local function formatTime(seconds: number): string
	local total = math.max(0, math.ceil(seconds))
	return string.format("%d:%02d", total // 60, total % 60)
end

local function playerName(userId: number?): string
	local other = if userId and userId ~= 0 then Players:GetPlayerByUserId(userId) else nil
	return if other then other.DisplayName else "?"
end

local function cycle(list: { any }, current: any, step: number): any
	local index = table.find(list, current) or 1
	return list[(index - 1 + step) % #list + 1]
end

type SkillButton = { overlay: Frame, timer: TextLabel, cooldown: number }
type SettingRow = { frame: Frame, value: TextLabel, back: TextButton, forward: TextButton }

function Hud.init()
	-- The Cop's gun is equipped by the server and there are no other tools, so the hotbar would only let them unequip it.
	StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)

	local touchOnly = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

	local gui = create("ScreenGui", {
		Name = "PrisonEscapeHud",
		ResetOnSpawn = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		Parent = player:WaitForChild("PlayerGui"),
	})

	local top = create("Frame", {
		AnchorPoint = Vector2.new(0.5, 0),
		Position = UDim2.new(0.5, 0, 0, 8),
		Size = UDim2.fromOffset(340, 62),
		BackgroundTransparency = 0.25,
		Parent = gui,
	}, { corner(12) })
	local statusLabel: TextLabel = create("TextLabel", {
		Position = UDim2.fromOffset(8, 4),
		Size = UDim2.new(1, -16, 0, 32),
		Font = Enum.Font.FredokaOne,
		Parent = top,
	})
	local infoLabel: TextLabel = create("TextLabel", {
		Position = UDim2.fromOffset(8, 38),
		Size = UDim2.new(1, -16, 0, 18),
		Font = Enum.Font.GothamMedium,
		TextColor3 = COLORS.Muted,
		Parent = top,
	})

	local objectiveLabel: TextLabel = create("TextLabel", {
		AnchorPoint = Vector2.new(0.5, 0),
		Position = UDim2.new(0.5, 0, 0, 78),
		Size = UDim2.new(0.9, 0, 0, 28),
		TextStrokeTransparency = 0.4,
		Parent = gui,
	})

	local feed = create("Frame", {
		AnchorPoint = Vector2.new(0.5, 0),
		Position = UDim2.new(0.5, 0, 0, 112),
		Size = UDim2.new(0.8, 0, 0, MAX_FEED * 26),
		BackgroundTransparency = 1,
		Parent = gui,
	}, {
		create("UISizeConstraint", { MaxSize = Vector2.new(480, math.huge) }),
		create("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, 2),
		}),
	})

	local banner: TextLabel = create("TextLabel", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.36),
		Size = UDim2.new(0.8, 0, 0, 64),
		Font = Enum.Font.FredokaOne,
		TextStrokeTransparency = 0.2,
		Visible = false,
		Parent = gui,
	})

	local ammoLabel: TextLabel = create("TextLabel", {
		AnchorPoint = Vector2.new(0.5, 1),
		Position = UDim2.new(0.5, 0, 1, -24),
		Size = UDim2.fromOffset(260, 44),
		BackgroundTransparency = 0.25,
		BackgroundColor3 = COLORS.Panel,
		Font = Enum.Font.FredokaOne,
		TextColor3 = COLORS.Cop,
		Visible = false,
		Parent = gui,
	}, { corner(10), padding(6) })

	local skillBar = create("Frame", {
		AnchorPoint = if touchOnly then Vector2.new(1, 0.5) else Vector2.new(0.5, 1),
		Position = if touchOnly then UDim2.new(1, -16, 0.45, 0) else UDim2.new(0.5, 0, 1, -24),
		Size = if touchOnly then UDim2.fromOffset(96, 200) else UDim2.fromOffset(200, 96),
		BackgroundTransparency = 1,
		Visible = false,
		Parent = gui,
	}, {
		create("UIListLayout", {
			FillDirection = if touchOnly then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 8),
		}),
	})

	local shieldLabel: TextLabel = create("TextLabel", {
		AnchorPoint = if touchOnly then Vector2.new(1, 1) else Vector2.new(0.5, 1),
		Position = if touchOnly then UDim2.new(1, -16, 0.45, -108) else UDim2.new(0.5, 0, 1, -126),
		Size = UDim2.fromOffset(if touchOnly then 96 else 200, 22),
		Text = "SHIELD ON",
		TextColor3 = COLORS.Safe,
		TextStrokeTransparency = 0.4,
		Visible = false,
		Parent = gui,
	})

	local function skillButton(skill: string, order: number, key: Enum.KeyCode): SkillButton
		local button = create("TextButton", {
			Name = skill,
			LayoutOrder = order,
			Size = UDim2.fromOffset(96, 96),
			Text = "",
			BackgroundTransparency = 0.1,
			Parent = skillBar,
		}, { corner(14) })
		create("TextLabel", {
			Position = UDim2.fromOffset(6, 10),
			Size = UDim2.new(1, -12, 0, 24),
			Text = string.upper(skill),
			Font = Enum.Font.FredokaOne,
			Parent = button,
		})
		if not touchOnly then
			create("TextLabel", {
				Position = UDim2.new(0, 6, 1, -26),
				Size = UDim2.new(1, -12, 0, 18),
				Text = "[" .. key.Name .. "]",
				TextColor3 = COLORS.Muted,
				Parent = button,
			})
		end
		local overlay = create("Frame", {
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.fromScale(0, 1),
			Size = UDim2.fromScale(1, 0),
			BackgroundColor3 = Color3.new(0, 0, 0),
			BackgroundTransparency = 0.45,
			ZIndex = 2,
			Parent = button,
		}, { corner(14) })
		local timer = create("TextLabel", {
			Position = UDim2.fromOffset(0, 36),
			Size = UDim2.new(1, 0, 0, 30),
			Text = "",
			Font = Enum.Font.FredokaOne,
			ZIndex = 3,
			Parent = button,
		})
		button.Activated:Connect(function()
			Controls.useSkill(skill)
		end)
		return { overlay = overlay, timer = timer, cooldown = Config.Prisoner[skill].Cooldown }
	end

	local skillButtons: { [string]: SkillButton } = {
		Sprint = skillButton("Sprint", 1, Config.Prisoner.Sprint.Key),
		Drift = skillButton("Drift", 2, Config.Prisoner.Drift.Key),
	}

	local settingsPanel = create("Frame", {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 12, 0.5, 0),
		Size = UDim2.fromOffset(270, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 0.2,
		Visible = false,
		Parent = gui,
	}, {
		corner(12),
		padding(10),
		create("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 6) }),
	})
	create("TextLabel", {
		LayoutOrder = 1,
		Size = UDim2.new(1, 0, 0, 24),
		Text = "LOBBY SETTINGS",
		Font = Enum.Font.FredokaOne,
		Parent = settingsPanel,
	})
	local hostLabel: TextLabel = create("TextLabel", {
		LayoutOrder = 2,
		Size = UDim2.new(1, 0, 0, 16),
		Font = Enum.Font.GothamMedium,
		TextColor3 = COLORS.Muted,
		Parent = settingsPanel,
	})

	local function settingRow(order: number, title: string, onStep: (step: number) -> ()): SettingRow
		local frame = create("Frame", {
			LayoutOrder = order,
			Size = UDim2.new(1, 0, 0, 28),
			BackgroundTransparency = 1,
			Parent = settingsPanel,
		})
		create("TextLabel", {
			Position = UDim2.fromOffset(0, 5),
			Size = UDim2.new(0.42, -4, 1, -10),
			Text = title,
			TextXAlignment = Enum.TextXAlignment.Left,
			Font = Enum.Font.GothamMedium,
			TextColor3 = COLORS.Muted,
			Parent = frame,
		})
		local back = create("TextButton", {
			Position = UDim2.fromScale(0.42, 0),
			Size = UDim2.fromOffset(28, 28),
			Text = "<",
			Parent = frame,
		}, { corner(6) })
		local value = create("TextLabel", {
			Position = UDim2.new(0.42, 32, 0, 4),
			Size = UDim2.new(0.58, -64, 1, -8),
			Parent = frame,
		})
		local forward = create("TextButton", {
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.fromScale(1, 0),
			Size = UDim2.fromOffset(28, 28),
			Text = ">",
			Parent = frame,
		}, { corner(6) })
		back.Activated:Connect(function()
			onStep(-1)
		end)
		forward.Activated:Connect(function()
			onStep(1)
		end)
		return { frame = frame, value = value, back = back, forward = forward }
	end

	local copRow = settingRow(3, "Cop pick", function(step)
		local options = Config.Settings.CopSelection.Options
		Net.ChangeSetting:FireServer("CopSelection", cycle(options, GameState:GetAttribute("CopSelection"), step))
	end)
	local chosenRow = settingRow(4, "Cop", function(step)
		local userIds = { 0 }
		for _, other in Players:GetPlayers() do
			table.insert(userIds, other.UserId)
		end
		Net.ChangeSetting:FireServer("ChosenCopUserId", cycle(userIds, GameState:GetAttribute("ChosenCopUserId"), step))
	end)
	local ammoRow = settingRow(5, "Ammo / prisoner", function(step)
		local current = GameState:GetAttribute("AmmoPerPlayer") or 0
		Net.ChangeSetting:FireServer("AmmoPerPlayer", current + step * Config.Settings.AmmoPerPlayer.Step)
	end)
	local timeRow = settingRow(6, "Round time", function(step)
		local current = GameState:GetAttribute("RoundTime") or 0
		Net.ChangeSetting:FireServer("RoundTime", current + step * Config.Settings.RoundTime.Step)
	end)
	local rows = { copRow, chosenRow, ammoRow, timeRow }

	local feedCount = 0
	Net.Notify.OnClientEvent:Connect(function(message: string)
		feedCount += 1
		local item = create("TextLabel", {
			LayoutOrder = feedCount,
			Size = UDim2.new(1, 0, 0, 24),
			Text = message,
			Font = Enum.Font.GothamMedium,
			TextStrokeTransparency = 0.5,
			Parent = feed,
		})

		local items = {}
		for _, child in feed:GetChildren() do
			if child:IsA("TextLabel") then
				table.insert(items, child)
			end
		end
		table.sort(items, function(a, b)
			return a.LayoutOrder < b.LayoutOrder
		end)
		for i = 1, #items - MAX_FEED do
			items[i]:Destroy()
		end

		task.delay(FEED_TIME, function()
			if item.Parent then
				local fade = TweenService:Create(item, TweenInfo.new(0.4), { TextTransparency = 1, TextStrokeTransparency = 1 })
				fade.Completed:Connect(function()
					item:Destroy()
				end)
				fade:Play()
			end
		end)
	end)

	local phaseChangedAt = os.clock()
	GameState:GetAttributeChangedSignal("Phase"):Connect(function()
		phaseChangedAt = os.clock()
	end)

	local function update()
		local phase = GameState:GetAttribute("Phase") or "Waiting"
		local now = Workspace:GetServerTimeNow()
		local remaining = (GameState:GetAttribute("PhaseEndsAt") or 0) - now
		local role = player:GetAttribute("Role")
		local status = player:GetAttribute("Status")
		local hostUserId = GameState:GetAttribute("HostUserId")
		local copName = playerName(GameState:GetAttribute("CopUserId"))
		local inRound = phase == "Countdown" or phase == "Playing"

		if phase == "Waiting" then
			statusLabel.Text = "WAITING FOR PLAYERS"
			infoLabel.Text = string.format("%d of %d players needed", #Players:GetPlayers(), Config.MinPlayers)
		elseif phase == "Intermission" then
			statusLabel.Text = "NEXT ROUND IN " .. formatTime(remaining)
			infoLabel.Text = "Host: " .. playerName(hostUserId)
		elseif phase == "Countdown" then
			statusLabel.Text = "GET READY " .. math.max(1, math.ceil(remaining))
			infoLabel.Text = "The Cop is " .. copName
		elseif phase == "Playing" then
			statusLabel.Text = formatTime(remaining)
			infoLabel.Text = string.format("Prisoners left: %d  |  Cop: %s", GameState:GetAttribute("PrisonersLeft") or 0, copName)
		else
			statusLabel.Text = "ROUND OVER"
			infoLabel.Text = GameState:GetAttribute("ResultText") or ""
		end

		local objective, objectiveColor = "", COLORS.Text
		if role == "Cop" and (inRound or phase == "Results") then
			objective, objectiveColor = "You are the COP. Shoot the prisoners before they get the stash out!", COLORS.Cop
		elseif role == "Prisoner" and (inRound or phase == "Results") then
			if status == "Escaped" then
				objective, objectiveColor = "You escaped with the stash!", COLORS.Good
			elseif status == "Caught" then
				objective, objectiveColor = "You were caught. Watch the rest from the lobby.", COLORS.Muted
			elseif player:GetAttribute("HasStash") then
				objective, objectiveColor = "You have the stash! Get back to the SAFE ZONE!", COLORS.Stash
			else
				objective, objectiveColor = "Run to the PRISON wall and grab the stash!", COLORS.Prisoner
			end
		elseif inRound then
			objective, objectiveColor = "Round in progress. You will play in the next one.", COLORS.Muted
		end
		objectiveLabel.Text = objective
		objectiveLabel.TextColor3 = objectiveColor
		objectiveLabel.Visible = objective ~= ""

		local bannerText: string? = nil
		local bannerColor = COLORS.Text
		if phase == "Countdown" and role == "Cop" then
			bannerText, bannerColor = "YOU ARE THE COP", COLORS.Cop
		elseif phase == "Countdown" and role == "Prisoner" then
			bannerText, bannerColor = "YOU ARE A PRISONER", COLORS.Prisoner
		elseif phase == "Playing" and role and os.clock() - phaseChangedAt < 1.5 then
			bannerText, bannerColor = "GO!", COLORS.Good
		elseif phase == "Results" then
			local winner = GameState:GetAttribute("Winner")
			if winner == "Prisoners" then
				bannerText, bannerColor = "PRISONERS WIN!", COLORS.Prisoner
			elseif winner == "Cop" then
				bannerText, bannerColor = "THE COP WINS!", COLORS.Cop
			else
				bannerText = "ROUND OVER"
			end
		end
		banner.Visible = bannerText ~= nil
		banner.Text = bannerText or ""
		banner.TextColor3 = bannerColor

		local showAmmo = role == "Cop" and inRound
		ammoLabel.Visible = showAmmo
		if showAmmo then
			local ammo = player:GetAttribute("Ammo") or 0
			ammoLabel.Text = if ammo > 0 then "AMMO: " .. ammo else "NO AMMO! Grab the red ammo boxes"
		end

		local showSkills = role == "Prisoner" and status == "Active" and inRound
		skillBar.Visible = showSkills
		shieldLabel.Visible = showSkills and player:GetAttribute("Shield") == true
		if showSkills then
			for skill, entry in skillButtons do
				local left = Controls.getReadyAt(skill) - now
				if left > 0 then
					entry.overlay.Size = UDim2.fromScale(1, math.clamp(left / entry.cooldown, 0, 1))
					entry.timer.Text = string.format("%.1f", left)
				else
					entry.overlay.Size = UDim2.fromScale(1, 0)
					entry.timer.Text = ""
				end
			end
		end

		local showSettings = phase == "Waiting" or phase == "Intermission"
		settingsPanel.Visible = showSettings
		if showSettings then
			local isHost = hostUserId == player.UserId
			hostLabel.Text = if isHost then "You are the host. Use the arrows." else "Host: " .. playerName(hostUserId)
			local selection = GameState:GetAttribute("CopSelection")
			local chosen = GameState:GetAttribute("ChosenCopUserId")
			copRow.value.Text = selection or "?"
			chosenRow.frame.Visible = selection == "Choose"
			chosenRow.value.Text = if chosen and chosen ~= 0 then playerName(chosen) else "Random"
			ammoRow.value.Text = tostring(GameState:GetAttribute("AmmoPerPlayer") or "?")
			timeRow.value.Text = formatTime(GameState:GetAttribute("RoundTime") or 0)
			for _, row in rows do
				row.back.Visible = isHost
				row.forward.Visible = isHost
			end
		end
	end

	RunService.RenderStepped:Connect(update)
end

return Hud

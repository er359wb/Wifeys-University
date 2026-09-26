local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local Shared = ReplicatedStorage:WaitForChild("Shared")
local Config = require(Shared:WaitForChild("Config"))
local Net = require(Shared:WaitForChild("Net"))

local player = Players.LocalPlayer
local mouse = player:GetMouse()

local Controls = {}

-- Covers the gap between pressing a skill and the server's cooldown attribute reaching this client.
local PRESS_LOCKOUT = 0.5

local lockedUntil: { [string]: number } = { Sprint = 0, Drift = 0 }
local lastShot = 0
local hookedTools: { [Tool]: boolean } = setmetatable({}, { __mode = "k" }) :: any

local function isActivePrisoner(): boolean
	return Net.GameState:GetAttribute("Phase") == "Playing"
		and player:GetAttribute("Role") == "Prisoner"
		and player:GetAttribute("Status") == "Active"
end

function Controls.getReadyAt(skill: string): number
	return math.max(lockedUntil[skill] or 0, player:GetAttribute(skill .. "ReadyAt") or 0)
end

-- A short slide in the direction you are moving that you can steer while it lasts.
local function drift()
	local character = player.Character
	if not character then
		return
	end
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	local root = character:FindFirstChild("HumanoidRootPart") :: BasePart?
	if not humanoid or not root or humanoid.Health <= 0 then
		return
	end

	local settings = Config.Prisoner.Drift
	local direction = humanoid.MoveDirection
	if direction.Magnitude < 0.1 then
		direction = root.CFrame.LookVector
	end
	direction = Vector3.new(direction.X, 0, direction.Z)
	if direction.Magnitude < 0.01 then
		return
	end
	direction = direction.Unit

	local attachment = root:FindFirstChild("RootAttachment") :: Attachment?
	if not attachment then
		local created = Instance.new("Attachment")
		created.Name = "RootAttachment"
		created.Parent = root
		attachment = created
	end

	-- Plane mode only drives horizontal velocity, so gravity and jumping still work during the drift.
	local velocity = Instance.new("LinearVelocity")
	velocity.Name = "Drift"
	velocity.Attachment0 = attachment
	velocity.RelativeTo = Enum.ActuatorRelativeTo.World
	velocity.VelocityConstraintMode = Enum.VelocityConstraintMode.Plane
	velocity.PrimaryTangentAxis = Vector3.xAxis
	velocity.SecondaryTangentAxis = Vector3.zAxis
	velocity.MaxForce = 1e5
	velocity.PlaneVelocity = Vector2.new(direction.X, direction.Z) * settings.StartSpeed
	velocity.Parent = root

	local started = os.clock()
	local connection: RBXScriptConnection
	connection = RunService.Heartbeat:Connect(function(dt)
		local progress = (os.clock() - started) / settings.Duration
		if progress >= 1 or humanoid.Health <= 0 or not velocity.Parent then
			connection:Disconnect()
			velocity:Destroy()
			return
		end

		local move = humanoid.MoveDirection
		local steer = Vector3.new(move.X, 0, move.Z)
		if steer.Magnitude > 0.1 then
			local turned = direction:Lerp(steer.Unit, math.min(1, settings.TurnRate * dt))
			if turned.Magnitude > 0.01 then
				direction = turned.Unit
			end
		end
		local speed = settings.StartSpeed + (settings.EndSpeed - settings.StartSpeed) * progress
		velocity.PlaneVelocity = Vector2.new(direction.X, direction.Z) * speed
	end)
end

function Controls.useSkill(skill: string)
	if not isActivePrisoner() then
		return
	end
	local now = Workspace:GetServerTimeNow()
	if now < Controls.getReadyAt(skill) then
		return
	end
	lockedUntil[skill] = now + PRESS_LOCKOUT
	Net.UseSkill:FireServer(skill)
	if skill == "Drift" then
		drift()
	end
end

local function getAimPoint(): Vector3
	local ray = mouse.UnitRay
	local params = RaycastParams.new()
	params.FilterType = Enum.RaycastFilterType.Exclude
	params.FilterDescendantsInstances = if player.Character then { player.Character } else {}
	local result = Workspace:Raycast(ray.Origin, ray.Direction * 1000, params)
	return if result then result.Position else ray.Origin + ray.Direction * 1000
end

local function hookGun(tool: Tool)
	if hookedTools[tool] then
		return
	end
	hookedTools[tool] = true
	tool.Activated:Connect(function()
		local now = os.clock()
		if now - lastShot < Config.Gun.FireCooldown then
			return
		end
		lastShot = now
		Net.FireGun:FireServer(getAimPoint())
	end)
end

local function watchCharacter(character: Model)
	local function check(child: Instance)
		if child:IsA("Tool") and child:GetAttribute("CopGun") then
			hookGun(child)
		end
	end
	for _, child in character:GetChildren() do
		check(child)
	end
	character.ChildAdded:Connect(check)
end

local function onInput(input: InputObject, processed: boolean)
	if processed then
		return
	end
	local sprint = Config.Prisoner.Sprint
	local driftSettings = Config.Prisoner.Drift
	if input.KeyCode == sprint.Key or input.KeyCode == sprint.GamepadButton then
		Controls.useSkill("Sprint")
	elseif input.KeyCode == driftSettings.Key or input.KeyCode == driftSettings.GamepadButton then
		Controls.useSkill("Drift")
	end
end

function Controls.init()
	UserInputService.InputBegan:Connect(onInput)
	player.CharacterAdded:Connect(watchCharacter)
	if player.Character then
		watchCharacter(player.Character)
	end
end

return Controls

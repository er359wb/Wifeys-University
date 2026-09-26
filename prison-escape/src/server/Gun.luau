local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local Config = require(ReplicatedStorage.Shared.Config)
local Net = require(ReplicatedStorage.Shared.Net)
local Arena = require(script.Parent.Arena)
local Skills = require(script.Parent.Skills)

local Gun = {}

type Bullet = {
	id: number,
	position: Vector3,
	velocity: Vector3,
	traveled: number,
	params: RaycastParams,
}

local bullets: { Bullet } = {}
local lastShot: { [Player]: number } = {}
local nextId = 0

local function isFiniteVector(vector: Vector3): boolean
	for _, n in { vector.X, vector.Y, vector.Z } do
		if n ~= n or math.abs(n) == math.huge then
			return false
		end
	end
	return true
end

function Gun.create(): Tool
	local tool = Instance.new("Tool")
	tool.Name = "Gun"
	tool.ToolTip = "Shoot the prisoners"
	tool.CanBeDropped = false
	tool.Grip = CFrame.new(0, -0.45, 0.45)
	tool:SetAttribute("CopGun", true)

	local handle = Instance.new("Part")
	handle.Name = "Handle"
	handle.Size = Vector3.new(0.35, 0.45, 1.6)
	handle.Material = Enum.Material.Metal
	handle.Color = Color3.fromRGB(35, 35, 40)
	handle.CanCollide = false
	handle.Massless = true
	handle.Parent = tool

	local grip = Instance.new("Part")
	grip.Name = "GripPart"
	grip.Size = Vector3.new(0.3, 0.75, 0.4)
	grip.Color = Color3.fromRGB(70, 45, 30)
	grip.CanCollide = false
	grip.Massless = true
	grip.Parent = tool

	local weld = Instance.new("Weld")
	weld.Part0 = handle
	weld.Part1 = grip
	weld.C0 = CFrame.new(0, -0.45, 0.45) * CFrame.Angles(math.rad(-15), 0, 0)
	weld.Parent = grip

	local muzzle = Instance.new("Attachment")
	muzzle.Name = "Muzzle"
	muzzle.Position = Vector3.new(0, 0.05, -0.85)
	muzzle.Parent = handle

	return tool
end

local function hitPlayer(victim: Player, character: Model)
	if not Skills.isActivePrisoner(victim) then
		return
	end
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	local root = character:FindFirstChild("HumanoidRootPart") :: BasePart?
	if not humanoid or not root or humanoid.Health <= 0 then
		return
	end
	if Arena.isInSafeZone(root.Position) then
		return
	end
	if Skills.consumeShield(victim) then
		Net.Notify:FireAllClients(victim.DisplayName .. "'s shield blocked a bullet!")
		return
	end
	humanoid:TakeDamage(Config.Gun.Damage)
end

local function finish(bullet: Bullet, position: Vector3, hit: Instance?)
	Net.BulletEnded:FireAllClients(bullet.id, position, hit ~= nil)
	if not hit then
		return
	end
	local model = hit:FindFirstAncestorOfClass("Model")
	local victim = if model then Players:GetPlayerFromCharacter(model) else nil
	if model and victim then
		hitPlayer(victim, model)
	end
end

local function onFire(player: Player, aimPoint: any)
	if typeof(aimPoint) ~= "Vector3" or not isFiniteVector(aimPoint) then
		return
	end
	if Net.GameState:GetAttribute("Phase") ~= "Playing" or player:GetAttribute("Role") ~= "Cop" then
		return
	end

	local character = player.Character
	if not character then
		return
	end
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	local head = character:FindFirstChild("Head") :: BasePart?
	local tool = character:FindFirstChildOfClass("Tool")
	if not humanoid or humanoid.Health <= 0 or not head or not tool or not tool:GetAttribute("CopGun") then
		return
	end

	local ammo = player:GetAttribute("Ammo") or 0
	if ammo <= 0 then
		return
	end
	-- Remote events can bunch up in transit, so allow shots slightly faster than the client-side cooldown.
	local now = os.clock()
	if now - (lastShot[player] or 0) < Config.Gun.FireCooldown * 0.8 then
		return
	end
	lastShot[player] = now
	player:SetAttribute("Ammo", ammo - 1)

	local muzzle = tool:FindFirstChild("Muzzle", true)
	local origin = if muzzle and muzzle:IsA("Attachment") then muzzle.WorldPosition else head.Position
	local direction = aimPoint - origin
	if direction.Magnitude < 0.1 then
		direction = head.CFrame.LookVector
	end

	local params = RaycastParams.new()
	params.FilterType = Enum.RaycastFilterType.Exclude
	params.FilterDescendantsInstances = { character }
	params.CollisionGroup = Arena.BULLET_GROUP
	params.IgnoreWater = true

	nextId += 1
	local bullet: Bullet = {
		id = nextId,
		position = origin,
		velocity = direction.Unit * Config.Gun.BulletSpeed,
		traveled = 0,
		params = params,
	}
	Net.BulletFired:FireAllClients(bullet.id, origin, bullet.velocity)

	-- Stops the gun from shooting through a wall when its barrel is poking through it.
	local blocked = Workspace:Raycast(head.Position, origin - head.Position, params)
	if blocked then
		finish(bullet, blocked.Position, blocked.Instance)
	else
		table.insert(bullets, bullet)
	end
end

local function step(dt: number)
	local range = Config.Gun.BulletRange
	for i = #bullets, 1, -1 do
		local bullet = bullets[i]
		local move = bullet.velocity * dt
		local remaining = range - bullet.traveled
		if move.Magnitude > remaining then
			move = move.Unit * remaining
		end

		local result = Workspace:Raycast(bullet.position, move, bullet.params)
		if result then
			table.remove(bullets, i)
			finish(bullet, result.Position, result.Instance)
		else
			bullet.position += move
			bullet.traveled += move.Magnitude
			if bullet.traveled >= range - 0.01 then
				table.remove(bullets, i)
				finish(bullet, bullet.position, nil)
			end
		end
	end
end

function Gun.clear()
	for _, bullet in bullets do
		Net.BulletEnded:FireAllClients(bullet.id, bullet.position, false)
	end
	table.clear(bullets)
	table.clear(lastShot)
end

function Gun.init()
	Net.FireGun.OnServerEvent:Connect(onFire)
	RunService.Heartbeat:Connect(step)
	Players.PlayerRemoving:Connect(function(player)
		lastShot[player] = nil
	end)
end

return Gun

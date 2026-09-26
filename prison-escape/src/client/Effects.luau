local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")

local Shared = ReplicatedStorage:WaitForChild("Shared")
local Config = require(Shared:WaitForChild("Config"))
local Net = require(Shared:WaitForChild("Net"))

local Effects = {}

local TRACER_COLOR = Color3.fromRGB(255, 230, 120)

type Tracer = {
	part: BasePart,
	origin: Vector3,
	direction: Vector3,
	rotation: CFrame,
	speed: number,
	started: number,
	maxDistance: number,
	hit: boolean,
}

local tracers: { [number]: Tracer } = {}
local spinning: { [BasePart]: CFrame } = {}
local folder: Folder

local function effectPart(size: Vector3): Part
	local part = Instance.new("Part")
	part.Anchored = true
	part.CanCollide = false
	part.CanQuery = false
	part.CanTouch = false
	part.CastShadow = false
	part.Material = Enum.Material.Neon
	part.Color = TRACER_COLOR
	part.Size = size
	return part
end

local function impact(position: Vector3)
	local spark = effectPart(Vector3.new(0.6, 0.6, 0.6))
	spark.Shape = Enum.PartType.Ball
	spark.Position = position
	spark.Parent = folder
	local tween = TweenService:Create(spark, TweenInfo.new(0.25), { Size = Vector3.new(2.2, 2.2, 2.2), Transparency = 1 })
	tween.Completed:Connect(function()
		spark:Destroy()
	end)
	tween:Play()
end

-- The server simulates bullets for hits; clients draw them locally so they move smoothly.
local function onBulletFired(id: number, origin: Vector3, velocity: Vector3)
	local direction = velocity.Unit
	local up = if math.abs(direction.Y) > 0.99 then Vector3.xAxis else Vector3.yAxis
	local rotation = CFrame.lookAt(Vector3.zero, direction, up)
	local part = effectPart(Vector3.new(0.2, 0.2, 3))
	part.CFrame = rotation + origin
	part.Parent = folder
	tracers[id] = {
		part = part,
		origin = origin,
		direction = direction,
		rotation = rotation,
		speed = velocity.Magnitude,
		started = os.clock(),
		maxDistance = Config.Gun.BulletRange,
		hit = false,
	}
end

local function onBulletEnded(id: number, position: Vector3, hit: boolean)
	local tracer = tracers[id]
	if tracer then
		tracer.maxDistance = (position - tracer.origin).Magnitude
		tracer.hit = hit
	end
end

local function updateTracers()
	local now = os.clock()
	for id, tracer in tracers do
		local distance = (now - tracer.started) * tracer.speed
		if distance >= tracer.maxDistance then
			if tracer.hit then
				impact(tracer.origin + tracer.direction * tracer.maxDistance)
			end
			tracer.part:Destroy()
			tracers[id] = nil
		else
			tracer.part.CFrame = tracer.rotation + (tracer.origin + tracer.direction * distance)
		end
	end
end

local function updatePickups()
	local t = os.clock()
	local bob = Vector3.new(0, math.sin(t * 2) * 0.35, 0)
	local spin = CFrame.Angles(0, t * 1.5, 0)
	for part, base in spinning do
		part.CFrame = CFrame.new(base.Position + bob) * spin * base.Rotation
	end
end

local function watchPickups()
	local pickups = Workspace:WaitForChild("PrisonArena"):WaitForChild("Pickups")
	local function add(child: Instance)
		if child:IsA("BasePart") then
			spinning[child] = child.CFrame
		end
	end
	for _, child in pickups:GetChildren() do
		add(child)
	end
	pickups.ChildAdded:Connect(add)
	pickups.ChildRemoved:Connect(function(child)
		if child:IsA("BasePart") then
			spinning[child] = nil
		end
	end)
end

function Effects.init()
	folder = Instance.new("Folder")
	folder.Name = "PrisonEscapeEffects"
	folder.Parent = Workspace

	Net.BulletFired.OnClientEvent:Connect(onBulletFired)
	Net.BulletEnded.OnClientEvent:Connect(onBulletEnded)
	RunService.RenderStepped:Connect(function()
		updateTracers()
		updatePickups()
	end)
	task.spawn(watchPickups)
end

return Effects

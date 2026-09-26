local PhysicsService = game:GetService("PhysicsService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local Config = require(ReplicatedStorage.Shared.Config)

local Arena = {
	COP_GROUP = "Cop",
	BARRIER_GROUP = "CopBarrier",
	BULLET_GROUP = "Bullet",

	Model = (nil :: any) :: Model,
	SafeZone = (nil :: any) :: BasePart,
	StashZone = (nil :: any) :: BasePart,
	FieldFloor = (nil :: any) :: BasePart,
	CopSpawn = (nil :: any) :: BasePart,
	PrisonerSpawns = (nil :: any) :: Instance,
	LobbySpawn = (nil :: any) :: SpawnLocation,
	PickupFolder = (nil :: any) :: Folder,
}

local W = Config.Arena.FieldWidth
local L = Config.Arena.FieldLength
local SAFE = Config.Arena.SafeZoneDepth
local STASH = Config.Arena.StashZoneDepth
local H = Config.Arena.WallHeight

local HALF_W = W / 2
local FIELD_START = -L / 2
local FIELD_END = L / 2
local BACK = FIELD_START - SAFE
local FLOOR = 0.5
local ZONE_TOP = H + 20

-- x as a fraction of half the field width, z as a fraction of half the field length.
local COVER_LAYOUT = {
	{ -0.55, -0.62, "Crate" },
	{ 0.15, -0.66, "Wall" },
	{ 0.7, -0.58, "Crate" },
	{ -0.2, -0.32, "Wall" },
	{ 0.45, -0.28, "Crate" },
	{ -0.72, -0.05, "Wall" },
	{ 0.02, 0, "Crate" },
	{ 0.62, 0.04, "Wall" },
	{ -0.38, 0.3, "Crate" },
	{ 0.28, 0.33, "Wall" },
	{ -0.62, 0.6, "Wall" },
	{ -0.05, 0.62, "Crate" },
	{ 0.58, 0.6, "Crate" },
}

local obstacleParams = RaycastParams.new()
obstacleParams.FilterType = Enum.RaycastFilterType.Exclude

local function box(parent: Instance, name: string, min: Vector3, max: Vector3, props: { [string]: any }?): Part
	local part = Instance.new("Part")
	part.Name = name
	part.Anchored = true
	part.Size = max - min
	part.Position = (min + max) / 2
	part.TopSurface = Enum.SurfaceType.Smooth
	part.BottomSurface = Enum.SurfaceType.Smooth
	if props then
		for key, value in props do
			(part :: any)[key] = value
		end
	end
	part.Parent = parent
	return part
end

local HIDDEN = {
	Transparency = 1,
	CanCollide = false,
	CanQuery = false,
	CanTouch = false,
	CastShadow = false,
}

local function zone(parent: Instance, name: string, min: Vector3, max: Vector3): Part
	return box(parent, name, min, max, HIDDEN)
end

local function marker(parent: Instance, name: string, cframe: CFrame): Part
	local part = box(parent, name, Vector3.new(-1, -0.5, -1), Vector3.new(1, 0.5, 1), HIDDEN)
	part.CFrame = cframe
	return part
end

local function sign(parent: Instance, cframe: CFrame, size: Vector3, text: string, color: Color3)
	local part = box(parent, "Sign", -size / 2, size / 2, {
		Color = Color3.fromRGB(25, 25, 30),
		Material = Enum.Material.SmoothPlastic,
		CanCollide = false,
	})
	part.CFrame = cframe

	local gui = Instance.new("SurfaceGui")
	gui.Face = Enum.NormalId.Front
	gui.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
	gui.PixelsPerStud = 25
	gui.LightInfluence = 0
	gui.Parent = part

	local label = Instance.new("TextLabel")
	label.Size = UDim2.fromScale(1, 1)
	label.BackgroundTransparency = 1
	label.Text = text
	label.TextColor3 = color
	label.TextScaled = true
	label.Font = Enum.Font.FredokaOne
	label.Parent = gui
end

local function buildDefault(): Model
	local model = Instance.new("Model")
	model.Name = "PrisonArena"

	local concrete = { Material = Enum.Material.Concrete, Color = Color3.fromRGB(150, 150, 155) }

	box(model, "SafeFloor", Vector3.new(-HALF_W, -0.5, BACK), Vector3.new(HALF_W, FLOOR, FIELD_START), {
		Material = Enum.Material.SmoothPlastic,
		Color = Color3.fromRGB(45, 120, 200),
	})
	box(model, "FieldFloor", Vector3.new(-HALF_W, -0.5, FIELD_START), Vector3.new(HALF_W, FLOOR, FIELD_END - STASH), {
		Material = Enum.Material.Grass,
		Color = Color3.fromRGB(90, 150, 75),
	})
	box(model, "StashFloor", Vector3.new(-HALF_W, -0.5, FIELD_END - STASH), Vector3.new(HALF_W, FLOOR, FIELD_END), {
		Material = Enum.Material.Neon,
		Color = Color3.fromRGB(255, 205, 50),
	})

	box(model, "WestWall", Vector3.new(-HALF_W - 2, -0.5, BACK - 2), Vector3.new(-HALF_W, H, FIELD_END), concrete)
	box(model, "EastWall", Vector3.new(HALF_W, -0.5, BACK - 2), Vector3.new(HALF_W + 2, H, FIELD_END), concrete)
	box(model, "SouthWall", Vector3.new(-HALF_W - 2, -0.5, BACK - 2), Vector3.new(HALF_W + 2, H, BACK), concrete)

	-- This is the "opposite wall" the prisoners have to reach.
	box(model, "PrisonWall", Vector3.new(-HALF_W - 2, -0.5, FIELD_END), Vector3.new(HALF_W + 2, H + 8, FIELD_END + 6), {
		Material = Enum.Material.Brick,
		Color = Color3.fromRGB(120, 118, 115),
	})
	box(model, "PrisonGate", Vector3.new(-9, FLOOR, FIELD_END - 0.4), Vector3.new(9, 15, FIELD_END), {
		Material = Enum.Material.DiamondPlate,
		Color = Color3.fromRGB(55, 55, 60),
	})
	for i = 0, 8 do
		local x = -8 + i * 2
		box(model, "GateBar", Vector3.new(x - 0.2, FLOOR, FIELD_END - 1), Vector3.new(x + 0.2, 15, FIELD_END - 0.4), {
			Material = Enum.Material.Metal,
			Color = Color3.fromRGB(30, 30, 35),
		})
	end
	sign(model, CFrame.new(0, H - 2, FIELD_END - 0.5), Vector3.new(40, 8, 1), "PRISON", Color3.fromRGB(255, 90, 80))
	sign(
		model,
		CFrame.new(0, H - 6, BACK + 0.5) * CFrame.Angles(0, math.pi, 0),
		Vector3.new(36, 7, 1),
		"SAFE ZONE",
		Color3.fromRGB(110, 200, 255)
	)

	-- Only the Cop collides with this, so prisoners walk through and bullets fly through.
	box(model, "CopBarrier", Vector3.new(-HALF_W, FLOOR, FIELD_START - 1), Vector3.new(HALF_W, ZONE_TOP, FIELD_START), {
		Material = Enum.Material.ForceField,
		Color = Color3.fromRGB(90, 190, 255),
		CollisionGroup = Arena.BARRIER_GROUP,
		CastShadow = false,
	})

	zone(model, "SafeZone", Vector3.new(-HALF_W, FLOOR, BACK), Vector3.new(HALF_W, ZONE_TOP, FIELD_START))
	zone(model, "StashZone", Vector3.new(-HALF_W, FLOOR, FIELD_END - STASH), Vector3.new(HALF_W, ZONE_TOP, FIELD_END))

	local cover = Instance.new("Folder")
	cover.Name = "Cover"
	cover.Parent = model
	for _, entry in COVER_LAYOUT do
		local center = Vector3.new(entry[1] * HALF_W, FLOOR, entry[2] * L / 2)
		if entry[3] == "Crate" then
			box(cover, "Crate", center + Vector3.new(-3.5, 0, -3.5), center + Vector3.new(3.5, 7, 3.5), {
				Material = Enum.Material.WoodPlanks,
				Color = Color3.fromRGB(150, 105, 60),
			})
		else
			box(cover, "Wall", center + Vector3.new(-9, 0, -1), center + Vector3.new(9, 7, 1), concrete)
		end
	end

	local copPosition = Vector3.new(0, FLOOR, FIELD_END - STASH - 20)
	marker(model, "CopSpawn", CFrame.lookAt(copPosition, copPosition - Vector3.zAxis))

	local prisonerSpawns = Instance.new("Folder")
	prisonerSpawns.Name = "PrisonerSpawns"
	prisonerSpawns.Parent = model
	for i = 1, 8 do
		local position = Vector3.new(-HALF_W + (i - 0.5) * W / 8, FLOOR, FIELD_START - SAFE / 2)
		marker(prisonerSpawns, "PrisonerSpawn", CFrame.lookAt(position, position + Vector3.zAxis))
	end

	-- The lobby sits on a building beside the yard so players who are out can watch the round.
	box(model, "LobbyBuilding", Vector3.new(HALF_W + 2, -0.5, -40), Vector3.new(HALF_W + 40, H, 40), {
		Material = Enum.Material.Concrete,
		Color = Color3.fromRGB(95, 100, 110),
	})
	box(model, "LobbyGlass", Vector3.new(HALF_W, H, -40), Vector3.new(HALF_W + 1, H + 16, 40), {
		Material = Enum.Material.Glass,
		Color = Color3.fromRGB(170, 220, 255),
		Transparency = 0.6,
		CastShadow = false,
	})
	box(model, "LobbyWall", Vector3.new(HALF_W + 39, H, -40), Vector3.new(HALF_W + 40, H + 12, 40), concrete)
	box(model, "LobbyWall", Vector3.new(HALF_W, H, 39), Vector3.new(HALF_W + 40, H + 12, 40), concrete)
	box(model, "LobbyWall", Vector3.new(HALF_W, H, -40), Vector3.new(HALF_W + 40, H + 12, -39), concrete)

	local spawn = Instance.new("SpawnLocation")
	spawn.Name = "LobbySpawn"
	spawn.Anchored = true
	spawn.Size = Vector3.new(12, 1, 12)
	spawn.Position = Vector3.new(HALF_W + 22, H + 0.5, 0)
	spawn.Duration = 0
	spawn.Neutral = true
	spawn.AllowTeamChangeOnTouch = false
	spawn.TopSurface = Enum.SurfaceType.Smooth
	spawn.BottomSurface = Enum.SurfaceType.Smooth
	spawn.Parent = model

	model.Parent = Workspace
	return model
end

local function registerCollisionGroups()
	for _, name in { Arena.COP_GROUP, Arena.BARRIER_GROUP, Arena.BULLET_GROUP } do
		if not PhysicsService:IsCollisionGroupRegistered(name) then
			PhysicsService:RegisterCollisionGroup(name)
		end
	end
	PhysicsService:CollisionGroupSetCollidable(Arena.BARRIER_GROUP, "Default", false)
	PhysicsService:CollisionGroupSetCollidable(Arena.BARRIER_GROUP, Arena.BULLET_GROUP, false)
end

-- Uses a model named PrisonArena if the place already has one, so the map can be rebuilt by hand in Studio.
function Arena.build()
	registerCollisionGroups()

	local model = Workspace:FindFirstChild("PrisonArena") :: Model?
	if not model then
		model = buildDefault()
	end
	assert(model)

	Arena.Model = model
	Arena.SafeZone = model:WaitForChild("SafeZone") :: BasePart
	Arena.StashZone = model:WaitForChild("StashZone") :: BasePart
	Arena.FieldFloor = model:WaitForChild("FieldFloor") :: BasePart
	Arena.CopSpawn = model:WaitForChild("CopSpawn") :: BasePart
	Arena.PrisonerSpawns = model:WaitForChild("PrisonerSpawns")
	Arena.LobbySpawn = model:WaitForChild("LobbySpawn") :: SpawnLocation

	local pickups = model:FindFirstChild("Pickups") :: Folder?
	if not pickups then
		local folder = Instance.new("Folder")
		folder.Name = "Pickups"
		folder.Parent = model
		pickups = folder
	end
	assert(pickups)
	Arena.PickupFolder = pickups
	obstacleParams.FilterDescendantsInstances = { pickups }
end

local function isInside(zonePart: BasePart, position: Vector3): boolean
	local offset = zonePart.CFrame:PointToObjectSpace(position)
	local half = zonePart.Size / 2
	return math.abs(offset.X) <= half.X and math.abs(offset.Y) <= half.Y and math.abs(offset.Z) <= half.Z
end

function Arena.isInSafeZone(position: Vector3): boolean
	return isInside(Arena.SafeZone, position)
end

function Arena.isInStashZone(position: Vector3): boolean
	return isInside(Arena.StashZone, position)
end

function Arena.prisonerSpawnCFrames(): { CFrame }
	local cframes = {}
	for _, child in Arena.PrisonerSpawns:GetChildren() do
		if child:IsA("BasePart") then
			table.insert(cframes, child.CFrame)
		end
	end
	return cframes
end

function Arena.randomFieldPoint(rng: Random): Vector3?
	local floor = Arena.FieldFloor
	local size = floor.Size
	for _ = 1, 25 do
		local offset = Vector3.new(rng:NextNumber(-0.45, 0.45) * size.X, size.Y / 2, rng:NextNumber(-0.42, 0.42) * size.Z)
		local top = floor.CFrame:PointToWorldSpace(offset)
		local result = Workspace:Raycast(top + Vector3.new(0, 40, 0), Vector3.new(0, -45, 0), obstacleParams)
		if result and result.Instance == floor then
			return result.Position
		end
	end
	return nil
end

return Arena

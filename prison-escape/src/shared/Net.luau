local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local IS_SERVER = RunService:IsServer()

local function getOrCreate(parent: Instance, className: string, name: string): Instance
	if not IS_SERVER then
		return parent:WaitForChild(name)
	end
	local existing = parent:FindFirstChild(name)
	if existing then
		return existing
	end
	local instance = Instance.new(className)
	instance.Name = name
	instance.Parent = parent
	return instance
end

local remotes = getOrCreate(ReplicatedStorage, "Folder", "PrisonEscapeRemotes")

local function remote(name: string): RemoteEvent
	return getOrCreate(remotes, "RemoteEvent", name) :: RemoteEvent
end

return {
	-- Round and lobby state lives in attributes on this object so every client sees it.
	GameState = getOrCreate(ReplicatedStorage, "Configuration", "PrisonEscapeState") :: Configuration,

	FireGun = remote("FireGun"),
	UseSkill = remote("UseSkill"),
	ChangeSetting = remote("ChangeSetting"),
	BulletFired = remote("BulletFired"),
	BulletEnded = remote("BulletEnded"),
	Notify = remote("Notify"),
}

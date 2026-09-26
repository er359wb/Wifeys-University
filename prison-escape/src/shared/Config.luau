local Config = {
	MinPlayers = 2,
	IntermissionTime = 20,
	CountdownTime = 5,
	ResultsTime = 7,

	-- Defaults and limits for the settings the lobby host can change between rounds.
	Settings = {
		-- "Random": any player can become the Cop. "Choose": the host picks the Cop.
		CopSelection = { Default = "Random", Options = { "Random", "Choose" } },
		-- The Cop starts with AmmoPerPlayer x (number of prisoners) bullets.
		AmmoPerPlayer = { Default = 2, Min = 1, Max = 10, Step = 1 },
		RoundTime = { Default = 120, Min = 60, Max = 300, Step = 15 },
	},

	Arena = {
		FieldWidth = 140,
		FieldLength = 240,
		SafeZoneDepth = 30,
		StashZoneDepth = 6,
		WallHeight = 24,
	},

	Gun = {
		FireCooldown = 0.4,
		BulletSpeed = 160,
		BulletRange = 600,
		Damage = 100,
	},

	Cop = {
		WalkSpeed = 16,
	},

	Prisoner = {
		WalkSpeed = 16,
		Sprint = {
			Key = Enum.KeyCode.Q,
			GamepadButton = Enum.KeyCode.ButtonX,
			Cooldown = 8,
			Duration = 3,
			SpeedBonus = 12,
		},
		Drift = {
			Key = Enum.KeyCode.E,
			GamepadButton = Enum.KeyCode.ButtonY,
			Cooldown = 5,
			Duration = 0.45,
			StartSpeed = 70,
			EndSpeed = 28,
			TurnRate = 5,
		},
	},

	Pickups = {
		AmmoOnField = 3,
		AmmoPerPickup = 2,
		SkillsOnField = 5,
		SkillKinds = { "Speed", "Recharge", "Shield" },
		RespawnTime = 12,
		CollectRadius = 4,
		SpeedBoost = { Duration = 5, SpeedBonus = 10 },
	},
}

return Config

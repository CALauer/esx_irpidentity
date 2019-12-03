Config = {}
Config.Locale = 'en'

Config.Marker = {
	r = 57, g = 170, b = 255, a = 75,  -- red color
	x = 2.0, y = 2.0, z = 1.0,       -- tiny, cylinder formed circle
	DrawDistance = 15.0, Type = 1    -- default circle type, low draw distance due to indoors area
}

Spawn = {
	["medical_center"] = {
		position = { x = 339.19, y = -1394.63, z = 32.51 },
		reward = math.random(5000, 35000),
		nameOfLocation = "Medical Center"
	},
}

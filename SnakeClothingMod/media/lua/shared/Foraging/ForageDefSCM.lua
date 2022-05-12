require "Foraging/forageDefinitions"

if forageDefs then

	-- Toys
	forageDefs.CowToy = {
		type = "Base.CowToy",
		xp = 25,
		chance      = 3,
		categories = { "Junk" },
		zones = {
			TrailerPark = 5,
			TownZone    = 5,
			Nav         = 1,
		},
		forceOutside = false,
		canBeAboveFloor = true,
	}

	forageDefs.SafeToy = {
		type = "Base.SafeToy",
		xp = 25,
		chance      = 3,
		categories = { "Junk" },
		zones = {
			TrailerPark = 5,
			TownZone    = 5,
			Nav         = 1,
		},
		forceOutside = false,
		canBeAboveFloor = true,
	}

	forageDefs.HorseToy = {
		type = "Base.HorseToy",
		xp = 25,
		chance      = 3,
		categories = { "Junk" },
		zones = {
			TrailerPark = 5,
			TownZone    = 5,
			Nav         = 1,
		},
		forceOutside = false,
		canBeAboveFloor = true,
	}
end
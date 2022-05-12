require "NPCS/ZombiesZoneDefinition";
-- name of the zone for the zone type ZombiesType (in worldzed)
ZombiesZoneDefinition.Gambling = {
	Waiter_Classy = {
		-- name of the outfit
		name="Waiter_Classy",
		-- number to spawn
		toSpawn=5,
		-- we will be forced to spawn this one
		mandatory="true",
		-- need to be in that exact room
		chance=200,
	},
	Classy = {
		name="Classy",
		chance=150,
		toSpawn=5,
	},
	Tourist = {
		name="Tourist",
		chance=100,
		toSpawn=5,
	},
};
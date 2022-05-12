require "NPCS/ZombiesZoneDefinition";
-- name of the zone for the zone type ZombiesType (in worldzed)
ZombiesZoneDefinition.Hazard = {
	HazardSuit = {
		-- name of the outfit
		name="HazardSuit",
		-- number to spawn
		toSpawn=10,
		-- we will be forced to spawn this one
		mandatory="true",
		-- need to be in that exact room
		chance=100,
	},
	DoctorM = {
		name="Doctor",
		toSpawn=5,
		mandatory="true",
	},
	Doctor = {
		name="Doctor",
		chance=25,
	},
	Nurse = {
		name="Nurse",
		toSpawn=5,
		mandatory="true",
		chance=30,
	},
};
ZombiesZoneDefinition.ArmyGeneral = {
	ArmyServiceUniform = {
		-- name of the outfit
		name="ArmyServiceUniform",
		-- number to spawn
		toSpawn=1,
		-- The wedding dress is only on female
		gender="male",
		-- we will be forced to spawn this one
		mandatory="true",
		-- need to be in that exact room
		chance=100,
	},
	ArmyInstructorM = {
		name="ArmyInstructor",
		toSpawn=10,
		mandatory="true",
		gender="male",
	},
	ArmyInstructor = {
		name="ArmyInstructor",
		chance=10,
		gender="male",
	},
	ArmyCamoGreen = {
		name="ArmyCamoGreen",
		chance=5,
	},
};
ZombiesZoneDefinition.ArmyComplex = {
	ArmyInstructorM = {
		name="ArmyInstructor",
		toSpawn=1,
		chance=100,
		mandatory="true",
		gender="male",
	},
	ArmyInstructor = {
		name="ArmyInstructor",
		chance=5,
		gender="male",
	},
	ArmyCamoGreen = {
		name="ArmyCamoGreen",
		toSpawn=3,
		chance=40,
	},
	AirCrew = {
		name="AirCrew",
		toSpawn=3,
		chance=30,
	},
	PrivateMilitia = {
		name="PrivateMilitia",
		toSpawn=2,
		chance=60,
	},
	PoliceRiot = {
		name="PoliceRiot",
		toSpawn=1,
		chance=2,
	},
};
ZombiesZoneDefinition.ArmySniper = {
	ArmyServiceUniform = {
		-- name of the outfit
		name="ArmyServiceUniform",
		-- number to spawn
		toSpawn=1,
		-- The wedding dress is only on female
		gender="male",
		-- we will be forced to spawn this one
		mandatory="true",
		-- need to be in that exact room
		chance=30,
	},
	Ghillie = {
		name="Ghillie",
		toSpawn=1,
		mandatory="true",
		gender="male",
		chance=30,
	},
	ArmyInstructor = {
		name="ArmyInstructor",
		chance=25,
		toSpawn=1,
		gender="male",
	},
	ArmyCamoGreen = {
		name="ArmyCamoGreen",
		chance=25,
	},
};
--table.insert(ZombiesZoneDefinition[ArmyGeneral]);
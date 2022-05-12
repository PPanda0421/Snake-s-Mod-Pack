if VehicleZoneDistribution then

	---Snakeneta---
	
	VehicleZoneDistribution.parkingstall.vehicles["Base.VanSnakeneta"] = {index = -1, spawnChance = 1};

	VehicleZoneDistribution.bad.vehicles["Base.VanSnakeneta"] = {index = -1, spawnChance = 1};
	
	VehicleZoneDistribution.trailerpark.vehicles["Base.VanSnakeneta"] = {index = -1, spawnChance = 1};

	VehicleZoneDistribution.junkyard.vehicles["Base.VanSnakeneta"] = {index = -1, spawnChance = 1};


	local specialvehicle = {};
	specialvehicle["Base.VanSnakeneta"] = {index = -1, spawnChance = 100};

	VehicleZoneDistribution.snakeneta = {};
	VehicleZoneDistribution.snakeneta.vehicles = specialvehicle;
	VehicleZoneDistribution.snakeneta.spawnRate = 100;
	VehicleZoneDistribution.snakeneta.chanceToSpawnBurnt = 0;
	VehicleZoneDistribution.snakeneta.baseVehicleQuality = 1.1;
	VehicleZoneDistribution.snakeneta.chanceToPartDamage = 0;
	VehicleZoneDistribution.snakeneta.chanceToSpawnKey = 100;
	VehicleZoneDistribution.snakeneta.chanceToSpawnSpecial = 100;
	VehicleZoneDistribution.snakeneta.chanceToSpawnNormal = 0;
	VehicleZoneDistribution.snakeneta.specialCar = true;
	
	VehicleZoneDistribution.normalburnt.vehicles["Base.VanSnakenetaBurnt"] = {index = -1, spawnChance = 1};
	VehicleZoneDistribution.specialburnt.vehicles["Base.VanSnakenetaBurnt"] = {index = -1, spawnChance = 1};
	if VehicleZoneDistribution.burned then
		if VehicleZoneDistribution.burned.vehicles then
			VehicleZoneDistribution.burned.vehicles["Base.VanSnakenetaBurnt"] = {index = -1, spawnChance = 10};
		end
	end
end
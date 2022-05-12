require "Vehicles/snakenetadis"

--local distributionTable = VehicleDistributions[1]
if VehicleDistributions then
	if VehicleDistributions.VanSnakeneta then
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, "SkillMag.SkillMagPackage");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, 1);

		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, "SkillMag.SkillMagPackage");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, 1);

	end
end
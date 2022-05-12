require "Vehicles/snakenetadis"

local distributionTable = VehicleDistributions[1]
if VehicleDistributions then
	if VehicleDistributions.VanSnakeneta then
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, "BatesMetalicos.MetalBaseballBat");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, 0.5);
		
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, "BatesMetalicos.MetalBaseballBat");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, 0.5);

	end
end
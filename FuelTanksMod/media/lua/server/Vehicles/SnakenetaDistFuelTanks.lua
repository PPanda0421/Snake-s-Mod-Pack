require "Vehicles/snakenetadis"

local distributionTable = VehicleDistributions[1]
if VehicleDistributions then
	if VehicleDistributions.VanSnakeneta then
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, "FuelTanks.FuelTanksMag1");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, 0.5);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, "FuelTanks.FuelMeter");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, 0.5);
		
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, "FuelTanks.FuelTanksMag1");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, 0.5);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, "FuelTanks.FuelMeter");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, 0.5);

	end
end
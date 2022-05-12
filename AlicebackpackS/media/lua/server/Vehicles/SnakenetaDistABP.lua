require "Vehicles/snakenetadis"

local distributionTable = VehicleDistributions[1]
if VehicleDistributions then
	if VehicleDistributions.VanSnakeneta then
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, "AliceBP.AlicePack");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, 0.001);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, "AliceBP.MRE");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, 0.02);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, "AliceBP.MilitaryCanteenEmpty");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, 0.02);
		
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, "AliceBP.AlicePack");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, 0.001);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, "AliceBP.MRE");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, 0.02);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, "AliceBP.MilitaryCanteenEmpty");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, 0.02);
	end
	VehicleDistributions.ABPTruckBed = {
		rolls = 4,
		items = {
			"AliceBP.SupportBackpack", 10,
			"AliceBP.MRE", 30,
			"AliceBP.MilitiaPouch1", 30,
			"AliceBP.MilitiaPouch2", 30,
			"AliceBP.AlicePack", 30,
			"AliceBP.MilitaryCanteenEmpty", 40,
		},
	}
	VehicleDistributions.ABPGloveBox = {
		rolls = 1,
		items = {
			"AliceBP.MilitaryKnife", 30,
		},
	}
	VehicleDistributions.ABPSeat = {
		rolls = 1,
		items = {
            "CorpseMale", 0.01,
            "CorpseFemale", 0.01,		
		},
	}
	VehicleDistributions.ABP = {
		TruckBed = VehicleDistributions.ABPTruckBed;

		TruckBedOpen = VehicleDistributions.ABPTruckBed;

		GloveBox = VehicleDistributions.ABPGloveBox;

		SeatRearLeft = VehicleDistributions.ABPSeat;
		SeatRearRight = VehicleDistributions.ABPSeat;
	}
end

if distributionTable["VanSnakeneta"] then
	if not distributionTable["VanSnakeneta"].Specific then
		distributionTable["VanSnakeneta"].Specific = {};
	end
	table.insert(distributionTable["VanSnakeneta"].Specific, VehicleDistributions.ABP);
end
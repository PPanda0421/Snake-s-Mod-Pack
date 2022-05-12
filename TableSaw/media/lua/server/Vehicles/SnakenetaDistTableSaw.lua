require "Vehicles/snakenetadis"

local distributionTable = VehicleDistributions[1]
if VehicleDistributions then
	if VehicleDistributions.VanSnakeneta then
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, "TableSaw.SawBlade");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, 2);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, "TableSaw.Turpentine");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, 2);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, "TableSaw.Engine");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, 1);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, "TableSaw.SawMag1");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, 0.5);
		
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, "TableSaw.SawBlade");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, 2);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, "TableSaw.Turpentine");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, 2);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, "TableSaw.Engine");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, 1);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, "TableSaw.SawMag1");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, 0.5);
		
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, "ColorDyes.DyesMag");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, 0.5);
		
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, "ColorDyes.DyesMag");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, 0.5);
	end
	VehicleDistributions.TableSawTruckBed = {
		rolls = 4,
		items = {
			"TableSaw.SawBlade", 30,
			"TableSaw.SawBlade", 20,
			"TableSaw.SawBlade", 10,
			"TableSaw.Turpentine", 30,
			"TableSaw.Turpentine", 20,
			"TableSaw.Turpentine", 10,
			"TableSaw.Engine", 10,
		},
	}
	VehicleDistributions.TableSawGloveBox = {
		rolls = 1,
		items = {
			"ColorDyes.DyesMag", 30,
			"ColorDyes.SawMag1", 30,
		},
	}
	VehicleDistributions.TableSawSeat = {
		rolls = 1,
		items = {
            "CorpseMale", 0.01,
            "CorpseFemale", 0.01,		
		},
	}
	VehicleDistributions.TableSaw = {
		TruckBed = VehicleDistributions.TableSawTruckBed;

		TruckBedOpen = VehicleDistributions.TableSawTruckBed;

		GloveBox = VehicleDistributions.TableSawGloveBox;

		SeatRearLeft = VehicleDistributions.TableSawSeat;
		SeatRearRight = VehicleDistributions.TableSawSeat;
	}
end

if distributionTable["VanSnakeneta"] then
	if not distributionTable["VanSnakeneta"].Specific then
		distributionTable["VanSnakeneta"].Specific = {};
	end
	table.insert(distributionTable["VanSnakeneta"].Specific, VehicleDistributions.TableSaw);
end
require 'Items/SuburbsDistributions'
require 'Items/Distributions'

PMRMCustomLoot = {
    mechanic = {
        tiremachine = {
            rolls = 3,
            items = {
                "OldTire1", 0.4,
                "NormalTire1", 0.2,
				"ModernTire1", 0.1,
                "OldTire2", 0.4,
                "NormalTire2", 0.2,
				"ModernTire2", 0.1,
                "OldTire3", 0.4,
                "NormalTire3", 0.2,
				"ModernTire3", 0.1,
            },
        },
		mechanic_counter = {
            rolls = 5,
            items = {
                "MechanicMag1", 1,
                "MechanicMag2", 1,
                "MechanicMag3", 1,
				"MetalworkMag1", 0.3,
                "MetalworkMag2", 0.3,
                "MetalworkMag3", 0.2,
                "MetalworkMag4", 0.2,
				"Wrench", 1,
                "LugWrench",0.7,
                "Jack", 0.5,
                "TirePump", 0.5,
				"Wrench", 1,
                "LugWrench",0.7,
                "Jack", 0.5,
                "TirePump", 0.5,
				"Saw", 0.8,
				"Hammer", 0.8,
				"ScrewsBox", 1,
				"DuctTape", 8,
				"DuctTape", 8,
				"DuctTape", 8,
				"DuctTape", 8,
				"EngineParts", 8,
				"EngineParts", 3,
				"EngineParts", 1,
				"BrakesPartsBox", 8,
				"SuspensionPartsBag", 8,
				"BrakesParts", 10,
				"SuspensionParts", 10,
				"BrakesParts", 5,
				"SuspensionParts", 5,
				"TireGlue", 20,
				"TireGlue", 15,
				"TireGlue", 10,
				"TireGlue", 5,
				"TireGlue", 2,
				"TireRubber", 20,
				"TireRubber", 15,
				"TireRubber", 10,
				"TireRubber", 5,
				"TireRubber", 2,
				"GlassGlue", 20,
				"GlassGlue", 15,
				"GlassGlue", 10,
				"GlassGlue", 5,
				"GlassGlue", 2,
				"GlassCutter", 0.8,
				"GlassMag1", 0.3,
				"CarNormalTunningParts", 3, --3
				"SmallCarTunningParts", 5, --1
				"SmallCar02TunningParts", 5, --1
				"CarLuxuryTunningParts", 5, --1
				"CarStationWagonTunningParts", 4, --2
				"CarTaxiTunningParts", 4, --2
				"ModernCarTunningParts", 5, --1
				"ModernCar02TunningParts", 5, --1
				"CarOffRoadTunningParts", 5, --1
				"PickUpTruckTunningParts", 2, --4
				"PickUpVanTunningParts", 2, --5
				"SUVTunningParts", 5, --1
				"SportsCarTunningParts", 5, --1
				"CarStepVanTunningParts", 3, --3
				"CarVanTunningParts", 2, --6
				"BatteryCleaner", 2, --6
            },
        },
	},
};

table.insert(SuburbsDistributions,mechanicstorage);
SuburbsDistributions["mechanicstorage"] = {
	metal_shelves = {
        rolls = 3,
        items = {
			"NormalCarSeat1", 20,
			"NormalCarSeat2", 20,
			"NormalCarSeat3", 20,
        }
    },
};

table.insert(ProceduralDistributions["list"]["MechanicShelfTools"].items, "Base.BatteryCleaner");
table.insert(ProceduralDistributions["list"]["MechanicShelfTools"].items, 1);
table.insert(ProceduralDistributions["list"]["MechanicShelfElectric"].items, "Base.BatteryCleaner");
table.insert(ProceduralDistributions["list"]["MechanicShelfElectric"].items, 4);
table.insert(ProceduralDistributions["list"]["MechanicShelfElectric"].items, "Base.BatteryCleaner");
table.insert(ProceduralDistributions["list"]["MechanicShelfElectric"].items, 3);
table.insert(ProceduralDistributions["list"]["MechanicShelfElectric"].items, "Base.BatteryCleaner");
table.insert(ProceduralDistributions["list"]["MechanicShelfElectric"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateMechanics"].items, "Base.BatteryCleaner");
table.insert(ProceduralDistributions["list"]["CrateMechanics"].items, 1);
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, "Base.BatteryCleaner");
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, 1);
table.insert(ProceduralDistributions["list"]["StoreShelfMechanics"].items, "Base.BatteryCleaner");
table.insert(ProceduralDistributions["list"]["StoreShelfMechanics"].items, 5);

table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, "Base.CarNormalTunningParts");
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, 0.5);
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, "Base.SmallCarTunningParts");
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, 0.5);
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, "Base.SmallCar02TunningParts");
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, 0.5);
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, "Base.CarLuxuryTunningParts");
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, 0.4);
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, "Base.CarStationWagonTunningParts");
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, 0.4);
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, "Base.CarTaxiTunningParts");
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, 0.5);
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, "Base.ModernCarTunningParts");
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, 0.5);
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, "Base.CarOffRoadTunningParts");
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, 0.5);
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, "Base.PickUpTruckTunningParts");
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, 0.2);
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, "Base.PickUpVanTunningParts");
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, 0.2);
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, "Base.SUVTunningParts");
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, 0.5);
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, "Base.SportsCarTunningParts");
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, 0.5);
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, "Base.CarStepVanTunningParts");
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, 0.3);
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, "Base.CarVanTunningParts");
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, 0.2);

table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, "Base.TireGlue");
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, 3);
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, "Base.TireGlue");
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, 3);
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, "Base.TireGlue");
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, 3);
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, "Base.BigGlassPanel");
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, 5);
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, "Base.BigGlassPanel");
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, 5);
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, "Base.BigGlassPanel");
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, 5);
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, "Base.SmallGlassPanel");
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, 5);
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, "Base.SmallGlassPanel");
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, 5);
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, "Base.SmallGlassPanel");
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, 5);

table.insert(ProceduralDistributions["list"]["CarWindows1"].items, "Base.BigGlassPanel");
table.insert(ProceduralDistributions["list"]["CarWindows1"].items, 10);
table.insert(ProceduralDistributions["list"]["CarWindows1"].items, "Base.BigGlassPanel");
table.insert(ProceduralDistributions["list"]["CarWindows1"].items, 10);
table.insert(ProceduralDistributions["list"]["CarWindows1"].items, "Base.BigGlassPanel");
table.insert(ProceduralDistributions["list"]["CarWindows1"].items, 10);
table.insert(ProceduralDistributions["list"]["CarWindows1"].items, "Base.SmallGlassPanel");
table.insert(ProceduralDistributions["list"]["CarWindows1"].items, 10);
table.insert(ProceduralDistributions["list"]["CarWindows1"].items, "Base.SmallGlassPanel");
table.insert(ProceduralDistributions["list"]["CarWindows1"].items, 10);
table.insert(ProceduralDistributions["list"]["CarWindows1"].items, "Base.SmallGlassPanel");
table.insert(ProceduralDistributions["list"]["CarWindows1"].items, 10);

table.insert(ProceduralDistributions["list"]["CarWindows2"].items, "Base.BigGlassPanel");
table.insert(ProceduralDistributions["list"]["CarWindows2"].items, 10);
table.insert(ProceduralDistributions["list"]["CarWindows2"].items, "Base.BigGlassPanel");
table.insert(ProceduralDistributions["list"]["CarWindows2"].items, 10);
table.insert(ProceduralDistributions["list"]["CarWindows2"].items, "Base.BigGlassPanel");
table.insert(ProceduralDistributions["list"]["CarWindows2"].items, 10);
table.insert(ProceduralDistributions["list"]["CarWindows2"].items, "Base.SmallGlassPanel");
table.insert(ProceduralDistributions["list"]["CarWindows2"].items, 10);
table.insert(ProceduralDistributions["list"]["CarWindows2"].items, "Base.SmallGlassPanel");
table.insert(ProceduralDistributions["list"]["CarWindows2"].items, 10);
table.insert(ProceduralDistributions["list"]["CarWindows2"].items, "Base.SmallGlassPanel");
table.insert(ProceduralDistributions["list"]["CarWindows2"].items, 10);

table.insert(ProceduralDistributions["list"]["CarWindows3"].items, "Base.BigGlassPanel");
table.insert(ProceduralDistributions["list"]["CarWindows3"].items, 10);
table.insert(ProceduralDistributions["list"]["CarWindows3"].items, "Base.BigGlassPanel");
table.insert(ProceduralDistributions["list"]["CarWindows3"].items, 10);
table.insert(ProceduralDistributions["list"]["CarWindows3"].items, "Base.BigGlassPanel");
table.insert(ProceduralDistributions["list"]["CarWindows3"].items, 10);
table.insert(ProceduralDistributions["list"]["CarWindows3"].items, "Base.SmallGlassPanel");
table.insert(ProceduralDistributions["list"]["CarWindows3"].items, 10);
table.insert(ProceduralDistributions["list"]["CarWindows3"].items, "Base.SmallGlassPanel");
table.insert(ProceduralDistributions["list"]["CarWindows3"].items, 10);
table.insert(ProceduralDistributions["list"]["CarWindows3"].items, "Base.SmallGlassPanel");
table.insert(ProceduralDistributions["list"]["CarWindows3"].items, 10);

table.insert(ProceduralDistributions["list"]["GarageTools"].items, "Base.GlassCutter");
table.insert(ProceduralDistributions["list"]["GarageTools"].items, 1);
table.insert(ProceduralDistributions["list"]["GarageTools"].items, "Base.GlassCutter");
table.insert(ProceduralDistributions["list"]["GarageTools"].items, 1);

table.insert(ProceduralDistributions["list"]["MechanicShelfElectric"].items, "Base.EngineParts");
table.insert(ProceduralDistributions["list"]["MechanicShelfElectric"].items, 0.5);
table.insert(ProceduralDistributions["list"]["MechanicShelfElectric"].items, "Base.EngineParts");
table.insert(ProceduralDistributions["list"]["MechanicShelfElectric"].items, 0.5);
table.insert(ProceduralDistributions["list"]["MechanicShelfElectric"].items, "Base.EngineParts");
table.insert(ProceduralDistributions["list"]["MechanicShelfElectric"].items, 0.5);
table.insert(ProceduralDistributions["list"]["MechanicShelfElectric"].items, "Base.EngineParts");
table.insert(ProceduralDistributions["list"]["MechanicShelfElectric"].items, 0.5);
table.insert(ProceduralDistributions["list"]["MechanicShelfElectric"].items, "Base.EngineParts");
table.insert(ProceduralDistributions["list"]["MechanicShelfElectric"].items, 0.5);
table.insert(ProceduralDistributions["list"]["MechanicShelfElectric"].items, "Base.EngineParts");
table.insert(ProceduralDistributions["list"]["MechanicShelfElectric"].items, 0.5);
table.insert(ProceduralDistributions["list"]["MechanicShelfElectric"].items, "Base.EngineParts");
table.insert(ProceduralDistributions["list"]["MechanicShelfElectric"].items, 0.5);
table.insert(ProceduralDistributions["list"]["MechanicShelfElectric"].items, "Base.EngineParts");
table.insert(ProceduralDistributions["list"]["MechanicShelfElectric"].items, 0.5);
table.insert(ProceduralDistributions["list"]["MechanicShelfElectric"].items, "Base.EngineParts");
table.insert(ProceduralDistributions["list"]["MechanicShelfElectric"].items, 0.5);
table.insert(ProceduralDistributions["list"]["MechanicShelfElectric"].items, "Base.EngineParts");
table.insert(ProceduralDistributions["list"]["MechanicShelfElectric"].items, 0.5);

table.insert(ProceduralDistributions["list"]["MechanicShelfBrakes"].items, "Base.BrakesPartsBox");
table.insert(ProceduralDistributions["list"]["MechanicShelfBrakes"].items, 3.0);
table.insert(ProceduralDistributions["list"]["MechanicShelfBrakes"].items, "Base.BrakesPartsBox");
table.insert(ProceduralDistributions["list"]["MechanicShelfBrakes"].items, 2.0);
table.insert(ProceduralDistributions["list"]["MechanicShelfBrakes"].items, "Base.BrakesPartsBox");
table.insert(ProceduralDistributions["list"]["MechanicShelfBrakes"].items, 1.0);

table.insert(ProceduralDistributions["list"]["CarBrakesModern1"].items, "Base.BrakesPartsBox");
table.insert(ProceduralDistributions["list"]["CarBrakesModern1"].items, 10);
table.insert(ProceduralDistributions["list"]["CarBrakesModern1"].items, "Base.BrakesPartsBox");
table.insert(ProceduralDistributions["list"]["CarBrakesModern1"].items, 1);
table.insert(ProceduralDistributions["list"]["CarBrakesModern2"].items, "Base.BrakesPartsBox");
table.insert(ProceduralDistributions["list"]["CarBrakesModern2"].items, 10);
table.insert(ProceduralDistributions["list"]["CarBrakesModern2"].items, "Base.BrakesPartsBox");
table.insert(ProceduralDistributions["list"]["CarBrakesModern2"].items, 1);
table.insert(ProceduralDistributions["list"]["CarBrakesModern3"].items, "Base.BrakesPartsBox");
table.insert(ProceduralDistributions["list"]["CarBrakesModern3"].items, 10);
table.insert(ProceduralDistributions["list"]["CarBrakesModern3"].items, "Base.BrakesPartsBox");
table.insert(ProceduralDistributions["list"]["CarBrakesModern3"].items, 1);

table.insert(ProceduralDistributions["list"]["CarBrakesNormal1"].items, "Base.BrakesPartsBox");
table.insert(ProceduralDistributions["list"]["CarBrakesNormal1"].items, 10);
table.insert(ProceduralDistributions["list"]["CarBrakesNormal1"].items, "Base.BrakesPartsBox");
table.insert(ProceduralDistributions["list"]["CarBrakesNormal1"].items, 1);
table.insert(ProceduralDistributions["list"]["CarBrakesNormal2"].items, "Base.BrakesPartsBox");
table.insert(ProceduralDistributions["list"]["CarBrakesNormal2"].items, 10);
table.insert(ProceduralDistributions["list"]["CarBrakesNormal2"].items, "Base.BrakesPartsBox");
table.insert(ProceduralDistributions["list"]["CarBrakesNormal2"].items, 1);
table.insert(ProceduralDistributions["list"]["CarBrakesNormal3"].items, "Base.BrakesPartsBox");
table.insert(ProceduralDistributions["list"]["CarBrakesNormal3"].items, 10);
table.insert(ProceduralDistributions["list"]["CarBrakesNormal3"].items, "Base.BrakesPartsBox");
table.insert(ProceduralDistributions["list"]["CarBrakesNormal3"].items, 1);


table.insert(ProceduralDistributions["list"]["CarSuspensionModern1"].items, "Base.SuspensionPartsBag");
table.insert(ProceduralDistributions["list"]["CarSuspensionModern1"].items, 10);
table.insert(ProceduralDistributions["list"]["CarSuspensionModern1"].items, "Base.SuspensionPartsBag");
table.insert(ProceduralDistributions["list"]["CarSuspensionModern1"].items, 1);
table.insert(ProceduralDistributions["list"]["CarSuspensionModern2"].items, "Base.SuspensionPartsBag");
table.insert(ProceduralDistributions["list"]["CarSuspensionModern2"].items, 10);
table.insert(ProceduralDistributions["list"]["CarSuspensionModern2"].items, "Base.SuspensionPartsBag");
table.insert(ProceduralDistributions["list"]["CarSuspensionModern2"].items, 1);
table.insert(ProceduralDistributions["list"]["CarSuspensionModern3"].items, "Base.SuspensionPartsBag");
table.insert(ProceduralDistributions["list"]["CarSuspensionModern3"].items, 10);
table.insert(ProceduralDistributions["list"]["CarSuspensionModern3"].items, "Base.SuspensionPartsBag");
table.insert(ProceduralDistributions["list"]["CarSuspensionModern3"].items, 1);

table.insert(ProceduralDistributions["list"]["CarSuspensionNormal1"].items, "Base.SuspensionPartsBag");
table.insert(ProceduralDistributions["list"]["CarSuspensionNormal1"].items, 10);
table.insert(ProceduralDistributions["list"]["CarSuspensionNormal1"].items, "Base.SuspensionPartsBag");
table.insert(ProceduralDistributions["list"]["CarSuspensionNormal1"].items, 1);
table.insert(ProceduralDistributions["list"]["CarSuspensionNormal2"].items, "Base.SuspensionPartsBag");
table.insert(ProceduralDistributions["list"]["CarSuspensionNormal2"].items, 10);
table.insert(ProceduralDistributions["list"]["CarSuspensionNormal2"].items, "Base.SuspensionPartsBag");
table.insert(ProceduralDistributions["list"]["CarSuspensionNormal2"].items, 1);
table.insert(ProceduralDistributions["list"]["CarSuspensionNormal3"].items, "Base.SuspensionPartsBag");
table.insert(ProceduralDistributions["list"]["CarSuspensionNormal3"].items, 10);
table.insert(ProceduralDistributions["list"]["CarSuspensionNormal3"].items, "Base.SuspensionPartsBag");
table.insert(ProceduralDistributions["list"]["CarSuspensionNormal3"].items, 1);

table.insert(ProceduralDistributions["list"]["MechanicShelfSuspension"].items, "Base.SuspensionPartsBag");
table.insert(ProceduralDistributions["list"]["MechanicShelfSuspension"].items, 3.0);
table.insert(ProceduralDistributions["list"]["MechanicShelfSuspension"].items, "Base.SuspensionPartsBag");
table.insert(ProceduralDistributions["list"]["MechanicShelfSuspension"].items, 2.0);
table.insert(ProceduralDistributions["list"]["MechanicShelfSuspension"].items, "Base.SuspensionPartsBag");
table.insert(ProceduralDistributions["list"]["MechanicShelfSuspension"].items, 1.0);

table.insert(ProceduralDistributions["list"]["MechanicShelfBrakes"].items, "Base.BrakesParts");
table.insert(ProceduralDistributions["list"]["MechanicShelfBrakes"].items, 1.0);

table.insert(ProceduralDistributions["list"]["MechanicShelfSuspension"].items, "Base.SuspensionParts");
table.insert(ProceduralDistributions["list"]["MechanicShelfSuspension"].items, 1.0);

table.insert(ProceduralDistributions["list"]["MechanicShelfBrakes"].items, "Base.BrakesParts");
table.insert(ProceduralDistributions["list"]["MechanicShelfBrakes"].items, 0.5);

table.insert(ProceduralDistributions["list"]["MechanicShelfSuspension"].items, "Base.SuspensionParts");
table.insert(ProceduralDistributions["list"]["MechanicShelfSuspension"].items, 0.5);


table.insert(ProceduralDistributions["list"]["MechanicShelfTools"].items, "Base.TireGlue");
table.insert(ProceduralDistributions["list"]["MechanicShelfTools"].items, 5.0);
table.insert(ProceduralDistributions["list"]["MechanicShelfTools"].items, "Base.TireGlue");
table.insert(ProceduralDistributions["list"]["MechanicShelfTools"].items, 5.0);
table.insert(ProceduralDistributions["list"]["MechanicShelfTools"].items, "Base.TireGlue");
table.insert(ProceduralDistributions["list"]["MechanicShelfTools"].items, 5.0);

table.insert(ProceduralDistributions["list"]["MechanicShelfTools"].items, "Base.TireRubber");
table.insert(ProceduralDistributions["list"]["MechanicShelfTools"].items, 5.0);
table.insert(ProceduralDistributions["list"]["MechanicShelfTools"].items, "Base.TireRubber");
table.insert(ProceduralDistributions["list"]["MechanicShelfTools"].items, 5.0);
table.insert(ProceduralDistributions["list"]["MechanicShelfTools"].items, "Base.TireRubber");
table.insert(ProceduralDistributions["list"]["MechanicShelfTools"].items, 5.0);
table.insert(ProceduralDistributions["list"]["MechanicShelfTools"].items, "Base.TireRubber");
table.insert(ProceduralDistributions["list"]["MechanicShelfTools"].items, 5.0);

table.insert(ProceduralDistributions["list"]["MechanicShelfTools"].items, "Base.GlassGlue");
table.insert(ProceduralDistributions["list"]["MechanicShelfTools"].items, 5.0);
table.insert(ProceduralDistributions["list"]["MechanicShelfTools"].items, "Base.GlassGlue");
table.insert(ProceduralDistributions["list"]["MechanicShelfTools"].items, 5.0);
table.insert(ProceduralDistributions["list"]["MechanicShelfTools"].items, "Base.GlassGlue");
table.insert(ProceduralDistributions["list"]["MechanicShelfTools"].items, 5.0);

table.insert(ProceduralDistributions["list"]["GigamartTools"].items, "Base.GlassCutter");
table.insert(ProceduralDistributions["list"]["GigamartTools"].items, 1);
table.insert(ProceduralDistributions["list"]["GigamartTools"].items, "Base.TireGlue");
table.insert(ProceduralDistributions["list"]["GigamartTools"].items, 1);
table.insert(ProceduralDistributions["list"]["GigamartTools"].items, "Base.GlassGlue");
table.insert(ProceduralDistributions["list"]["GigamartTools"].items, 1);

table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, "Base.GlassMag1");
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, 0.1);

table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, "Base.GlassMag1");
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, 0.2);

table.insert(ProceduralDistributions["list"]["MechanicShelfBooks"].items, "Base.GlassMag1");
table.insert(ProceduralDistributions["list"]["MechanicShelfBooks"].items, 3);

table.insert(SuburbsDistributions["all"]["bin"].items, "Base.TireRubber");
table.insert(SuburbsDistributions["all"]["bin"].items, 0.8);

table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, "Base.TireRubber");
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, 0.5);
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, "Base.SmallGlassPanel");
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, 10);
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, "Base.BigGlassPanel");
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, 5);
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, "Base.SmallGlassPanel");
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, 10);
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, "Base.BigGlassPanel");
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, 5);
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, "Base.SmallGlassPanel");
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, 10);
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, "Base.BigGlassPanel");
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, 5);

table.insert(ProceduralDistributions["list"]["CrateMechanics"].items, "Base.TireRubber");
table.insert(ProceduralDistributions["list"]["CrateMechanics"].items, 10);
table.insert(ProceduralDistributions["list"]["CrateMechanics"].items, "Base.SmallGlassPanel");
table.insert(ProceduralDistributions["list"]["CrateMechanics"].items, 5);
table.insert(ProceduralDistributions["list"]["CrateMechanics"].items, "Base.BigGlassPanel");
table.insert(ProceduralDistributions["list"]["CrateMechanics"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateMechanics"].items, "Base.SmallGlassPanel");
table.insert(ProceduralDistributions["list"]["CrateMechanics"].items, 5);
table.insert(ProceduralDistributions["list"]["CrateMechanics"].items, "Base.BigGlassPanel");
table.insert(ProceduralDistributions["list"]["CrateMechanics"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateMechanics"].items, "Base.SmallGlassPanel");
table.insert(ProceduralDistributions["list"]["CrateMechanics"].items, 5);
table.insert(ProceduralDistributions["list"]["CrateMechanics"].items, "Base.BigGlassPanel");
table.insert(ProceduralDistributions["list"]["CrateMechanics"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateMechanics"].items, "Base.TireGlue");
table.insert(ProceduralDistributions["list"]["CrateMechanics"].items, 3);

table.insert(ProceduralDistributions["list"]["OtherGeneric"].items, "Base.BigGlassPanel");
table.insert(ProceduralDistributions["list"]["OtherGeneric"].items, 1);
table.insert(ProceduralDistributions["list"]["OtherGeneric"].items, "Base.SmallGlassPanel");
table.insert(ProceduralDistributions["list"]["OtherGeneric"].items, 2);

table.insert(ProceduralDistributions["list"]["CabinetFactoryTools"].items, "Base.GlassCutter");
table.insert(ProceduralDistributions["list"]["CabinetFactoryTools"].items, 1);

table.insert(ProceduralDistributions["list"]["CrateTools"].items, "Base.GlassCutter");
table.insert(ProceduralDistributions["list"]["CrateTools"].items, 1);

table.insert(ProceduralDistributions["list"]["CarSupplyTools"].items, "Base.GlassCutter");
table.insert(ProceduralDistributions["list"]["CarSupplyTools"].items, 4);

table.insert(ProceduralDistributions["list"]["ToolStoreCarpentry"].items, "Base.TireGlue");
table.insert(ProceduralDistributions["list"]["ToolStoreCarpentry"].items, 5.0);
table.insert(ProceduralDistributions["list"]["ToolStoreCarpentry"].items, "Base.TireGlue");
table.insert(ProceduralDistributions["list"]["ToolStoreCarpentry"].items, 5.0);
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, "Base.TireGlue");
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, 5.0);

table.insert(ProceduralDistributions["list"]["ToolStoreTools"].items, "Base.GlassCutter");
table.insert(ProceduralDistributions["list"]["ToolStoreTools"].items, 5.0);
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, "Base.GlassCutter");
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, 5.0);

table.insert(ProceduralDistributions["list"]["ToolStoreCarpentry"].items, "Base.GlassGlue");
table.insert(ProceduralDistributions["list"]["ToolStoreCarpentry"].items, 5.0);
table.insert(ProceduralDistributions["list"]["ToolStoreCarpentry"].items, "Base.GlassGlue");
table.insert(ProceduralDistributions["list"]["ToolStoreCarpentry"].items, 5.0);
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, "Base.GlassGlue");
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, 5.0);

table.insert(ProceduralDistributions["list"]["ToolStoreBooks"].items, "Base.GlassMag1");
table.insert(ProceduralDistributions["list"]["ToolStoreBooks"].items, 1);

table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, "Base.BatteryCleaner");
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, 2);
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, "Base.BatteryCleaner");
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, 2);
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, "Base.BatteryCleaner");
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, 2);
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, "Base.BatteryCleaner");
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, 2);
table.insert(ProceduralDistributions["list"]["ToolStoreCarpentry"].items, "Base.BatteryCleaner");
table.insert(ProceduralDistributions["list"]["ToolStoreCarpentry"].items, 2);
table.insert(ProceduralDistributions["list"]["ToolStoreCarpentry"].items, "Base.BatteryCleaner");
table.insert(ProceduralDistributions["list"]["ToolStoreCarpentry"].items, 2);
table.insert(ProceduralDistributions["list"]["ToolStoreCarpentry"].items, "Base.BatteryCleaner");
table.insert(ProceduralDistributions["list"]["ToolStoreCarpentry"].items, 2);

table.insert(ProceduralDistributions["list"]["CrateMechanics"].items, "Base.GlassGlue");
table.insert(ProceduralDistributions["list"]["CrateMechanics"].items, 3);
table.insert(ProceduralDistributions["list"]["CrateMechanics"].items, "Base.GlassGlue");
table.insert(ProceduralDistributions["list"]["CrateMechanics"].items, 3);
table.insert(ProceduralDistributions["list"]["CrateMechanics"].items, "Base.GlassGlue");
table.insert(ProceduralDistributions["list"]["CrateMechanics"].items, 3);

table.insert(SuburbsDistributions["all"]["crate"].items, "Base.BigGlassPanel");
table.insert(SuburbsDistributions["all"]["crate"].items, 1.0);
table.insert(SuburbsDistributions["all"]["crate"].items, "Base.SmallGlassPanel");
table.insert(SuburbsDistributions["all"]["crate"].items, 1.0);
table.insert(SuburbsDistributions["all"]["crate"].items, "Base.TireGlue");
table.insert(SuburbsDistributions["all"]["crate"].items, 1.0);
table.insert(SuburbsDistributions["all"]["crate"].items, "Base.GlassGlue");
table.insert(SuburbsDistributions["all"]["crate"].items, 1.0);
table.insert(SuburbsDistributions["all"]["crate"].items, "Base.TireRubber");
table.insert(SuburbsDistributions["all"]["crate"].items, 0.8);
table.insert(SuburbsDistributions["all"]["crate"].items, "Base.GlassCutter");
table.insert(SuburbsDistributions["all"]["crate"].items, 0.1);
table.insert(SuburbsDistributions["all"]["metal_shelves"].items, "Base.TireGlue");
table.insert(SuburbsDistributions["all"]["metal_shelves"].items, 1.0);
table.insert(SuburbsDistributions["all"]["metal_shelves"].items, "Base.GlassGlue");
table.insert(SuburbsDistributions["all"]["metal_shelves"].items, 1.0);
table.insert(SuburbsDistributions["all"]["metal_shelves"].items, "Base.GlassCutter");
table.insert(SuburbsDistributions["all"]["metal_shelves"].items, 0.05);

table.insert(SuburbsDistributions["Toolbox"].items, "Base.TireGlue");
table.insert(SuburbsDistributions["Toolbox"].items, 3.0);
table.insert(SuburbsDistributions["Toolbox"].items, "Base.GlassCutter");
table.insert(SuburbsDistributions["Toolbox"].items, 2.0);
table.insert(SuburbsDistributions["ToolsCache1"]["ToolsBox"].items, "Base.TireGlue");
table.insert(SuburbsDistributions["ToolsCache1"]["ToolsBox"].items, 3);
table.insert(SuburbsDistributions["ToolsCache1"]["ToolsBox"].items, "Base.GlassCutter");
table.insert(SuburbsDistributions["ToolsCache1"]["ToolsBox"].items, 1);
table.insert(SuburbsDistributions["ToolsCache1"]["counter"].items, "Base.TireGlue");
table.insert(SuburbsDistributions["ToolsCache1"]["counter"].items, 3);
table.insert(SuburbsDistributions["ToolsCache1"]["counter"].items, "Base.GlassCutter");
table.insert(SuburbsDistributions["ToolsCache1"]["counter"].items, 1);
table.insert(SuburbsDistributions["ToolsCache1"]["Bag_DuffelBagTINT"].items, "Base.TireGlue");
table.insert(SuburbsDistributions["ToolsCache1"]["Bag_DuffelBagTINT"].items, 8);
table.insert(SuburbsDistributions["ToolsCache1"]["Bag_DuffelBagTINT"].items, "Base.TireGlue");
table.insert(SuburbsDistributions["ToolsCache1"]["Bag_DuffelBagTINT"].items, 8);
table.insert(SuburbsDistributions["ToolsCache1"]["Bag_DuffelBagTINT"].items, "Base.TireGlue");
table.insert(SuburbsDistributions["ToolsCache1"]["Bag_DuffelBagTINT"].items, 8);
table.insert(SuburbsDistributions["ToolsCache1"]["Bag_DuffelBagTINT"].items, "Base.GlassCutter");
table.insert(SuburbsDistributions["ToolsCache1"]["Bag_DuffelBagTINT"].items, 3);

table.insert(SuburbsDistributions["Toolbox"].items, "Base.GlassGlue");
table.insert(SuburbsDistributions["Toolbox"].items, 3.0);
table.insert(SuburbsDistributions["ToolsCache1"]["ToolsBox"].items, "Base.GlassGlue");
table.insert(SuburbsDistributions["ToolsCache1"]["ToolsBox"].items, 3);
table.insert(SuburbsDistributions["ToolsCache1"]["counter"].items, "Base.GlassGlue");
table.insert(SuburbsDistributions["ToolsCache1"]["counter"].items, 3);
table.insert(SuburbsDistributions["ToolsCache1"]["Bag_DuffelBagTINT"].items, "Base.GlassGlue");
table.insert(SuburbsDistributions["ToolsCache1"]["Bag_DuffelBagTINT"].items, 8);
table.insert(SuburbsDistributions["ToolsCache1"]["Bag_DuffelBagTINT"].items, "Base.GlassGlue");
table.insert(SuburbsDistributions["ToolsCache1"]["Bag_DuffelBagTINT"].items, 8);
table.insert(SuburbsDistributions["ToolsCache1"]["Bag_DuffelBagTINT"].items, "Base.GlassGlue");
table.insert(SuburbsDistributions["ToolsCache1"]["Bag_DuffelBagTINT"].items, 8);

table.insert(SuburbsDistributions["all"]["postbox"].items, "Base.GlassMag1");
table.insert(SuburbsDistributions["all"]["postbox"].items, 0.1);
table.insert(SuburbsDistributions["all"]["sidetable"].items, "Base.GlassMag1");
table.insert(SuburbsDistributions["all"]["sidetable"].items, 0.1);

table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, "Base.GlassMag1");
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, 0.1);

table.insert(SuburbsDistributions["Toolbox"].items, "Base.BatteryCleaner");
table.insert(SuburbsDistributions["Toolbox"].items, 3);
table.insert(SuburbsDistributions["ToolsCache1"]["Bag_DuffelBagTINT"].items, "Base.BatteryCleaner");
table.insert(SuburbsDistributions["ToolsCache1"]["Bag_DuffelBagTINT"].items, 10);


local function PMRMmergeDistributions()
	SuburbsDistributions.mechanic.tiremachine = PMRMCustomLoot.mechanic.tiremachine;
	SuburbsDistributions.mechanic.mechanic_counter = PMRMCustomLoot.mechanic.mechanic_counter;
	if FactoryLootInsertion then
		table.insert(SuburbsDistributions["sawstorage2"]["metal_shelves"].items, "Base.BigGlassPanel");
		table.insert(SuburbsDistributions["sawstorage2"]["metal_shelves"].items, 10);
		table.insert(SuburbsDistributions["sawstorage2"]["metal_shelves"].items, "Base.BigGlassPanel");
		table.insert(SuburbsDistributions["sawstorage2"]["metal_shelves"].items, 10);
		table.insert(SuburbsDistributions["sawstorage2"]["metal_shelves"].items, "Base.BigGlassPanel");
		table.insert(SuburbsDistributions["sawstorage2"]["metal_shelves"].items, 10);
		table.insert(SuburbsDistributions["sawstorage2"]["metal_shelves"].items, "Base.BigGlassPanel");
		table.insert(SuburbsDistributions["sawstorage2"]["metal_shelves"].items, 10);
		table.insert(SuburbsDistributions["sawstorage2"]["metal_shelves"].items, "Base.BigGlassPanel");
		table.insert(SuburbsDistributions["sawstorage2"]["metal_shelves"].items, 10);
		table.insert(SuburbsDistributions["sawstorage2"]["metal_shelves"].items, "Base.SmallGlassPanel");
		table.insert(SuburbsDistributions["sawstorage2"]["metal_shelves"].items, 10);
		table.insert(SuburbsDistributions["sawstorage2"]["metal_shelves"].items, "Base.SmallGlassPanel");
		table.insert(SuburbsDistributions["sawstorage2"]["metal_shelves"].items, 10);
		table.insert(SuburbsDistributions["sawstorage2"]["metal_shelves"].items, "Base.SmallGlassPanel");
		table.insert(SuburbsDistributions["sawstorage2"]["metal_shelves"].items, 10);
		table.insert(SuburbsDistributions["sawstorage2"]["metal_shelves"].items, "Base.SmallGlassPanel");
		table.insert(SuburbsDistributions["sawstorage2"]["metal_shelves"].items, 10);
		table.insert(SuburbsDistributions["sawstorage2"]["metal_shelves"].items, "Base.SmallGlassPanel");
		table.insert(SuburbsDistributions["sawstorage2"]["metal_shelves"].items, 10);
		table.insert(SuburbsDistributions["sawstorage2"]["metal_shelves"].items, "Base.SmallGlassPanel");
		table.insert(SuburbsDistributions["sawstorage2"]["metal_shelves"].items, 10);
		
		table.insert(SuburbsDistributions["sawstorage"]["crate"].items, "Base.BigGlassPanel");
		table.insert(SuburbsDistributions["sawstorage"]["crate"].items, 8);
		table.insert(SuburbsDistributions["sawstorage"]["crate"].items, "Base.BigGlassPanel");
		table.insert(SuburbsDistributions["sawstorage"]["crate"].items, 8);
		table.insert(SuburbsDistributions["sawstorage"]["crate"].items, "Base.BigGlassPanel");
		table.insert(SuburbsDistributions["sawstorage"]["crate"].items, 8);
		
		table.insert(SuburbsDistributions["sawstorage"]["crate"].items, "Base.SmallGlassPanel");
		table.insert(SuburbsDistributions["sawstorage"]["crate"].items, 8);
		table.insert(SuburbsDistributions["sawstorage"]["crate"].items, "Base.SmallGlassPanel");
		table.insert(SuburbsDistributions["sawstorage"]["crate"].items, 8);
		table.insert(SuburbsDistributions["sawstorage"]["crate"].items, "Base.SmallGlassPanel");
		table.insert(SuburbsDistributions["sawstorage"]["crate"].items, 8);

		table.insert(SuburbsDistributions["sawstorage"]["metal_shelves"].items, "Base.BigGlassPanel");
		table.insert(SuburbsDistributions["sawstorage"]["metal_shelves"].items, 8);
		table.insert(SuburbsDistributions["sawstorage"]["metal_shelves"].items, "Base.BigGlassPanel");
		table.insert(SuburbsDistributions["sawstorage"]["metal_shelves"].items, 8);
		table.insert(SuburbsDistributions["sawstorage"]["metal_shelves"].items, "Base.BigGlassPanel");
		table.insert(SuburbsDistributions["sawstorage"]["metal_shelves"].items, 8);
		
		table.insert(SuburbsDistributions["sawstorage"]["metal_shelves"].items, "Base.SmallGlassPanel");
		table.insert(SuburbsDistributions["sawstorage"]["metal_shelves"].items, 8);
		table.insert(SuburbsDistributions["sawstorage"]["metal_shelves"].items, "Base.SmallGlassPanel");
		table.insert(SuburbsDistributions["sawstorage"]["metal_shelves"].items, 8);
		table.insert(SuburbsDistributions["sawstorage"]["metal_shelves"].items, "Base.SmallGlassPanel");
		table.insert(SuburbsDistributions["sawstorage"]["metal_shelves"].items, 8);
	end

end

Events.OnDistributionMerge.Add(PMRMmergeDistributions);
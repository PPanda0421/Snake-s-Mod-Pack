require 'Items/SuburbsDistributions'
require 'Items/Distributions'
table.insert(SuburbsDistributions,uniqueloot);
SuburbsDistributions["uniqueloot"] = {
	security_box = {
        rolls = 1,
        items = {
            "ColorCrates.UniqueMag1",500,
        },
    },
};

table.insert(SuburbsDistributions,uniquelootB);
SuburbsDistributions["uniquelootB"] = {
	security_box = {
        rolls = 1,
        items = {
            "ColorCrates.UniqueMag3",500,
			"Base.AssaultRifle",500,
			"Base.556Clip",500,
			"Base.556Box",500,
			"Base.556Box",500,
			"Base.556Box",500,
        },
    },
};

--procedural
table.insert(ProceduralDistributions["list"]["CrateTools"].items, "TableSaw.Engine");
table.insert(ProceduralDistributions["list"]["CrateTools"].items, 0.02);

table.insert(ProceduralDistributions["list"]["CratePaint"].items, "TableSaw.Turpentine");
table.insert(ProceduralDistributions["list"]["CratePaint"].items, 1);
table.insert(ProceduralDistributions["list"]["CratePaint"].items, "ColorDyes.DyesMag");
table.insert(ProceduralDistributions["list"]["CratePaint"].items, 0.8);

table.insert(ProceduralDistributions["list"]["CrateMetalwork"].items, "TableSaw.SawBlade");
table.insert(ProceduralDistributions["list"]["CrateMetalwork"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, "TableSaw.SawBlade");
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, "TableSaw.SawMag1");
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, 0.5);
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, "TableSaw.Turpentine");
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, 5);
table.insert(ProceduralDistributions["list"]["CratePaint"].items, "TableSaw.Turpentine");
table.insert(ProceduralDistributions["list"]["CratePaint"].items, 5);
table.insert(ProceduralDistributions["list"]["CratePaint"].items, "TableSaw.Turpentine");
table.insert(ProceduralDistributions["list"]["CratePaint"].items, 5);


table.insert(ProceduralDistributions["list"]["CrateLumber"].items, "TableSaw.SawBlade");
table.insert(ProceduralDistributions["list"]["CrateLumber"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateLumber"].items, "TableSaw.Engine");
table.insert(ProceduralDistributions["list"]["CrateLumber"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateLumber"].items, "TableSaw.SawMag1");
table.insert(ProceduralDistributions["list"]["CrateLumber"].items, 0.5);
table.insert(ProceduralDistributions["list"]["CrateLumber"].items, "TableSaw.Turpentine");
table.insert(ProceduralDistributions["list"]["CrateLumber"].items, 5);

table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, "ColorDyes.DyesMag");
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, 0.5);
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, "ColorDyes.DyesMag");
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, 0.5);
table.insert(ProceduralDistributions["list"]["PostOfficeMagazines"].items, "ColorDyes.DyesMag");
table.insert(ProceduralDistributions["list"]["PostOfficeMagazines"].items, 1);
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, "ColorDyes.DyesMag");
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, 0.5);
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, "ColorDyes.DyesMag");
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, 2);

table.insert(ProceduralDistributions["list"]["CrateCarpentry"].items, "TableSaw.SawMag1");
table.insert(ProceduralDistributions["list"]["CrateCarpentry"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateCarpentry"].items, "TableSaw.SawBlade");
table.insert(ProceduralDistributions["list"]["CrateCarpentry"].items, 5);
table.insert(ProceduralDistributions["list"]["CrateCarpentry"].items, "TableSaw.Engine");
table.insert(ProceduralDistributions["list"]["CrateCarpentry"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateCarpentry"].items, "TableSaw.Turpentine");
table.insert(ProceduralDistributions["list"]["CrateCarpentry"].items, 5);

table.insert(ProceduralDistributions["list"]["CabinetFactoryTools"].items, "TableSaw.SawBlade");
table.insert(ProceduralDistributions["list"]["CabinetFactoryTools"].items, 10);
table.insert(ProceduralDistributions["list"]["CabinetFactoryTools"].items, "TableSaw.Engine");
table.insert(ProceduralDistributions["list"]["CabinetFactoryTools"].items, 4);
table.insert(ProceduralDistributions["list"]["CabinetFactoryTools"].items, "TableSaw.Turpentine");
table.insert(ProceduralDistributions["list"]["CabinetFactoryTools"].items, 5);


table.insert(SuburbsDistributions["all"]["postbox"].items, "TableSaw.SawMag1");
table.insert(SuburbsDistributions["all"]["postbox"].items, 0.2);
table.insert(SuburbsDistributions["all"]["postbox"].items, "ColorDyes.DyesMag");
table.insert(SuburbsDistributions["all"]["postbox"].items, 0.2);

local function TableSawMergeDistributions()
	if MCCustomLoot then
		table.insert(SuburbsDistributions["MilitaryGeneralRoom"]["security_box"].items, "ColorCrates.UniqueMag2");
		table.insert(SuburbsDistributions["MilitaryGeneralRoom"]["security_box"].items, 800);
	end
end

Events.OnDistributionMerge.Add(TableSawMergeDistributions);
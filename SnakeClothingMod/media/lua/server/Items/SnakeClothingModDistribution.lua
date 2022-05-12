require 'Items/SuburbsDistributions'
require 'Items/Distributions'
SnakeClothingMod = {};

table.insert(SuburbsDistributions,scm_uniqueloot1);
SuburbsDistributions["scm_uniqueloot1"] = {
	security_box = {
        rolls = 1,
        items = {
            "Base.Tshirt_Batman",500,
			"Base.Hat_Batman",500,
			"Base.Boilersuit_Batman",500,
			"Base.Gloves_Batman",500,
			"Base.Bracelet_BangleRightBatman",500,
			"Base.Bracelet_BangleLeftBatman",500,
        },
    },
};
--ProceduralDistributions
table.insert(ProceduralDistributions["list"]["GigamartToys"].items, "Base.CowToy");
table.insert(ProceduralDistributions["list"]["GigamartToys"].items, 10);
table.insert(ProceduralDistributions["list"]["GigamartToys"].items, "Base.SafeToy");
table.insert(ProceduralDistributions["list"]["GigamartToys"].items, 10);
table.insert(ProceduralDistributions["list"]["GigamartToys"].items, "Base.HorseToy");
table.insert(ProceduralDistributions["list"]["GigamartToys"].items, 10);

table.insert(ProceduralDistributions["list"]["CrateToys"].items, "Base.CowToy");
table.insert(ProceduralDistributions["list"]["CrateToys"].items, 15);
table.insert(ProceduralDistributions["list"]["CrateToys"].items, "Base.SafeToy");
table.insert(ProceduralDistributions["list"]["CrateToys"].items, 15);
table.insert(ProceduralDistributions["list"]["CrateToys"].items, "Base.HorseToy");
table.insert(ProceduralDistributions["list"]["CrateToys"].items, 15);

table.insert(ProceduralDistributions["list"]["LockerClassy"].items, "Base.Tshirt_SportBarcDECAL");
table.insert(ProceduralDistributions["list"]["LockerClassy"].items, 1);
table.insert(ProceduralDistributions["list"]["LockerClassy"].items, "Base.Shorts_ShortSportBarc");
table.insert(ProceduralDistributions["list"]["LockerClassy"].items, 1);
table.insert(ProceduralDistributions["list"]["LockerClassy"].items, "Base.Socks_LongBarc");
table.insert(ProceduralDistributions["list"]["LockerClassy"].items, 1);
table.insert(ProceduralDistributions["list"]["LockerClassy"].items, "Base.Shoes_TrainerBarcelona");
table.insert(ProceduralDistributions["list"]["LockerClassy"].items, 1);
table.insert(ProceduralDistributions["list"]["LockerClassy"].items, "Base.Hat_BarcelonaCap");
table.insert(ProceduralDistributions["list"]["LockerClassy"].items, 1);

--SuburbsDistributions
-- table.insert(SuburbsDistributions["sportstore"]["shelves"].items, "Base.Tshirt_SportBarcDECAL");
-- table.insert(SuburbsDistributions["sportstore"]["shelves"].items, 2);
-- table.insert(SuburbsDistributions["sportstore"]["shelves"].items, "Base.Shorts_ShortSportBarc");
-- table.insert(SuburbsDistributions["sportstore"]["shelves"].items, 2);
-- table.insert(SuburbsDistributions["sportstore"]["shelves"].items, "Base.Socks_LongBarc");
-- table.insert(SuburbsDistributions["sportstore"]["shelves"].items, 2);

table.insert(ProceduralDistributions["list"]["SportStoreSneakers"].items, "Base.Shoes_TrainerBarcelona");
table.insert(ProceduralDistributions["list"]["SportStoreSneakers"].items, 2);
-- table.insert(SuburbsDistributions["sportstore"]["shelves"].items, "Base.Shoes_TrainerBarcelona");
-- table.insert(SuburbsDistributions["sportstore"]["shelves"].items, 2);
--table.insert(SuburbsDistributions["sportstore"]["shelves"].items, "Base.Hat_BarcelonaCap");
--table.insert(SuburbsDistributions["sportstore"]["shelves"].items, 2);

-- table.insert(ProceduralDistributions["list"]["ClothingStoresHatsSport"].items, "Base.Hat_BarcelonaCap");
-- table.insert(ProceduralDistributions["list"]["ClothingStoresHatsSport"].items, 2);

table.insert(ProceduralDistributions["list"]["ClothingStoresSport"].items, "Base.Tshirt_SportBarcDECAL");
table.insert(ProceduralDistributions["list"]["ClothingStoresSport"].items, 2);
table.insert(ProceduralDistributions["list"]["ClothingStoresSport"].items, "Base.Shorts_ShortSportBarc");
table.insert(ProceduralDistributions["list"]["ClothingStoresSport"].items, 2);
table.insert(ProceduralDistributions["list"]["ClothingStoresSport"].items, "Base.Socks_LongBarc");
table.insert(ProceduralDistributions["list"]["ClothingStoresSport"].items, 2);
-- table.insert(SuburbsDistributions["sportstore"]["clothingrack"].items, "Base.Tshirt_SportBarcDECAL");
-- table.insert(SuburbsDistributions["sportstore"]["clothingrack"].items, 2);
-- table.insert(SuburbsDistributions["sportstore"]["clothingrack"].items, "Base.Shorts_ShortSportBarc");
-- table.insert(SuburbsDistributions["sportstore"]["clothingrack"].items, 2);
-- table.insert(SuburbsDistributions["sportstore"]["clothingrack"].items, "Base.Socks_LongBarc");
-- table.insert(SuburbsDistributions["sportstore"]["clothingrack"].items, 2);
-- table.insert(SuburbsDistributions["sportstore"]["clothingrack"].items, "Base.Shoes_TrainerBarcelona");
-- table.insert(SuburbsDistributions["sportstore"]["clothingrack"].items, 2);
--table.insert(SuburbsDistributions["sportstore"]["clothingrack"].items, "Base.Hat_BarcelonaCap");
--table.insert(SuburbsDistributions["sportstore"]["clothingrack"].items, 2);

--table.insert(SuburbsDistributions["sportstorage"]["metal_shelves"].items, "Base.Tshirt_SportBarcDECAL");
--table.insert(SuburbsDistributions["sportstorage"]["metal_shelves"].items, 3);
--table.insert(SuburbsDistributions["sportstorage"]["metal_shelves"].items, "Base.Shorts_ShortSportBarc");
--table.insert(SuburbsDistributions["sportstorage"]["metal_shelves"].items, 3);
--table.insert(SuburbsDistributions["sportstorage"]["metal_shelves"].items, "Base.Socks_LongBarc");
--table.insert(SuburbsDistributions["sportstorage"]["metal_shelves"].items, 3);
--table.insert(SuburbsDistributions["sportstorage"]["metal_shelves"].items, "Base.Shoes_TrainerBarcelona");
--table.insert(SuburbsDistributions["sportstorage"]["metal_shelves"].items, 3);
--table.insert(SuburbsDistributions["sportstorage"]["metal_shelves"].items, "Base.Hat_BarcelonaCap");
--table.insert(SuburbsDistributions["sportstorage"]["metal_shelves"].items, 3);
-- table.insert(SuburbsDistributions["sportstorage"]["shelves"].items, "Base.Tshirt_SportBarcDECAL");
-- table.insert(SuburbsDistributions["sportstorage"]["shelves"].items, 3);
-- table.insert(SuburbsDistributions["sportstorage"]["shelves"].items, "Base.Shorts_ShortSportBarc");
-- table.insert(SuburbsDistributions["sportstorage"]["shelves"].items, 3);
-- table.insert(SuburbsDistributions["sportstorage"]["shelves"].items, "Base.Socks_LongBarc");
-- table.insert(SuburbsDistributions["sportstorage"]["shelves"].items, 3);
-- table.insert(SuburbsDistributions["sportstorage"]["shelves"].items, "Base.Shoes_TrainerBarcelona");
-- table.insert(SuburbsDistributions["sportstorage"]["shelves"].items, 3);
-- table.insert(SuburbsDistributions["sportstorage"]["shelves"].items, "Base.Hat_BarcelonaCap");
-- table.insert(SuburbsDistributions["sportstorage"]["shelves"].items, 3);
-- table.insert(SuburbsDistributions["sportstorage"]["crate"].items, "Base.Tshirt_SportBarcDECAL");
-- table.insert(SuburbsDistributions["sportstorage"]["crate"].items, 3);
-- table.insert(SuburbsDistributions["sportstorage"]["crate"].items, "Base.Shorts_ShortSportBarc");
-- table.insert(SuburbsDistributions["sportstorage"]["crate"].items, 3);
-- table.insert(SuburbsDistributions["sportstorage"]["crate"].items, "Base.Socks_LongBarc");
-- table.insert(SuburbsDistributions["sportstorage"]["crate"].items, 3);
-- table.insert(SuburbsDistributions["sportstorage"]["crate"].items, "Base.Shoes_TrainerBarcelona");
-- table.insert(SuburbsDistributions["sportstorage"]["crate"].items, 3);
-- table.insert(SuburbsDistributions["sportstorage"]["crate"].items, "Base.Hat_BarcelonaCap");
-- table.insert(SuburbsDistributions["sportstorage"]["crate"].items, 3);
-- table.insert(SuburbsDistributions["sportstorage"]["clothingrack"].items, "Base.Tshirt_SportBarcDECAL");
-- table.insert(SuburbsDistributions["sportstorage"]["clothingrack"].items, 3);
-- table.insert(SuburbsDistributions["sportstorage"]["clothingrack"].items, "Base.Shorts_ShortSportBarc");
-- table.insert(SuburbsDistributions["sportstorage"]["clothingrack"].items, 3);
-- table.insert(SuburbsDistributions["sportstorage"]["clothingrack"].items, "Base.Socks_LongBarc");
-- table.insert(SuburbsDistributions["sportstorage"]["clothingrack"].items, 3);
-- table.insert(SuburbsDistributions["sportstorage"]["clothingrack"].items, "Base.Shoes_TrainerBarcelona");
-- table.insert(SuburbsDistributions["sportstorage"]["clothingrack"].items, 3);
-- table.insert(SuburbsDistributions["sportstorage"]["clothingrack"].items, "Base.Hat_BarcelonaCap");
-- table.insert(SuburbsDistributions["sportstorage"]["clothingrack"].items, 3);

table.insert(ProceduralDistributions["list"]["CrateClothesRandom"].items, "Base.Tshirt_SportBarcDECAL");
table.insert(ProceduralDistributions["list"]["CrateClothesRandom"].items, 0.002);
table.insert(ProceduralDistributions["list"]["CrateClothesRandom"].items, "Base.Shorts_ShortSportBarc");
table.insert(ProceduralDistributions["list"]["CrateClothesRandom"].items, 0.002);
table.insert(ProceduralDistributions["list"]["CrateClothesRandom"].items, "Base.Socks_LongBarc");
table.insert(ProceduralDistributions["list"]["CrateClothesRandom"].items, 0.002);
table.insert(ProceduralDistributions["list"]["CrateClothesRandom"].items, "Base.Hat_BarcelonaCap");
table.insert(ProceduralDistributions["list"]["CrateClothesRandom"].items, 0.002);
table.insert(ProceduralDistributions["list"]["CrateFootwearRandom"].items, "Base.Shoes_TrainerBarcelona");
table.insert(ProceduralDistributions["list"]["CrateFootwearRandom"].items, 0.002);
table.insert(ProceduralDistributions["list"]["CrateSports"].items, "Base.Hat_BarcelonaCap");
table.insert(ProceduralDistributions["list"]["CrateSports"].items, 0.002);

-- table.insert(SuburbsDistributions["storageunit"]["all"].items, "Base.Tshirt_SportBarcDECAL");
-- table.insert(SuburbsDistributions["storageunit"]["all"].items, 0.002);
-- table.insert(SuburbsDistributions["storageunit"]["all"].items, "Base.Shorts_ShortSportBarc");
-- table.insert(SuburbsDistributions["storageunit"]["all"].items, 0.002);
-- table.insert(SuburbsDistributions["storageunit"]["all"].items, "Base.Socks_LongBarc");
-- table.insert(SuburbsDistributions["storageunit"]["all"].items, 0.002);
-- table.insert(SuburbsDistributions["storageunit"]["all"].items, "Base.Shoes_TrainerBarcelona");
-- table.insert(SuburbsDistributions["storageunit"]["all"].items, 0.002);
-- table.insert(SuburbsDistributions["storageunit"]["all"].items, "Base.Hat_BarcelonaCap");
-- table.insert(SuburbsDistributions["storageunit"]["all"].items, 0.002);


local function SClothingModDistributions()
	if PaintCratesDefinitions then
		table.insert(SuburbsDistributions["uniqueloot"]["security_box"].items, "Base.DitoHoodieDOWN_WhiteTINT");
		table.insert(SuburbsDistributions["uniqueloot"]["security_box"].items, 500);
		table.insert(SuburbsDistributions["uniqueloot"]["security_box"].items, "Base.DitoFlag");
		table.insert(SuburbsDistributions["uniqueloot"]["security_box"].items, 500);
		table.insert(SuburbsDistributions["uniqueloot"]["security_box"].items, "Base.DitoFlag");
		table.insert(SuburbsDistributions["uniqueloot"]["security_box"].items, 500);
		table.insert(SuburbsDistributions["uniqueloot"]["security_box"].items, "Base.DitoFlag");
		table.insert(SuburbsDistributions["uniqueloot"]["security_box"].items, 500);
		table.insert(SuburbsDistributions["uniqueloot"]["security_box"].items, "Base.DitoFlag");
		table.insert(SuburbsDistributions["uniqueloot"]["security_box"].items, 500);
	end
	if FactoryLootInsertion then
		table.insert(SuburbsDistributions["bossoffice"]["security_box"].items, "Base.TShirt_SportARGDECAL");
		table.insert(SuburbsDistributions["bossoffice"]["security_box"].items, 500);
		table.insert(SuburbsDistributions["bossoffice"]["security_box"].items, "Base.Shorts_ShortSportArg");
		table.insert(SuburbsDistributions["bossoffice"]["security_box"].items, 500);
		table.insert(SuburbsDistributions["bossoffice"]["security_box"].items, "Base.Socks_LongArg");
		table.insert(SuburbsDistributions["bossoffice"]["security_box"].items, 500);
		table.insert(SuburbsDistributions["bossoffice"]["security_box"].items, "Base.Shoes_TrainerArgentina");
		table.insert(SuburbsDistributions["bossoffice"]["security_box"].items, 500);
	end
end

Events.OnDistributionMerge.Add(SClothingModDistributions);
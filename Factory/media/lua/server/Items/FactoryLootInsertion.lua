require 'Items/SuburbsDistributions'
require 'Items/Distributions'

FactoryCustomLoot = {
    all = {
		metalpallet = {
            rolls = 2,
            items = {
				"SheetMetal", 8,
				"SmallSheetMetal", 10,
				"SheetMetal", 8,
				"SmallSheetMetal", 10,
				"SheetMetal", 8,
				"SmallSheetMetal", 10,
				"SheetMetal", 8,
				"SmallSheetMetal", 10,
            }
        },
	},
};

table.insert(SuburbsDistributions,bossoffice);
SuburbsDistributions["bossoffice"] = {
	security_box = {
        rolls = 1,
        items = {
        }
    },
	bar_furniture = {
        rolls = 10,
        items = {
        }
    },
    counter ={
        rolls = 3,
        items = {
			"Book", 10,
			"Book", 10,
			"Book", 10,
			"Book", 10,
			"Book", 10,
			"Book", 10,
			"Book", 10,
			"Book", 10,
			"Book", 10,
			"Book", 10,
			"BookTailoring1", 1,
			"BookTailoring2", 0.5,
			"BookTailoring3", 0.4,
			"BookTailoring4", 0.3,
			"BookTailoring5", 0.1,
			"BookFishing1", 1,
			"BookFishing2", 0.5,
			"BookFishing3", 0.4,
			"BookFishing4", 0.3,
			"BookFishing5", 0.1,
			"BookTrapping1", 1,
			"BookTrapping2", 0.5,
			"BookTrapping3", 0.4,
			"BookTrapping4", 0.3,
			"BookTrapping5", 0.1,
			"BookCarpentry1", 1,
			"BookCarpentry2", 0.5,
			"BookCarpentry3", 0.4,
			"BookCarpentry4", 0.3,
			"BookCarpentry5", 0.1,
			"BookFarming1", 1,
			"BookForaging1", 1,
			"BookForaging2", 0.5,
			"BookForaging3", 0.4,
			"BookForaging4", 0.3,
			"BookForaging5", 0.1,
			"BookCooking1", 1,
			"BookFarming2", 0.5,
			"BookCooking2", 0.5,
			"BookFarming3", 0.4,
			"BookCooking3", 0.4,
			"BookFarming4", 0.3,
			"BookCooking4", 0.3,
			"BookFarming5", 0.1,
			"BookCooking5", 0.1,
			--                "BookBlacksmith1", 1,
			--                "BookBlacksmith2", 0.5,
			--                "BookBlacksmith3", 0.4,
			--                "BookBlacksmith4", 0.3,
			--                "BookBlacksmith5", 0.1,
			"BookFirstAid1", 1,
			"BookFirstAid2", 0.5,
			"BookFirstAid3", 0.4,
			"BookFirstAid4", 0.3,
			"BookFirstAid5", 0.1,
			"BookMetalWelding1", 1,
			"BookMetalWelding2", 0.5,
			"BookMetalWelding3", 0.4,
			"BookMetalWelding4", 0.3,
			"BookMetalWelding5", 0.1,
			"BookElectrician1", 1,
			"BookElectrician2", 0.5,
			"BookElectrician3", 0.4,
			"BookElectrician4", 0.3,
			"BookElectrician5", 0.1,
			"BookMechanic1", 1,
			"BookMechanic2", 0.5,
			"BookMechanic3", 0.4,
			"BookMechanic4", 0.3,
			"BookMechanic5", 0.1,
			"FishingMag1", 1,
			"FishingMag2", 1,
			"HuntingMag1", 1,
			"HuntingMag2", 1,
			"HuntingMag3", 1,
			"HerbalistMag", 1,
			"CookingMag1", 1,
			"CookingMag2", 1,
			"ElectronicsMag1", 1,
			"ElectronicsMag2", 1,
			"ElectronicsMag3", 1,
			"ElectronicsMag4", 1,
			"ElectronicsMag5", 1,
			"MechanicMag1", 1,
			"MechanicMag2", 1,
			"MechanicMag3", 1,
			"EngineerMagazine1", 1,
			"EngineerMagazine2", 1,
			"MetalworkMag1", 1,
			"MetalworkMag2", 1,
			"MetalworkMag3", 1,
			"MetalworkMag4", 1,
			"Radio.RadioMag1", 1,
			"Radio.RadioMag2", 1,
			"Radio.RadioMag3", 1,
        }
    },
	extinguishers_shelves = {
        rolls = 1,
        items = {
            "Extinguisher",10,
        }
    },
    shelves ={
        rolls = 3,
        items = {
			"Book", 10,
			"Book", 10,
			"Book", 10,
			"Book", 10,
			"Book", 10,
			"Book", 10,
			"Book", 10,
			"Book", 10,
			"Book", 10,
			"Book", 10,
			"BookTailoring1", 1,
			"BookTailoring2", 0.5,
			"BookTailoring3", 0.4,
			"BookTailoring4", 0.3,
			"BookTailoring5", 0.1,
			"BookFishing1", 1,
			"BookFishing2", 0.5,
			"BookFishing3", 0.4,
			"BookFishing4", 0.3,
			"BookFishing5", 0.1,
			"BookTrapping1", 1,
			"BookTrapping2", 0.5,
			"BookTrapping3", 0.4,
			"BookTrapping4", 0.3,
			"BookTrapping5", 0.1,
			"BookCarpentry1", 1,
			"BookCarpentry2", 0.5,
			"BookCarpentry3", 0.4,
			"BookCarpentry4", 0.3,
			"BookCarpentry5", 0.1,
			"BookFarming1", 1,
			"BookForaging1", 1,
			"BookForaging2", 0.5,
			"BookForaging3", 0.4,
			"BookForaging4", 0.3,
			"BookForaging5", 0.1,
			"BookCooking1", 1,
			"BookFarming2", 0.5,
			"BookCooking2", 0.5,
			"BookFarming3", 0.4,
			"BookCooking3", 0.4,
			"BookFarming4", 0.3,
			"BookCooking4", 0.3,
			"BookFarming5", 0.1,
			"BookCooking5", 0.1,
			--                "BookBlacksmith1", 1,
			--                "BookBlacksmith2", 0.5,
			--                "BookBlacksmith3", 0.4,
			--                "BookBlacksmith4", 0.3,
			--                "BookBlacksmith5", 0.1,
			"BookFirstAid1", 1,
			"BookFirstAid2", 0.5,
			"BookFirstAid3", 0.4,
			"BookFirstAid4", 0.3,
			"BookFirstAid5", 0.1,
			"BookMetalWelding1", 1,
			"BookMetalWelding2", 0.5,
			"BookMetalWelding3", 0.4,
			"BookMetalWelding4", 0.3,
			"BookMetalWelding5", 0.1,
			"BookElectrician1", 1,
			"BookElectrician2", 0.5,
			"BookElectrician3", 0.4,
			"BookElectrician4", 0.3,
			"BookElectrician5", 0.1,
			"BookMechanic1", 1,
			"BookMechanic2", 0.5,
			"BookMechanic3", 0.4,
			"BookMechanic4", 0.3,
			"BookMechanic5", 0.1,
			"FishingMag1", 1,
			"FishingMag2", 1,
			"HuntingMag1", 1,
			"HuntingMag2", 1,
			"HuntingMag3", 1,
			"HerbalistMag", 1,
			"CookingMag1", 1,
			"CookingMag2", 1,
			"ElectronicsMag1", 1,
			"ElectronicsMag2", 1,
			"ElectronicsMag3", 1,
			"ElectronicsMag4", 1,
			"ElectronicsMag5", 1,
			"MechanicMag1", 1,
			"MechanicMag2", 1,
			"MechanicMag3", 1,
			"EngineerMagazine1", 1,
			"EngineerMagazine2", 1,
			"MetalworkMag1", 1,
			"MetalworkMag2", 1,
			"MetalworkMag3", 1,
			"MetalworkMag4", 1,
			"Radio.RadioMag1", 1,
			"Radio.RadioMag2", 1,
			"Radio.RadioMag3", 1,
        }
    },
};

table.insert(SuburbsDistributions,sawstorage);
SuburbsDistributions["sawstorage"] = {
    crate ={
        rolls = 3,
        items = {
            "DuctTape", 1,
			"DuctTape", 1,
			"DuctTape", 1,
            "DuctTape", 1,
            "Glue", 0.8,
            "Scotchtape", 0.8,
            "Woodglue", 0.8,
			"Woodglue", 0.8,
            "Woodglue", 0.8,
			"Woodglue", 0.8,
            "Rope", 0.8,
            "NailsBox", 2,
            "NailsBox", 2,
            "NailsBox", 2,
            "Crowbar", 1,
            "Plank", 3,
            "Plank", 3,
            "PlasterPowder", 2,
            "BarbedWire", 2,
            "Sandbag", 4,
			"Sandbag", 4,
			"Sandbag", 4,
			"Sandbag", 4,
            "Gravelbag", 4,
			"Gravelbag", 4,
			"Gravelbag", 4,
            "EmptySandbag", 4,
			"BarbedWire", 1,
            "BlowTorch", 0.5,
            "WeldingRods", 1,
            "SheetMetal", 1.8,
            "SmallSheetMetal", 2,
            "MetalPipe", 1.4,
            "MetalBar", 0.7,
			"Wrench", 0.5,
            "WeldingMask",0.5,
            "Wrench", 0.5,
            "LugWrench",0.4,
            "Jack", 0.2,
            "TirePump", 0.2,
			"LeadPipe", 0.4,
			"PipeWrench", 0.4,
        }
    },
    metal_shelves ={
        rolls = 3,
        items = {
            "Paintbrush", 1.5,
            "PaintBlue", 0.8,
            "PaintBlack", 0.8,
            "PaintRed", 0.8,
            "PaintBrown", 0.8,
            "PaintCyan", 0.8,
            "PaintGreen", 0.8,
            "PaintGrey", 0.8,
            "PaintLightBlue", 0.8,
            "PaintLightBrown", 0.8,
            "PaintOrange", 0.8,
            "PaintPink", 0.8,
            "PaintPurple", 0.8,
            "PaintTurquoise",0.8,
            "PaintWhite", 0.8,
            "PaintYellow", 0.8,
			"EmptySandbag", 4,
			"EmptySandbag", 4,
			"EmptySandbag", 4,
			"BucketEmpty", 3,
			"PaperclipBox", 0.5,
			"Wire", 2,
			"PlasterPowder", 1,
        }
    },
	
	brickpallet ={
        rolls = 5,
        items = {
        }
    },
};

table.insert(SuburbsDistributions,sawstorage2);
SuburbsDistributions["sawstorage2"] = {
    metal_shelves ={
        rolls = 3,
        items = {
			"PlasterPowder", 15,
			"PlasterPowder", 10,
			"PlasterPowder", 8,
            "Sandbag", 10,
			"Sandbag", 10,
			"Sandbag", 10,
			"Sandbag", 10,
            "Gravelbag", 10,
			"Gravelbag", 10,
			"Gravelbag", 10,
        }
    },
};

table.insert(SuburbsDistributions,metalfactory);
SuburbsDistributions["metalfactory"] = {
    bin ={
        rolls = 3,
        items = {
            "Magazine", 4,
            "Newspaper", 4,
            "Book", 4,
            "ComicBook", 2,
        }
    },
	extinguishers_shelves = {
        rolls = 1,
        items = {
            "Extinguisher",10,
        }
    },
    crate ={
        rolls = 3,
        items = {
            "BlowTorch", 2,
            "WeldingRods", 5,
            "SmallSheetMetal", 5,
            "SheetMetal", 4,
            "SmallSheetMetal", 5,
            "SheetMetal", 4,
            "SmallSheetMetal", 5,
            "SheetMetal", 4,
            "MetalPipe", 4,
            "MetalBar", 4,
            "WeldingMask",2,
        }
    },
    other ={
        rolls = 5,
        items = {
            "SheetMetal", 8,
            "SmallSheetMetal", 10,
            "SheetMetal", 8,
            "SmallSheetMetal", 10,
            "SheetMetal", 8,
            "SmallSheetMetal", 10,
            "SheetMetal", 8,
            "SmallSheetMetal", 10,
            "SheetMetal", 8,
            "SmallSheetMetal", 10,
            "SheetMetal", 8,
            "SmallSheetMetal", 10,
        }
    },
};

FactoryLootInsertion = {

};
local function FactoryDistributionMerge()
	SuburbsDistributions.bookstore.extinguishers_shelves = SuburbsDistributions.metalfactory.extinguishers_shelves;
	SuburbsDistributions.restaurantkitchen.extinguishers_shelves = SuburbsDistributions.metalfactory.extinguishers_shelves;
	SuburbsDistributions.hall.extinguishers_shelves = SuburbsDistributions.metalfactory.extinguishers_shelves;
	SuburbsDistributions.kitchen.extinguishers_shelves = SuburbsDistributions.metalfactory.extinguishers_shelves;
	SuburbsDistributions.all.metalpallet = FactoryCustomLoot.all.metalpallet;

	if AdvFishing then
        table.insert(SuburbsDistributions["metalfactory"]["crate"].items, "AdvancedFishing.AcidC");
		table.insert(SuburbsDistributions["metalfactory"]["crate"].items, 20);
        table.insert(SuburbsDistributions["metalfactory"]["crate"].items, "AdvancedFishing.AcidC");
		table.insert(SuburbsDistributions["metalfactory"]["crate"].items, 20);
        table.insert(SuburbsDistributions["metalfactory"]["crate"].items, "AdvancedFishing.AcidC");
		table.insert(SuburbsDistributions["metalfactory"]["crate"].items, 20);
        table.insert(SuburbsDistributions["metalfactory"]["crate"].items, "AdvancedFishing.AcidC");
		table.insert(SuburbsDistributions["metalfactory"]["crate"].items, 20);

	end
end

Events.OnDistributionMerge.Add(FactoryDistributionMerge);
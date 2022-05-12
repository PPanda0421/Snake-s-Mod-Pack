require 'Items/SuburbsDistributions'
require 'Items/Distributions'

FDCustomLoot = {
    all = {
		fishing_basket = {
            rolls = 5,
            items = {
				"Base.Worm", 2,
				"Base.Worm", 2,
				"Base.Worm", 2,
				"Base.Worm", 2,
				"Base.Cricket", 2,
				"Base.Cockroach", 2,
				"Base.Cricket", 2,
				"Base.Cockroach", 2,
            },
        },
	},
};

table.insert(SuburbsDistributions,dock2);
SuburbsDistributions["dock2"] = {
    displaycase ={
        rolls = 5,
        items = {
            "Base.FishingRod", 4,
            "Base.FishingNet", 2,
            "Base.FishingLine", 1,
            "Base.FishingRod", 4,
            "Base.FishingNet", 2,
            "Base.FishingLine", 1,
			"Base.PaperclipBox", 0.5,
            "Base.FishingRod", 4,
            "Base.FishingNet", 2,
            "Base.FishingLine", 1,
            "Base.FishingRod", 4,
            "Base.FishingNet", 2,
            "Base.FishingLine", 1,
			"Base.PaperclipBox", 0.5,
        }
    },
    shelves ={
        rolls = 5,
        items = {
            "Base.BookFishing1", 1,
            "Base.BookFishing2", 0.5,
            "Base.BookFishing3", 0.4,
            "Base.BookFishing4", 0.3,
            "Base.BookFishing5", 0.1,
            "Base.FishingRod", 4,
            "Base.FishingNet", 2,
            "Base.FishingLine", 1,
            "Base.FishingRod", 4,
            "Base.FishingNet", 2,
            "Base.FishingLine", 1,
			"Base.PaperclipBox", 0.5,
            "Base.FishingRod", 4,
            "Base.FishingNet", 2,
            "Base.FishingLine", 1,
            "Base.FishingRod", 4,
            "Base.FishingNet", 2,
            "Base.FishingLine", 1,
			"Base.PaperclipBox", 0.5,
        }
    },
    shelvesmag ={
        rolls = 3,
        items = {
            "Base.FishingMag1", 1,
            "Base.FishingMag2", 1,
            "Base.FishingMag1", 0.5,
            "Base.FishingMag2", 0.5,
            "Base.FishingMag1", 0.5,
            "Base.FishingMag2", 0.5,
        }
    },
    fridge ={
        rolls = 3,
        items = {
            "Base.Worm", 5,
            "Base.Worm", 2,
            "Base.Worm", 2,
            "Base.Worm", 2,
            "Base.Cricket", 2,
            "Base.Cockroach", 2,
			"Base.Cricket", 2,
            "Base.Cockroach", 2,
        }
    },
    freezer ={
        rolls = 3,
        items = {
            "Base.Worm", 5,
            "Base.Worm", 2,
            "Base.Worm", 2,
            "Base.Worm", 2,
            "Base.Cricket", 2,
            "Base.Cockroach", 2,
			"Base.Cricket", 2,
            "Base.Cockroach", 2,
        }
    },
    vendingpop ={
        rolls = 2,
        items = {
        }
    },
    vendingsnack ={
        rolls = 2,
        items = {
        }
    },
    smallcrate ={
        rolls = 2,
        items = {
            "Base.Worm", 2,
            "Base.Worm", 2,
            "Base.Worm", 2,
            "Base.Worm", 2,
            "Base.Cricket", 2,
            "Base.Cockroach", 2,
			"Base.Cricket", 2,
            "Base.Cockroach", 2,
        }
    },
	clothingrack ={
        rolls = 3,
        items = {
            "Base.Hat_Sweatband",1,
			"Base.Tshirt_Sport", 3,
			"Base.Shorts_LongSport",3,
			"Base.Shorts_ShortSport",3,
			"Base.Tshirt_Sport", 3,
			"Base.Shorts_LongSport",3,
			"Base.Shorts_ShortSport",3,
			"Base.Bag_DuffelBagTINT", 1,
			"Base.Bag_Schoolbag", 3,
			"Base.Bag_NormalHikingBag", 0.8,
			"Base.Bag_BigHikingBag", 0.5,
        }
    },
};

table.insert(SuburbsDistributions,petrolroom);
SuburbsDistributions["petrolroom"] = {
    crate ={
        rolls = 3,
        items = {
            "PropaneTank", 10,
            "PetrolCan", 15,
            "EmptyPetrolCan", 16,
        }
    },
    metal_shelves ={
        rolls = 3,
        items = {
            "PropaneTank", 5,
            "PetrolCan", 10,
            "EmptyPetrolCan", 11,
        }
    },
};

local function FDmergeDistributions()
	SuburbsDistributions.all.fishing_basket = FDCustomLoot.all.fishing_basket;
	SuburbsDistributions.dock2.fishing_basket = FDCustomLoot.all.fishing_basket;
	if AdvFishing then
		--nothing
	else
		table.insert(SuburbsDistributions.dock2.shelves.items, "Base.FishingTackle");
		table.insert(SuburbsDistributions.dock2.shelves.items, 4);
		table.insert(SuburbsDistributions.dock2.shelves.items, "Base.FishingTackle2");
		table.insert(SuburbsDistributions.dock2.shelves.items, 4);
		table.insert(SuburbsDistributions.dock2.shelves.items, "Base.FishingTackle");
		table.insert(SuburbsDistributions.dock2.shelves.items, 4);
		table.insert(SuburbsDistributions.dock2.shelves.items, "Base.FishingTackle2");
		table.insert(SuburbsDistributions.dock2.shelves.items, 4);
		table.insert(SuburbsDistributions.dock2.displaycase.items, "Base.FishingTackle");
		table.insert(SuburbsDistributions.dock2.displaycase.items, 4);
		table.insert(SuburbsDistributions.dock2.displaycase.items, "Base.FishingTackle2");
		table.insert(SuburbsDistributions.dock2.displaycase.items, 4);
		table.insert(SuburbsDistributions.dock2.displaycase.items, "Base.FishingTackle");
		table.insert(SuburbsDistributions.dock2.displaycase.items, 4);
		table.insert(SuburbsDistributions.dock2.displaycase.items, "Base.FishingTackle2");
		table.insert(SuburbsDistributions.dock2.displaycase.items, 4);
    end
end

local function FDpostDistributionMerge()
	if AdvFishing then
		RemoveItemFromDistribution(SuburbsDistributions, "FishingTackle");
		RemoveItemFromDistribution(SuburbsDistributions, "FishingTackle2");

		RemoveItemFromDistribution(ProceduralDistributions, "FishingTackle");
		RemoveItemFromDistribution(ProceduralDistributions, "FishingTackle2");
	end
end

FDLootInsertion = {

};

Events.OnDistributionMerge.Add(FDmergeDistributions);
Events.OnPostDistributionMerge.Add(FDpostDistributionMerge);
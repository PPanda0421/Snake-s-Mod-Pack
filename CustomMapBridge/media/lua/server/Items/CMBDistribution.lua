require 'Items/SuburbsDistributions'
require 'Items/Distributions'

CMBCustomLoot = {
    all = {
        propanepallet = {
            rolls = 5,
            items = {
                "PropaneTank", 20,
				"PropaneTank", 20,
            },
        },
        roulette = {
            rolls = 10,
            items = {
            },
        },
	},
    mechanic = {
        tiremachine = {
            rolls = 3,
            items = {
                "OldTire1", 0.4,
                "NormalTire1", 0.2,
                "OldTire2", 0.4,
                "NormalTire2", 0.2,
                "OldTire3", 0.4,
                "NormalTire3", 0.2,
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
            },
        },
	},
};
table.insert(SuburbsDistributions.all,roulette);
SuburbsDistributions.all["roulette"] = {
    displaycase ={
        rolls = 10,
        items = {
        }
    },
};

local function CMBmergeDistributions()
	if not PMRMCustomLoot or PMRMCustomLoot == nil then
		SuburbsDistributions.mechanic.tiremachine = CMBCustomLoot.mechanic.tiremachine;
		SuburbsDistributions.mechanic.mechanic_counter = CMBCustomLoot.mechanic.mechanic_counter;
	end
	SuburbsDistributions.all.propanepallet = CMBCustomLoot.all.propanepallet;
	SuburbsDistributions.all.roulette = CMBCustomLoot.all.roulette;
end

Events.OnDistributionMerge.Add(CMBmergeDistributions);
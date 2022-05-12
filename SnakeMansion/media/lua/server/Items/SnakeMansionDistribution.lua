require 'Items/SuburbsDistributions'
require 'Items/Distributions'
require 'Items/CMBDistribution'

table.insert(SuburbsDistributions,barmansion);
SuburbsDistributions["barmansion"] = {
};

table.insert(SuburbsDistributions,Gym);
SuburbsDistributions["Gym"] = {
	locker = {
		procedural = true,
		procList = {
			{name="CrateFitnessWeights", min=0, max=1, weightChance=100},
		}
    },
};

local function SnakeMansionmergeDistributions()
	SuburbsDistributions.barmansion = SuburbsDistributions.bar;
	if CMBCustomLoot then
		table.insert(SuburbsDistributions["all"]["roulette"].items, "RouletteStick");
		table.insert(SuburbsDistributions["all"]["roulette"].items, 20);
		table.insert(SuburbsDistributions["all"]["roulette"].items, "ZMChip1");
		table.insert(SuburbsDistributions["all"]["roulette"].items, 20);
		table.insert(SuburbsDistributions["all"]["roulette"].items, "ZMChip2");
		table.insert(SuburbsDistributions["all"]["roulette"].items, 15);
		table.insert(SuburbsDistributions["all"]["roulette"].items, "ZMChip3");
		table.insert(SuburbsDistributions["all"]["roulette"].items, 10);
		table.insert(SuburbsDistributions["all"]["roulette"].items, "ZMChip4");
		table.insert(SuburbsDistributions["all"]["roulette"].items, 5);
		table.insert(SuburbsDistributions["all"]["roulette"].items, "ZMChip5");
		table.insert(SuburbsDistributions["all"]["roulette"].items, 3);
		table.insert(SuburbsDistributions["all"]["roulette"].items, "ZMChip6");
		table.insert(SuburbsDistributions["all"]["roulette"].items, 2);
		table.insert(SuburbsDistributions["all"]["roulette"].items, "ZMChip7");
		table.insert(SuburbsDistributions["all"]["roulette"].items, 1);
		table.insert(SuburbsDistributions["all"]["roulette"].items, "ZMChip8");
		table.insert(SuburbsDistributions["all"]["roulette"].items, 0.5);
		table.insert(SuburbsDistributions["all"]["roulette"].items, "ZMChip9");
		table.insert(SuburbsDistributions["all"]["roulette"].items, 0.1);
	end
end

Events.OnDistributionMerge.Add(SnakeMansionmergeDistributions);
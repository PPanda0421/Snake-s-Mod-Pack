require "StashDescriptions/StashUtil";

-- guns
local stashMap1 = StashUtil.newStash("TableSawStashMap1", "Map", "Base.RiversideMap", "Stash_AnnotedMap");
stashMap1.spawnOnlyOnZed = true;
stashMap1.buildingX = 6565;
stashMap1.buildingY = 5375;
stashMap1.spawnTable = "uniqueloot";
stashMap1:addContainer("security_box","carpentry_03_27",nil,nil,6557,5367,1);
stashMap1:addStamp(nil,"Stash_TableSawMap1_Text1",6562,5364,0,0,0);
--Old Coords
--stashMap1:addStamp("media/ui/LootableMaps/map_dito.png",nil,1458,744,0,0,0);

-- guns
local stashMap2 = StashUtil.newStash("TableSawStashMap2", "Map", "Base.RosewoodMap", "Stash_AnnotedMap");
stashMap2.spawnOnlyOnZed = true;
stashMap2.buildingX = 7752;
stashMap2.buildingY = 11970;
stashMap2.spawnTable = "uniquelootB";
stashMap2:addContainer("security_box","carpentry_03_27",nil,nil,7751,11970,3);
stashMap2:addStamp("ArrowWest",nil,7913,11889,0,0,0);
stashMap2:addStamp(nil,"Stash_TableSawMap2_Text2",7950,11870,0,0,0);
stashMap2:addStamp(nil,"Stash_TableSawMap2_Text3",7950,11890,0,0,0);
--Old Coords
--stashMap2:addStamp("media/ui/LootableMaps/map_arrowwest.png",nil,45,1133,0,0,0);
--stashMap2:addStamp(nil,"Stash_TableSawMap2_Text2",67,1133,0,0,0);
--stashMap2:addStamp(nil,"Stash_TableSawMap2_Text3",67,1153,0,0,0);
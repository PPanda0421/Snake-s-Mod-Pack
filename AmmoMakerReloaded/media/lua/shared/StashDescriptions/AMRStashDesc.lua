require "StashDescriptions/StashUtil";

-- guns
local stashMap = StashUtil.newStash("AMRStashMap1", "Map", "Base.RiversideMap", "Stash_AnnotedMap");
stashMap.spawnOnlyOnZed = true;
stashMap.barricades = 40;
stashMap.buildingX = 5717;
stashMap.buildingY = 5307;
stashMap.spawnTable = "amr_uniqueloot";
stashMap:addContainer("security_box","carpentry_03_27",nil,nil,5716,5307,0);
stashMap:addStamp("ArrowWest",nil,6020,5264,0,0,0);
stashMap:addStamp(nil,"Stash_AMRMap1_Text1",6017,5228,0,0,0);

--Old Coords
--stashMap:addStamp("media/ui/LootableMaps/map_amr1.png",nil,55,519,0,0,0);
--stashMap:addStamp("media/ui/LootableMaps/map_arrowwest.png",nil,55,550,0,0,0);
--stashMap:addStamp(nil,"Stash_AMRMap1_Text1",75,516,0,0,0);

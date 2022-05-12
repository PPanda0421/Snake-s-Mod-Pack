require "StashDescriptions/StashUtil";

local stashMap1 = StashUtil.newStash("SClothingMStashMap1", "Map", "Base.RosewoodMap", "Stash_AnnotedMap");
stashMap1.spawnOnlyOnZed = true;
stashMap1.buildingX = 3644;
stashMap1.buildingY = 8579;
stashMap1.spawnTable = "scm_uniqueloot1";
stashMap1:addContainer("security_box","carpentry_03_28",nil,nil,3645,8577,0);
--stashMap1:addStamp("media/ui/LootableMaps/map_batman.png",nil,140,73,0,0,0);
stashMap1:addStamp("ArrowWest",nil,7912,11194,0,0,0);
stashMap1:addStamp(nil,"Stash_SCMMap1_Text1",7952,11194,0,0,0);
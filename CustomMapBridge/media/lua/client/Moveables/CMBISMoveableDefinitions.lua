--***********************************************************
--**                    THE INDIE STONE                    **
--**				  Author: turbotutone				   **
--***********************************************************
require 'Moveables/ISMoveableDefinitions'
CMBISMoveableDefinitions = {};

function CMBISMoveableDefinitions.load()
    local moveableDefinitions = ISMoveableDefinitions:getInstance()
	moveableDefinitions.addToolDefinition( "WrenchB",        {"Base.Wrench", "Base.PipeWrench"},                                           nil,                    100,    "Hammering",    true  );
	moveableDefinitions.addToolDefinition( "ShovelB",        {"Base.Shovel","farming.HandShovel","Base.SnowShovel", "Base.Shovel2"},                    Perks.Farming,          100,    "bushes",       false );
	if moveableDefinitions.toolDefinitions["Wrench"] then
		moveableDefinitions.toolDefinitions["Wrench"] = moveableDefinitions.toolDefinitions["WrenchB"];
	end
	if moveableDefinitions.toolDefinitions["Shovel"] then
		moveableDefinitions.toolDefinitions["Shovel"] = moveableDefinitions.toolDefinitions["ShovelB"];
	end
	--moveableDefinitions.addToolDefinition( "Wrench",        {"Base.Wrench","Base.PipeWrench"},                                           nil,                    100,    "Hammering",    true  );
    --moveableDefinitions.reset();
    -- MATERIALS (BREAKAGE):
    --                                          _material, _returnItem, _maxAmount, _chancePerRoll
    -- Wood
    moveableDefinitions.addMaterialDefinition( "LogBed",  "Base.Log",   3,  20 );
	
    moveableDefinitions.addMaterialDefinition( "Rope",  "Base.Rope",   2,  10 );

	moveableDefinitions.addMaterialDefinition( "Bed",  "Base.Mattress",   2,  20 );
	
    -- MATERIALS (SCRAP)

    -- ###################################### Revision
    --                                      name,   tools,  perk,   _basActionTime, sound,  isWav, _baseChance;
    moveableDefinitions.addScrapDefinition( "LogBed",  {"Base.Hammer","Base.HammerStone"}, {},   Perks.Woodwork,  1000,     "Hammering",    true );
    -- not yet applied to anything

    moveableDefinitions.addScrapDefinition( "Rope",  {"Base.Hammer","Base.HammerStone"}, {},   Perks.Woodwork,  1000,     "Hammering",    true );
    -- applied to some brick objects
	
	moveableDefinitions.addScrapDefinition( "Bed",  {"Base.Hammer","Base.HammerStone"}, {},   Perks.Woodwork,  1000,     "Hammering",    true );


    -- Return Items                   material, item, amountoftries, baseChance, isStaticSize
	moveableDefinitions.addScrapItem( "LogBed",  "Base.Log",   1, 90, true );
	
	moveableDefinitions.addScrapItem( "Rope",  "Base.Rope",   1, 70, true );
	
	moveableDefinitions.addScrapItem( "Bed",  "Base.Mattress",   1, 60, true );
	
	if LGBaseGameCharacterDetails then
		moveableDefinitions.addMaterialDefinition( "CowLeather",  "Base.CowRug",   1,  30 );
		moveableDefinitions.addScrapDefinition( "CowLeather",  {"Base.Hammer","Base.HammerStone"}, {},   Perks.Woodwork,  1000,     "Hammering",    true );
		moveableDefinitions.addScrapItem( "CowLeather",  "Base.CowRug",   1, 60, true );
	end

    --object health modifiers
    moveableDefinitions.addHealthDefinition("LogBed", 2.0);
end

Events.OnGameBoot.Add(CMBISMoveableDefinitions.load);


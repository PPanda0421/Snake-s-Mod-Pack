----------------------------------------------------------------------------------
--
-- AFDigRedWormAction.lua
-- Parte del mod Advanced Fishing.
-- Creado por Snake.
--
--
-- El codigo base se encuentra en ISShovelAction.lua y ISShovelGround.lua,
-- los cuales han sido creados por Robert Johnson.
--
----------------------------------------------------------------------------------

require "TimedActions/ISBaseTimedAction"

AFDigRedWormAction = ISBaseTimedAction:derive("AFDigRedWormAction");


function AFDigRedWormAction:isValid()
	return true;
--    return self.character:getStats():getEndurance() < 1;
end


function AFDigRedWormAction:update()
	self.item:setJobDelta(self:getJobDelta());
    self.character:faceLocation(self.RedWormSquare:getX(), self.RedWormSquare:getY())
	
	self.character:setMetabolicTarget(Metabolics.UsingTools);
end


function AFDigRedWormAction:start()
	self.item:setJobType(getText("ContextMenu_Scarvengewithshovel"));
	self.item:setJobDelta(0.0);
    self.sound = getSoundManager():PlayWorldSound("Shoveling", self.RedWormSquare, 0, 10, 1, true);
	local anim = ISFarmingMenu.getShovelAnim(self.character:getPrimaryHandItem())
	self:setActionAnim(anim)
end


function AFDigRedWormAction:stop()
    if self.sound and self.sound:isPlaying() then
        self.sound:stop();
    end
    ISBaseTimedAction.stop(self);
	self.item:setJobDelta(0.0);
end


function AFDigRedWormAction:perform()
    if self.sound and self.sound:isPlaying() then
        self.sound:stop();
    end
	self.item:setJobDelta(0.0);
	-- Agregar la fatiga al jugador
--    self.character:getStats():setFatigue(self.character:getStats():getFatigue() + 0.05)
	self.character:getStats():setEndurance(self.character:getStats():getEndurance() - 0.004)
    -- Agregar la lombriz roja al inventario del jugador
	local _inventory = self.character:getInventory();

	-- Crear chances de success de acuerdo al trait que tenga el personaje.
	--local player = self.character;
	local success = 40;
	
	if self.character:HasTrait("Hiker") and not self.character:HasTrait("Formerscout") then
	    success = success + 35;
	elseif self.character:HasTrait("Formerscout") and not self.character:HasTrait("Hiker") then
	    success = success + 35;
	elseif self.character:HasTrait("Formerscout") and self.character:HasTrait("Hiker") then
	    success = success + 50;
	elseif self.character:HasTrait("Lucky") then
	    success = success + 10;
	elseif self.character:HasTrait("Unlucky") then
	    success = success - 30
    end

    if ZombRand(0,100)<=success then
		self.character:setHaloNote(getText("IGUI_PlayerText_Foundsome"), 0,255,0,300);
		local randomchance = ZombRand(3);
		if randomchance == 0 then
			self.object:getSquare():AddWorldInventoryItem("AdvancedFishing.RedWorm", 0, 0, 0);
		elseif randomchance == 1 then
			self.object:getSquare():AddWorldInventoryItem("Base.Worm", 0, 0, 0);
		else
			self.object:getSquare():AddWorldInventoryItem("Base.Stone", 0, 0, 0);
		end
		if ZombRand(3) == 0 then
			self.object:getSquare():AddWorldInventoryItem("AdvancedFishing.HiddenBox", 0, 0, 0);
		end
		if ZombRand(6) == 0 then
			self.object:getSquare():AddWorldInventoryItem("AdvancedFishing.UnusableWood", 0, 0, 0);
		end
		ISInventoryPage.renderDirty = true;
		self.character:getXp():AddXP(Perks.PlantScavenging, 1);
	else
		local txtRandom = ZombRand(1,4);
		self.character:setHaloNote(getText("IGUI_PlayerText_Foundnothing"..tostring(txtRandom)), 178,178,178,300);
	end
	local objectData = self.object:getModData();
	if objectData.remainingcav and objectData.remainingcav > 0 then
        objectData.remainingcav = objectData.remainingcav - 1;
	else
	end
    self.object:transmitModData();
	
	if self.character:getPrimaryHandItem() ~= nil and ISFarmingMenu.getShovel(self.character) then
	    self.shovel = self.character:getPrimaryHandItem();
		if ZombRand(self.shovel:getConditionLowerChance() + self.character:getMaintenanceMod() * 2) == 0 then
		    self.shovel:setCondition(self.shovel:getCondition() - 1);
            ISWorldObjectContextMenu.checkWeapon(self.character);
		else
			self.character:getXp():AddXP(Perks.Maintenance, 1);
		end
	end
	if objectData.remainingcav == 0 then
		self.character:setHaloNote(getText("UI_objectremaining0"), 255,0,0,300);
	    --luautils.okModal(getText("UI_objectremaining0"), true);
	    self.object:getSquare():transmitRemoveItemFromSquare(self.object)
	    self.object:getSquare():RemoveTileObject(self.object)
	end
	ISBaseTimedAction.perform(self);
end


function AFDigRedWormAction:new(player, RedWormSquare, object , item)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = player;
	o.RedWormSquare = RedWormSquare;
	o.object = object;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 250;
	o.caloriesModifier = 4;
	if o.character:HasTrait("Hiker") and not o.character:HasTrait("Formerscout") then
		o.maxTime = o.maxTime - 25;
	elseif o.character:HasTrait("Formerscout") and not o.character:HasTrait("Hiker") then
		o.maxTime = o.maxTime - 25;
	elseif o.character:HasTrait("Formerscout") and o.character:HasTrait("Hiker") then
		o.maxTime = o.maxTime - 75;
	elseif o.character:HasTrait("Obese") then
		o.maxTime = o.maxTime + 50;
	elseif o.character:HasTrait("Overweight") then
		o.maxTime = o.maxTime + 150;
	end
	return o
end

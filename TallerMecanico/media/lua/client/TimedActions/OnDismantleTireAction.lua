--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

OnDismantleTireAction = ISBaseTimedAction:derive("OnDismantleTireAction");

function OnDismantleTireAction:isValid()
	if TiresMenu.HaveATire(self.object) then
		if self.item ~= nil then
			return true
		end
	end
	return false
	--return true --(self.item ~= nil and self.item:getCondition())
end

function OnDismantleTireAction:waitToStart()
	self.character:faceLocation(self.square:getX(), self.square:getY())
	return self.character:shouldBeTurning()
end

function OnDismantleTireAction:update()
	self.item:setJobDelta(self:getJobDelta())
	self.character:faceLocation(self.square:getX(), self.square:getY())
    self.character:setMetabolicTarget(Metabolics.LightWork);
end

function OnDismantleTireAction:start()

	self.item:setJobType(getText("ContextMenu_DismountTire"))
	self:setAnimVariable("FoodType", "bottle");
	self:setActionAnim("fill_container_tap");
	self.character:playSound("VulcanizingMachine");
	self:setOverrideHandModels(nil, nil)
	self.item:setJobDelta(0.0)
end

function OnDismantleTireAction:stop()
	self.item:setJobDelta(0.0)
    ISBaseTimedAction.stop(self);
end

function OnDismantleTireAction:perform()
	self.item:setJobDelta(0.0);
	self:calculatecondition();
	--Eliminar el neumatico y actualizar el sprite
	if self.object:getContainer() and self.object:getContainer():getContentsWeight() > 0 then
		if self.object:getContainer():getItemFromType(self.item:getType()) then
			local obj = self.object:getContainer():getParent();
			local args = { x = obj:getX(), y = obj:getY(), z = obj:getZ(), index = obj:getObjectIndex() }
			sendClientCommand(self.character, 'object', 'emptyVulcanizer', args)
		end
	end	
	ISBaseTimedAction.perform(self);
end

function OnDismantleTireAction:calculatecondition()
	local DTire = InventoryItemFactory.CreateItem("Base.DismountedTire")
	local CarRim = InventoryItemFactory.CreateItem("Base.CarRim")
	local DTireCond = 0;
	local CarRimCond = 0;
	local rest1 = 0;
	local rest2 = 0;
	local DTireData = DTire:getModData();
	local CarRimData = CarRim:getModData();
	local extraname = "";
	if self.item:getCondition() then
		local totalcond = self.item:getCondition() * 2;
		DTireCond = ZombRand(totalcond + 1);
		if DTireCond > 100 then
			rest1 = DTireCond - 100;
			CarRimCond = (totalcond - DTireCond) + rest1
			DTireCond = 100;
		elseif DTireCond < 100 then
			CarRimCond = (totalcond - DTireCond);
			if CarRimCond > 100 then
				rest2 = CarRimCond - 100;
				DTireCond = DTireCond + rest2;
				CarRimCond = 100;
			end
		else
			DTireCond = 100;
			CarRimCond = 100;
		end
		
		DTire:setCondition(DTireCond)
		CarRim:setCondition(CarRimCond)
		local Type = tostring(self.item:getType());
		local Name = tostring(self.item:getName());
		if not DTireData.TireType then
			DTireData.TireType = Type;
		end
		if not DTireData.TireName then
			DTireData.TireName = Name;
		end
		if not CarRimData.TireType then
			CarRimData.TireType = Type;
		end
		if not CarRimData.TireName then
			CarRimData.TireName = Name;
		end
		if PMRMTireDef[Type] then
			extraname = PMRMTireDef[Type].translation;
		end
		DTire:setName(getItemNameFromFullType("Base.DismountedTire") .. " " .. getText(extraname));
		CarRim:setName(getItemNameFromFullType("Base.CarRim") .. " " .. getText(extraname));
	end
	self:DropItem(DTire);
	self:DropItem(CarRim);
	
end

function OnDismantleTireAction:DropItem(itemtodrop)
	self.character:getCurrentSquare():AddWorldInventoryItem(itemtodrop,
	self.character:getX() - math.floor(self.character:getX()),
	self.character:getY() - math.floor(self.character:getY()),
	self.character:getZ() - math.floor(self.character:getZ()))
	ISInventoryPage.renderDirty = true;
end

function OnDismantleTireAction:getTireItem(obj)
	local Tire = nil;
	if obj:getContainer() and obj:getContainer():getContentsWeight() > 0 then
		local it = obj:getContainer():getItems();
		for i = 0, it:size()-1 do
			local Titem = it:get(i);
			if Titem:getType() == "OldTire1" or
			  Titem:getType() == "OldTire2" or 
			  Titem:getType() == "OldTire3" or
			  Titem:getType() == "NormalTire1" or
			  Titem:getType() == "NormalTire2" or
			  Titem:getType() == "NormalTire3" or
			  Titem:getType() == "ModernTire1" or
			  Titem:getType() == "ModernTire2" or
			  Titem:getType() == "ModernTire3" then
				Tire = Titem;
			end
		end
	end
	return Tire;
end

function OnDismantleTireAction:new(character, object)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.object = object;
	o.item = OnDismantleTireAction:getTireItem(object);
    o.square = object:getSquare();
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 300;
	return o;
end

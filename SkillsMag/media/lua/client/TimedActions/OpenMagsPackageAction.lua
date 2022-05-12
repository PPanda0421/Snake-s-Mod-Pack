require ("TimedActions/ISBaseTimedAction");

OpenMagsPackageAction = ISBaseTimedAction:derive("OpenMagsPackageAction");

function OpenMagsPackageAction:isValid()
	return self.character:getInventory() and self.character:getInventory():contains(self.item);
end

function OpenMagsPackageAction:update()
    self.item:setJobDelta(self:getJobDelta());
end

function OpenMagsPackageAction:start()
	self.character:playSound("OpenBag")
    self.item:setJobType(getText("ContextMenu_OpeningPackage"));
    self.item:setJobDelta(0.0);
	self:setActionAnim("Loot");
	self:setOverrideHandModels(nil, nil);
	self.character:clearVariable("LootPosition");
	self:setAnimVariable("LootPosition", "Low");

--    self.character:getEmitter():playSoundImpl("FishingLureBrowse", nil);
end


function OpenMagsPackageAction:stop()

	ISBaseTimedAction.stop(self);
	self.item:setJobDelta(0.0);
end

function OpenMagsPackageAction:perform()
    self.item:setJobDelta(0.0);
	--item = SkillMagsDefinitions[ZombRand(1, #SkillMagsDefinitions +1)]
	for i=1, 10 do
		local itemtogive = SkillMagsDefinitions.items[ZombRand(1, #SkillMagsDefinitions.items +1)];
		--self.character:Say(tostring(itemtogive))
		self.character:getInventory():AddItem("SkillMag.SkillMag" .. tostring(itemtogive));
	end

	self.item:Use();
	
	ISBaseTimedAction.perform(self);
end

function OpenMagsPackageAction:new(character, item, time)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o.character = character;
	o.item = item;
	o.stopOnWalk = false;
	o.stopOnRun = true;
	o.maxTime = 50;
	return o;
end
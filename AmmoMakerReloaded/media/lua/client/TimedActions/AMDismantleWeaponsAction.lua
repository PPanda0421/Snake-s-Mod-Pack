require ("TimedActions/ISBaseTimedAction");

AMDismantleWeaponsAction = ISBaseTimedAction:derive("AMDismantleWeaponsAction");

function AMDismantleWeaponsAction:isValid()
	-- if AmmoDefinitions[self.material] then
		-- return true
	-- end
	-- return false
	return true
end

function AMDismantleWeaponsAction:waitToStart()
	self.character:faceLocation(self.reloadingtable:getX(), self.reloadingtable:getY())
	return self.character:shouldBeTurning()
end

function AMDismantleWeaponsAction:update()
	self.item:setJobDelta(self:getJobDelta())
	self.character:faceLocation(self.reloadingtable:getX(), self.reloadingtable:getY());
	
	self.character:setMetabolicTarget(Metabolics.UsingTools);
end

function AMDismantleWeaponsAction:start()
	self.character:playSound("DismantleFirearm");
	--self.character:Say(tostring(self.maxTime))
	self:setActionAnim(CharacterActionAnims.Craft);
	self.item:setJobDelta(0.0)
end

function AMDismantleWeaponsAction:stop()
	self.item:setJobDelta(0.0)
	ISBaseTimedAction.stop(self);
end

function AMDismantleWeaponsAction:perform()
	self.item:setJobDelta(0.0)
	local number = 1;
	local itemtoadd = nil;
	local percent = tonumber(self.item:getCondition() * 100 / self.item:getConditionMax());
	local wp = self.item:getType();
	local maxparts = 3;
	if wp == "Pistol" then
		itemtoadd = "Base.M9Parts";
	elseif wp == "Pistol2" then
		itemtoadd = "Base.M1911Parts";
	elseif wp == "Pistol3" then
		itemtoadd = "Base.DEParts";
	elseif wp == "Revolver" then
		itemtoadd = "Base.RevolverParts";
	elseif wp == "Revolver_Long" then
		itemtoadd = "Base.Revolver_LongParts";
	elseif wp == "Revolver_Short" then
		itemtoadd = "Base.Revolver_ShortParts";
	elseif wp == "Shotgun" then
		itemtoadd = "Base.ShotgunParts";
	elseif wp == "DoubleBarrelShotgun" then
		itemtoadd = "Base.DoubleBarrelShotgunParts";
	elseif wp == "ShotgunSawnoff" then
		itemtoadd = "Base.ShotgunParts";
		maxparts = 1;
	elseif wp == "DoubleBarrelShotgunSawnoff" then
		itemtoadd = "Base.DoubleBarrelShotgunParts";
		maxparts = 1;
	elseif wp == "VarmintRifle" then
		itemtoadd = "Base.VarmintRifleParts";
	elseif wp == "HuntingRifle" then
		itemtoadd = "Base.HuntingRifleParts";
	elseif wp == "AssaultRifle" then
		itemtoadd = "Base.AssaultRifleParts";
	elseif wp == "AssaultRifle2" then
		itemtoadd = "Base.AssaultRifle2Parts";
	elseif wp == "AK47" then
		itemtoadd = "Base.AK47Parts";
	end
	number = math.floor(percent * maxparts / 100);
	if number <= 0 then
		number = 1;
	end
	if itemtoadd ~= nil then
		local itemsAdded = self.character:getInventory():AddItems(itemtoadd, number);
		local bothhands = false;
		if self.item:isTwoHandWeapon() and self.character:isItemInBothHands(self.item) then
			bothhands = true;
		end
		self.character:getPrimaryHandItem():Use();
		self.character:setPrimaryHandItem(nil);
		if bothhands then
			self.character:setSecondaryHandItem(nil);
		end
		if itemsAdded then
			for i=1,itemsAdded:size() do
				self.character:getXp():AddXP(Perks.AMReloading, 1);
				self:addOrDropItem(itemsAdded:get(i-1));
			end
		end
	end
    ISBaseTimedAction.perform(self);
end

function AMDismantleWeaponsAction:addOrDropItem(itemtoadd)
	local inv = self.character:getInventory()
	if not inv:contains(itemtoadd) then
		inv:AddItem(itemtoadd)
	end
	if inv:getCapacityWeight() > inv:getEffectiveCapacity(self.character) then
		if inv:contains(itemtoadd) then
			inv:Remove(itemtoadd)
		end
		self.character:getCurrentSquare():AddWorldInventoryItem(itemtoadd,
		self.character:getX() - math.floor(self.character:getX()),
		self.character:getY() - math.floor(self.character:getY()),
		self.character:getZ() - math.floor(self.character:getZ()))
		ISInventoryPage.renderDirty = true;
	end
end


function AMDismantleWeaponsAction:new(reloadingtable, character, item)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o.reloadingtable = reloadingtable;
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 300;
	o.maxTime = o.maxTime - (o.character:getPerkLevel(Perks.AMReloading) * 15);
	o.maxTime = o.maxTime + (o.character:getMoodles():getMoodleLevel(MoodleType.Panic) * 10);
	if o.character:HasTrait("Gunnut") then
		o.maxTime = o.maxTime * 0.75;
	elseif o.character:HasTrait("militaryreloader") then
		o.maxTime = o.maxTime * 0.5;
	end
	return o;
end
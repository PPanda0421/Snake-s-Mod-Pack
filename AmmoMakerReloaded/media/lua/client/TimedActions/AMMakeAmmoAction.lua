require ("TimedActions/ISBaseTimedAction");

AMMakeAmmoAction = ISBaseTimedAction:derive("AMMakeAmmoAction");

function AMMakeAmmoAction:isValid()
	if AmmoDefinitions[self.result] then
		return true
	end
	return false
end

function AMMakeAmmoAction:update()
	self.character:faceLocation(self.reloadingtable:getX(), self.reloadingtable:getY());
	
	self.character:setMetabolicTarget(Metabolics.UsingTools);
end

function AMMakeAmmoAction:start()
	self.character:playSound("Makebullets");
	self:setActionAnim(CharacterActionAnims.Craft);
end

function AMMakeAmmoAction:stop()
	ISBaseTimedAction.stop(self);
end

function AMMakeAmmoAction:perform()

	local item1removed = nil;
	local item2removed = nil;
	local item3removed = nil;
	local item1 = AmmoDefinitions[self.result].materials[1];
	local item2 = AmmoDefinitions[self.result].materials[2];
	local item3 = AmmoDefinitions[self.result].materials[3];
	local ExpNmb = AmmoDefinitions[self.result].expmult * self.casqNb;
	local contains1 = nil;
	local contains2 = nil;
	local contains3 = nil;
	local actiontime = AmmoDefinitions[self.result].loadtime;
	local _inventory = self.character:getInventory();

	if _inventory:contains(item1) then
		contains1 = true;
	end
	if _inventory:contains(item2) then
		contains2 = true;
	end
	if _inventory:contains(item3) then
		contains3 = true;
	end

	if contains1 ~= nil and contains2 ~= nil and contains3 ~= nil then
		local stacks1 = _inventory:FindAll("AmmoMaker." .. item1);
		if stacks1:size() >= self.casqNb then
			for i=1, self.casqNb do
				_inventory:Remove(item1);
				item1removed = true;
			end
		end
		local stacks2 = _inventory:FindAll("AmmoMaker." .. item2);
		if stacks2:size() >= self.leadNb then
			for i=1, self.leadNb do
				_inventory:Remove(item2);
				item2removed = true;
			end
		end
		local stacks3 = _inventory:FindAll("Base." .. item3);
		if stacks3:size() >= self.gunpowderNb then
			for i=1, self.gunpowderNb do
				_inventory:Remove(item3);
				item3removed = true;
			end
		end
	end

	if item1removed ~= nil and item2removed ~= nil and item3removed ~= nil then
		local itemsAdded = _inventory:AddItem(instanceItem(self.result));
		if itemsAdded then
			--for i=1,itemsAdded:size() do
				self:addOrDropItem(itemsAdded);
			--end
		end
		
		if self.character:getDescriptor():getProfession() == "ammospecialist" or self.character:getDescriptor():getProfession() == "veteran" then
			getSpecificPlayer(0):getBodyDamage():setBoredomLevel(getSpecificPlayer(0):getBodyDamage():getBoredomLevel() - 0.5);
			getSpecificPlayer(0):getBodyDamage():setUnhappynessLevel(getSpecificPlayer(0):getBodyDamage():getUnhappynessLevel() - 0.2)
		end
		self.character:getXp():AddXP(Perks.Strength, ExpNmb);
		--if ZombRand(3) == 0 then
			self.character:getXp():AddXP(Perks.AMReloading, 1);
		--end
		self:checkifneedtransfer(self.character, item1, item2, item3, actiontime)
	end

    ISBaseTimedAction.perform(self);
end

function AMMakeAmmoAction:addOrDropItem(itemtoadd)
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
	end
end

function AMMakeAmmoAction:checkifneedtransfer(player, item1, item2, item3, actiontime)
	local stacks1 = nil;
	local stacks2 = nil;
	local stacks3 = nil;
	local contstacks1 = nil;
	local contstacks2 = nil;
	local contstacks3 = nil;
	local _inventory = self.character:getInventory();
	local _continventory = self.reloadingtable:getContainer();
	local item1nb = 0;
	local item1nbc = 0;
	local item2nb = 0;
	local item2nbc = 0;
	local item2nb = 0;
	local item2nbc = 0;
	local canmake1 = false;
	local canmake2 = false;
	local canmake3 = false;

	if _inventory:contains(item1) then
		stacks1 = _inventory:FindAll("AmmoMaker." .. item1);
	else
		stacks1 = nil;
	end
	if _continventory:getItems() and _continventory:contains(item1) then
		contstacks1 = _continventory:FindAll("AmmoMaker." .. item1);
	else
		contstacks1 = nil;
	end
	if stacks1 ~= nil then
		item1nb = stacks1:size();
	else
		item1nb = 0;
	end
	if contstacks1 ~= nil then
		item1nbc = contstacks1:size();
	else
		item1nbc = 0;
	end
	-------------------------------------------------------------------------
	if _inventory:contains(item2) then
		stacks2 = _inventory:FindAll("AmmoMaker." .. item2);
	else
		stacks2 = nil;
	end
	if _continventory:getItems() and _continventory:contains(item2) then
		contstacks2 = _continventory:FindAll("AmmoMaker." .. item2);
	else
		contstacks2 = nil;
	end
	if stacks2 ~= nil then
		item2nb = stacks2:size();
	else
		item2nb = 0;
	end
	if contstacks2 ~= nil then
		item2nbc = contstacks2:size();
	else
		item2nbc = 0;
	end
	--------------------------------------------------------------------------
	if _inventory:contains(item3) then
		stacks3 = _inventory:FindAll("Base." .. item3);
	else
		stacks3 = nil;
	end
	if _continventory:getItems() and _continventory:contains(item3) then
		contstacks3 = _continventory:FindAll("Base." .. item3);
	else
		contstacks3 = nil;
	end
	if stacks3 ~= nil then
		item3nb = stacks3:size();
	else
		item3nb = 0;
	end
	if contstacks3 ~= nil then
		item3nbc = contstacks3:size();
	else
		item3nbc = 0;
	end
	if item1nb + item1nbc >= self.casqNb then
		canmake1 = true;
	end
	if item2nb + item2nbc >= self.leadNb then
		canmake2 = true;
	end
	if item3nb + item3nbc >= self.gunpowderNb then
		canmake3 = true;
	end

	if canmake1 and canmake2 and canmake3 then
		ISAMReloadingMenu.TransferItems(player, stacks1, contstacks1, self.casqNb);
		ISAMReloadingMenu.TransferItems(player, stacks2, contstacks2, self.leadNb);
		ISAMReloadingMenu.TransferItems(player, stacks3, contstacks3, self.gunpowderNb);
		ISTimedActionQueue.add(AMMakeAmmoAction:new(self.reloadingtable, player, self.result, actiontime, self.casqNb, self.leadNb, self.gunpowderNb));
	end
end

function AMMakeAmmoAction:new(reloadingtable, character, result, time, casqNb, leadNb, gunpowderNb)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o.reloadingtable = reloadingtable;
	o.character = character;
	o.result = result;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	o.casqNb = casqNb;
	o.leadNb = leadNb;
	o.gunpowderNb = gunpowderNb;
	return o;
end
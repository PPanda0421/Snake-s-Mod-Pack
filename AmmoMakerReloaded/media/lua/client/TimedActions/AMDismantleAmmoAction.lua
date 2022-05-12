require ("TimedActions/ISBaseTimedAction");

AMDismantleAmmoAction = ISBaseTimedAction:derive("AMDismantleAmmoAction");

function AMDismantleAmmoAction:isValid()
	if AmmoDefinitions[self.material] then
		return true
	end
	return false
end

function AMDismantleAmmoAction:update()
	self.character:faceLocation(self.reloadingtable:getX(), self.reloadingtable:getY());
	
	self.character:setMetabolicTarget(Metabolics.UsingTools);
end

function AMDismantleAmmoAction:start()
	self.character:playSound("LeadMaker");
	self:setActionAnim(CharacterActionAnims.Craft);
end

function AMDismantleAmmoAction:stop()
	ISBaseTimedAction.stop(self);
end

function AMDismantleAmmoAction:perform()

	local item1removed = nil;
	local item1 = "AmmoMaker." .. AmmoDefinitions[self.material].materials[1]
	local item2 = "AmmoMaker." .. AmmoDefinitions[self.material].materials[2];
	local item3q = AmmoDefinitions[self.material].powdernb;
	local contains1 = nil;
	local _inventory = self.character:getInventory();
	local materialtype = AmmoDefinitions[self.material].ammotype;
	
	if _inventory:contains(materialtype) then
		contains1 = true;
	end

	if contains1 ~= nil then
		local stacks1 = _inventory:FindAll(materialtype);
		if stacks1:size() >= 1 then
			for i=1, 1 do
				_inventory:Remove(materialtype);
				item1removed = true;
			end
		end
	end

	--if item1removed ~= nil then
	--	_inventory:AddItem(item1);
	--	if materialtype == "ShotgunShells" then
	--		_inventory:AddItems(item2, 25);
	--	else
	--		_inventory:AddItem(item2);
	--	end
	--	_inventory:AddItems("Base.GunPowder", item3q);
	if item1removed ~= nil then 
		local itemsAdded1 = self.character:getInventory():AddItem(item1);
		if itemsAdded1 then
			self:addOrDropItem(itemsAdded1);
		end
		local itemsAdded2 = nil;
		if materialtype == "ShotgunShells" then
			itemsAdded2 = self.character:getInventory():AddItems(item2, 25);
		else
			itemsAdded2 = self.character:getInventory():AddItems(item2, 1);
		end
		if itemsAdded2 then
			if itemsAdded2:size() ~= nil then
				for i=1,itemsAdded2:size() do
					self:addOrDropItem(itemsAdded2:get(i-1));
				end
			else
				self:addOrDropItem(itemsAdded2);
			end
		end
		local itemsAdded3 = self.character:getInventory():AddItems("Base.GunPowder", item3q);
		if itemsAdded3 then
			if itemsAdded3:size() ~= nil then
				for i=1,itemsAdded3:size() do
					self:addOrDropItem(itemsAdded3:get(i-1));
				end
			else
				self:addOrDropItem(itemsAdded3);
			end
		end		
		
		if self.character:getDescriptor():getProfession() == "ammospecialist" or self.character:getDescriptor():getProfession() == "veteran" then
			getSpecificPlayer(0):getBodyDamage():setBoredomLevel(getSpecificPlayer(0):getBodyDamage():getBoredomLevel() - 0.5);
			getSpecificPlayer(0):getBodyDamage():setUnhappynessLevel(getSpecificPlayer(0):getBodyDamage():getUnhappynessLevel() - 0.2)
		end
		self.character:getXp():AddXP(Perks.AMReloading, 1);
		self:checkifneedtransfer(self.character, materialtype, self.material)
	end

    ISBaseTimedAction.perform(self);
end

function AMDismantleAmmoAction:addOrDropItem(itemtoadd)
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

function AMDismantleAmmoAction:checkifneedtransfer(player, mat, matfulltype)
	local stacks1 = nil;
	local contstacks1 = nil;
	local _inventory = self.character:getInventory();
	local _continventory = self.reloadingtable:getContainer();
	local item1nb = 0;
	local item1nbc = 0;
	local canmake1 = false;

	if _inventory:contains(mat) then
		stacks1 = _inventory:FindAll(mat);
	else
		stacks1 = nil;
	end
	if _continventory:getItems() and _continventory:contains(mat) then
		contstacks1 = _continventory:FindAll(mat);
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

	if item1nb + item1nbc >= 1 then
		canmake1 = true;
	end

	if canmake1 then
		ISAMReloadingMenu.TransferItems(player, stacks1, contstacks1, 1);

		ISTimedActionQueue.add(AMDismantleAmmoAction:new(self.reloadingtable, player, matfulltype, 30));
	end
end

function AMDismantleAmmoAction:new(reloadingtable, character, material, time)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o.reloadingtable = reloadingtable;
	o.character = character;
	o.material = material;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	return o;
end
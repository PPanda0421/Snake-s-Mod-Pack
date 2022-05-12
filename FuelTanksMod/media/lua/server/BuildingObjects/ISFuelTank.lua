--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

ISFuelTank = ISBuildingObject:derive("ISFuelTank");

--************************************************************************--
--** ISFuelTank:new
--**
--************************************************************************--
function ISFuelTank:create(x, y, z, north, sprite)
	local cell = getWorld():getCell();
	self.sq = cell:getGridSquare(x, y, z);
	self.javaObject = IsoThumpable.new(cell, self.sq, sprite, north, self);
	buildUtil.setInfo(self.javaObject, self);
	buildUtil.consumeMaterial(self);
	if not self.health then
        self.javaObject:setMaxHealth(self:getHealth());
    else
        self.javaObject:setMaxHealth(self.health);
    end
	--self.javaObject:setMaxHealth(self:getHealth());
	self.javaObject:setHealth(self.javaObject:getMaxHealth());
	-- the sound that will be played when our door frame will be broken
	self.javaObject:setBreakSound("BreakObject");
	-- add the item to the ground
    self.sq:AddSpecialObject(self.javaObject);
	
	self.javaObject:transmitCompleteItemToServer();
end

function ISFuelTank:removeFromGround(square)
	for i = 0, square:getSpecialObjects():size() do
		local thump = square:getSpecialObjects():get(i);
		if instanceof(thump, "IsoThumpable") then
			square:transmitRemoveItemFromSquare(thump);
		end
	end
end

function ISFuelTank:onTimedActionStart(action)
	if self.actionAnim then
		-- Log Wall
		action:setActionAnim(self.actionAnim)
		action:setOverrideHandModels(action.character:getPrimaryHandItem(), nil)
		--action.character:SetVariable("LootPosition", "High")
		--action:setOverrideHandModels(nil, nil)
		return
	end
	ISBuildingObject.onTimedActionStart(self, action)
end

function ISFuelTank:new(name, sprite, northSprite)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o:init();
	o:setSprite(sprite);
	o:setNorthSprite(northSprite);
	o.name = name;
	o.canBarricade = false;
	o.dismantable = true;
	o.blockAllTheSquare = true;
	o.canBeAlwaysPlaced = true;
	o.buildLow = true;
	return o;
end

-- return the health of the new container, it's 100 + 100 per carpentry lvl
function ISFuelTank:getHealth()
	return 100 + buildUtil.getWoodHealth(self);
end

function ISFuelTank:isValid(square)
	if not ISBuildingObject.isValid(self, square) then return false; end
	if not buildUtil.canBePlace(self, square) then return false end
	if self.needToBeAgainstWall then
        for i=0,square:getObjects():size()-1 do
           local obj = square:getObjects():get(i);
           if (self.north and obj:getProperties():Is("WallN")) or (not self.north and obj:getProperties():Is("WallW")) then
               return true;
           end
        end
        return false;
    else
        if buildUtil.stairIsBlockingPlacement( square, true ) then return false; end
    end
    return true;
end

function ISFuelTank:render(x, y, z, square)
	ISBuildingObject.render(self, x, y, z, square)
end
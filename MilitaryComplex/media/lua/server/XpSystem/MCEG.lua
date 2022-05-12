EG = {};
EG.onNewGame = function(playerObj, square)
	--local player = playerObj;
	local EasterEgg = EG.getEGName();
	if EasterEgg then
		local x = nil;
		local y = nil;
		local z = nil;
		if (playerObj:getDescriptor():getForename() == "Alice" or playerObj:getDescriptor():getForename() == "alice") then
			if getWorld():getDifficulty() == "Easy" then
				x =5570;
				y =9207;
				z =0;
			elseif getWorld():getDifficulty() == "Normal" then
				x =5570;
				y =9207;
				z =0;		
			elseif getWorld():getDifficulty() == "Hard" then
				x =5583;
				y =9172;
				z =1;
			else
				x =5570;
				y =9207;
				z =0;	
			end
			if x ~= nil and y~= nil and z~= nil then
				playerObj:setX(x)
				playerObj:setY(y)
				playerObj:setZ(z)
				playerObj:setLx(x)
				playerObj:setLy(y)
				playerObj:setLz(z)				
			end

			local inv = playerObj:getInventory();
			local items = inv:getItemsFromCategory("Clothing")
			for i=1,items:size() do
				local item = items:get(i-1)
				playerObj:removeWornItem(item);
				inv:Remove(item);
			end
			getCore():setGotNewBelt(true);
			getCore():saveOptions();
			playerObj:getHumanVisual():setSkinTextureIndex(0)
			playerObj:getHumanVisual():setHairModel("Bob");
			playerObj:getHumanVisual():setHairColor(ImmutableColor.new(134/255,66/255,48/255));
			local Scalpel = playerObj:getInventory():AddItem("Base.Scalpel");
			playerObj:setPrimaryHandItem(Scalpel);
			local flipflops = playerObj:getInventory():AddItem("Base.Shoes_FlipFlop");
			playerObj:setWornItem(flipflops:getBodyLocation(), flipflops);

			local hospitalsuit = playerObj:getInventory():AddItem("Base.HospitalGown");
			playerObj:setWornItem(hospitalsuit:getBodyLocation(), hospitalsuit);
		end

		if (playerObj:getDescriptor():getForename() == "Rick" or playerObj:getDescriptor():getForename() == "rick") then
			if getWorld():getDifficulty() == "Easy" then
				x =5570;
				y =9207;
				z =0;
			elseif getWorld():getDifficulty() == "Normal" then
				x =5570;
				y =9207;
				z =0;	
			elseif getWorld():getDifficulty() == "Hard" then
				x =5583;
				y =9172;
				z =1;
			else
				x =5583;
				y =9172;
				z =1;
			end
			if x ~= nil and y~= nil and z~= nil then
				playerObj:setX(x)
				playerObj:setY(y)
				playerObj:setZ(z)
				playerObj:setLx(x)
				playerObj:setLy(y)
				playerObj:setLz(z)				
			end

			local inv = playerObj:getInventory();
			local items = inv:getItemsFromCategory("Clothing")
			for i=1,items:size() do
				local item = items:get(i-1)
				playerObj:removeWornItem(item);
				inv:Remove(item);
			end
			getCore():setGotNewBelt(true);
			getCore():saveOptions();
			playerObj:getHumanVisual():setSkinTextureIndex(0)
			playerObj:getHumanVisual():setHairModel("Short");
			playerObj:getHumanVisual():setHairColor(ImmutableColor.new(0.43529412,0.34117648,0.23529412,1.0));
			playerObj:getHumanVisual():setBeardModel("Full");
			playerObj:getHumanVisual():setBeardColor(ImmutableColor.new(0.3372549,0.2627451,0.1764706,1.0));
			
			playerObj:getInventory():AddItem("Base.Matches");
			--playerObj:setPrimaryHandItem(Scalpel);
			local flipflops = playerObj:getInventory():AddItem("Base.Shoes_FlipFlop");
			playerObj:setWornItem(flipflops:getBodyLocation(), flipflops);

			local hospitalsuit = playerObj:getInventory():AddItem("Base.HospitalGown");
			playerObj:setWornItem(hospitalsuit:getBodyLocation(), hospitalsuit);
		end

		--playerObj:getInventory():AddItems("Base.Pistol", 2);
	end
end

function EG:getEGName()
	local result = false
	local playerObj = getSpecificPlayer(0);
	if playerObj == nil then return false end
	local name = playerObj:getDescriptor():getForename();
	local surname = playerObj:getDescriptor():getSurname();
	if (name == "Alice" or name == "alice") and 
		(surname == "Abernathy" or surname == "abernathy") and 
		playerObj:getDescriptor():isFemale() then
		result = true;
	elseif (name == "Rick" or name == "rick") and 
		(surname == "Grimes" or surname == "grimes") and
		playerObj:getDescriptor():getProfession() == "policeofficer" and
		not playerObj:getDescriptor():isFemale() then
		result = true;
	end
	return result;
end

EG.onStartGame = function()
	local playerObj = getSpecificPlayer(0);
	local EasterEgg = EG.getEGName(playerObj);
	if EasterEgg then
		local mData = playerObj:getModData();
		if not mData.Spawned then
			mData.Spawned = "yes";
		end
	end
end
Events.OnNewGame.Add(EG.onNewGame);
--Events.OnGameStart.Add(EG.onStartGame);
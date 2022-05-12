PaintingMachineMenu = {};

local function predicateNotEmpty(item)
	return item:getUsedDelta() > 0
end

local function predicateDrainableUsesInt(item, count)
	return item:getDrainableUsesInt() >= count
end

PaintingMachineMenu.PaintBuckets ={
	"PaintRed", 
	"PaintBlack",
	"PaintBlue",
	"PaintBrown",
	"PaintCyan",
	"PaintGreen",
	"PaintGrey",
	"PaintLightBlue",
	"PaintLightBrown",
	"PaintOrange",
	"PaintPink",
	"PaintPurple",
	"PaintTurquoise",
	"PaintWhite",
	"PaintYellow"
};

PaintingMachineMenu.doBuildMenu = function(player, context, worldobjects)

	if test and ISWorldObjectContextMenu.Test then return true end

    if getCore():getGameMode()=="LastStand" then
        return;
    end
	local playerObj = getSpecificPlayer(player);
	local PMachine = nil;

	for i,v in ipairs(worldobjects) do
		for i=0,v:getSquare():getObjects():size()-1 do
			local object = v:getSquare():getObjects():get(i);
			if instanceof(object, "IsoObject") and
			  object:getSprite() and
			  object:getSprite():getProperties() and
			  ( object:getSprite():getProperties():Val("GroupName") == "Car" and object:getSprite():getProperties():Val("CustomName") == "Paint Machine") then
				
				PMachine = object;
				break;
			end
		end
	end

	if PMachine == nil then return;end
	
	if PMachine ~= nil then
		--Menu Contextual y funcion de tooltip
		-- Titulo y creacion de submenu
		--MetaDatos del objeto
		local PMachineData = PMachine:getModData();
		PaintingMachineMenu.doMachineData(PMachineData)
		-----
		
		local FirstTitle = context:addOption(getText("ContextMenu_CarPaintingMachine"), worldobjects, nil);
		PaintingMachineMenu.PopulateFirstTooltip(FirstTitle, player, PMachine, PMachineData)
		local SubMenu = context:getNew(context);
		context:addSubMenu(FirstTitle, SubMenu);
		-------
		local Filloption = SubMenu:addOption(getText("ContextMenu_ChargePaint"), worldobjects, nil);
		PaintingMachineMenu.PopulateFirstTooltip(Filloption, player, PMachine, PMachineData)
		local subMenuFill = SubMenu:getNew(SubMenu);
        context:addSubMenu(Filloption, subMenuFill);
		PaintingMachineMenu.doOptions(subMenuFill, player, PMachine, PMachineData)
		-----
		local Takeoption = SubMenu:addOption(getText("ContextMenu_TakePaint"), worldobjects, nil);
		PaintingMachineMenu.PopulateFirstTooltip(Takeoption, player, PMachine, PMachineData)
		local subMenuTake = SubMenu:getNew(SubMenu);
        context:addSubMenu(Takeoption, subMenuTake);	
		
	end
end
PaintingMachineMenu.PopulateFirstTooltip = function(Menu, player, PMachine, PMachineData)
	local isFull = PaintingMachineMenu.CheckFull(PMachineData);
	local tooltip = ISInventoryPaneContextMenu.addToolTip();
	Menu.toolTip = tooltip;
	tooltip:setName(getText("ContextMenu_PMachineInfo"));
	tooltip:setTexture("media/ui/PaintingMachine.png")
	PaintingMachineMenu.doDescription(tooltip, Menu, PMachineData, true)
	if isFull then
		tooltip.description = tooltip.description .. " <RGB:0,1,0>" .. getText("ContextMenu_MachineFull");
		tooltip.footNote = getText("ContextMenu_AllFull");
	else
		tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getText("ContextMenu_MachineEmpty");
		tooltip.footNote = getText("ContextMenu_NeedPaint");
	end
end

PaintingMachineMenu.doOptions = function(SubMenu, player, PMachine, PMachineData)
	local playerObj = getSpecificPlayer(player);
	local playerInv = playerObj:getInventory()
	local index = 0;
	local isFull = PaintingMachineMenu.CheckFull(PMachineData);
	for i = 1, #PaintingMachineMenu.PaintBuckets do
		index = index +1;
		local PaintType = PaintingMachineMenu.PaintBuckets[index];
		local _option = SubMenu:addOption(getItemNameFromFullType("Base." .. PaintType), PMachine, PaintingMachineMenu.onFillMachine, player, PaintType);
		local tooltip = ISInventoryPaneContextMenu.addToolTip();
		_option.toolTip = tooltip;
		tooltip:setName(getText("ContextMenu_FillPaint") .. " " .. getItemNameFromFullType("Base." .. PaintType));
		tooltip:setTexture("media/ui/PaintingMachine.png")
		PaintingMachineMenu.doDescription(tooltip, _option, PMachineData, false)
		if isFull then
			tooltip.description = tooltip.description .. " <RGB:0,1,0>" .. getText("ContextMenu_MachineFull");
			tooltip.footNote = getText("ContextMenu_AllFull");
		else
			tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getText("ContextMenu_MachineEmpty");
			tooltip.footNote = getText("ContextMenu_NeedPaint");
		end
		if playerInv:containsTypeRecurse(PaintType) then
			--nothing
		else
			_option.notAvailable = true;
		end
		if PMachineData[PaintType] and PMachineData[PaintType] >= 5 then
			_option.notAvailable = true;
		end
	end
end

PaintingMachineMenu.doDescription = function(tooltip, _option, PMachineData, First)
	if First then
		tooltip.description = "";
	else
		tooltip.description = " <RGB:1,1,0>" .. getText("ContextMenu_PMDesc") .. " <LINE>";
	end
	local index = 0;
	for i = 1, #PaintingMachineMenu.PaintBuckets do
		index = index +1;
		local PaintType = PaintingMachineMenu.PaintBuckets[index];
		tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base." .. PaintType) .. ": " .. PaintingMachineMenu.doColorValue(PMachineData[PaintType]) .. "/5" .. " <LINE>";
	end	
end

PaintingMachineMenu.doColorValue = function(value)
	local text = " <RGB:1,1,1>";
	if value == 0 then
		text = " <RGB:1,0,0>"
	elseif value == 1 then
		text = " <RGB:0.98,0.55,0>"	
	elseif value == 2 then
		text = " <RGB:1,1,0>"
	elseif value == 3 then
		text = " <RGB:0.78,0.91,0.27>"
	elseif value == 4 then
		text = " <RGB:0.37,0.66,0.09>"
	elseif value == 5 then
		text = " <RGB:0,1,0>"
	end
	return text .. tostring(value);
end

PaintingMachineMenu.doMachineData = function(PMachineData)
	local index = 0;
	for i = 1, #PaintingMachineMenu.PaintBuckets do
		index = index +1;
		local PaintType = PaintingMachineMenu.PaintBuckets[index];
		if not PMachineData[PaintType] then
			PMachineData[PaintType] = ZombRand(6);
		end
	end
end

PaintingMachineMenu.CheckFull = function(PMachineData)
	if not PMachineData.Full then
		PMachineData.Full = true;
	end
	local index = 0;
	for i = 1, #PaintingMachineMenu.PaintBuckets do
		index = index +1;
		local PaintType = PaintingMachineMenu.PaintBuckets[index];
		if PMachineData[PaintType] and PMachineData[PaintType] < 5 then
			PMachineData.Full = false;
			break;
		end
	end
	return PMachineData.Full
end


PaintingMachineMenu.onFillMachine = function(PMachine, player, PaintType)
	local Paint = nil
	local playerObj = getSpecificPlayer(player);
	local equipped = playerObj:getPrimaryHandItem()
	if equipped and equipped:getType() == PaintType and equipped:getUsedDelta() > 0 then
		Paint = equipped
	end
	if not Paint then
		local cans = playerObj:getInventory():getAllTypeEvalRecurse(PaintType, predicateNotEmpty)
		for i=1,cans:size() do
			local Paint2 = cans:get(i-1)
			if Paint2:getUsedDelta() > 0 then
				Paint = Paint2
			end
		end
	end
	if luautils.walkAdj(playerObj, PMachine:getSquare()) then
		ISInventoryPaneContextMenu.equipWeapon(Paint, true, false, playerObj:getPlayerNum());
		ISTimedActionQueue.add(FillPaintMachineAction:new(player, PMachine, Paint, 70 + (Paint:getUsedDelta() * 50)));
	end
end

Events.OnFillWorldObjectContextMenu.Add(PaintingMachineMenu.doBuildMenu);

CMBMenu = {};

CMBMenu.initContextMenu = function(player, context, worldobjects)

	local playerObj = getSpecificPlayer(player)
	local sign = nil;
	local SecretNote = nil;
	local SafeA = nil;
	for _, object in ipairs(worldobjects) do
		if instanceof(object, "IsoObject") and object:getSprite() and object:getSprite():getProperties() and (object:getSprite():getProperties():Val("CustomName") == "Zombie Sign") then
			sign = object;
			break;
		end
		if instanceof(object, "IsoObject") and object:getSprite() and object:getSprite():getProperties() and (object:getSprite():getProperties():Val("CustomName") == "Note A") then
			SecretNote = object;
			break;
		end
		if instanceof(object, "IsoObject") and object:getSprite() and object:getSprite():getProperties() and (object:getSprite():getProperties():Val("GroupName") == "Secret Wall" and object:getSprite():getProperties():Val("CustomName") == "Monitors") then
			SafeA = object;
			break;
		end
	end

	if not sign and not SecretNote and not SafeA then return end;
	local pl = getSpecificPlayer(player);
	
	if sign ~= nil then
		local SignOption = context:addOption(getText("ContextMenu_CheckSign"), sign, CMBMenu.Sign_OnCreate, pl);
		local SignTooltip = ISWorldObjectContextMenu.addToolTip();
		SignTooltip:setName(getText("ContextMenu_CheckSign"));
		SignTooltip.description = getText("ContextMenu_CheckSignTT");
	    SignTooltip:setTexture("media/textures/Icon_Search.png");
        SignOption.toolTip = SignTooltip;
	end

	if SecretNote ~= nil then
		local SecretNoteOption = context:addOption(getText("ContextMenu_CheckSign"), SecretNote, CMBMenu.SecretNote_OnCreate, pl);
		local SecretNoteTooltip = ISWorldObjectContextMenu.addToolTip();
		SecretNoteTooltip:setName(getText("ContextMenu_CheckSign"));
		SecretNoteTooltip.description = getText("ContextMenu_CheckSignTT");
	    SecretNoteTooltip:setTexture("media/textures/Icon_Search.png");
        SecretNoteOption.toolTip = SecretNoteTooltip;
	end

	if SafeA ~= nil then
		if pl:getInventory():haveThisKeyId(50001) then
			local data = SafeA:getModData();
			if not data.opened or data.opened == "0" then
				local OpenSafeOption = context:addOption(getText("ContextMenu_OpenSafe"), SafeA, CMBMenu.Safe_OnCreate, pl);
				local OpenSafeTooltip = ISWorldObjectContextMenu.addToolTip();
				OpenSafeTooltip:setName(getText("ContextMenu_OpenSafe"));
				OpenSafeTooltip.description = getText("ContextMenu_OpenSafeTT");
				OpenSafeTooltip:setTexture("media/textures/Item_CMBSecretKey1.png");
				OpenSafeOption.toolTip = OpenSafeTooltip;
			end
		end
	end
end

CMBMenu.Sign_OnCreate = function(signobject, player)
	if signobject == nil then return end
	if signobject and luautils.walkAdj(player, signobject:getSquare()) then
		local img = "<H1> <IMAGECENTRE:sign1.png> <LINE>";
		luautils.okRichModal(img, true, 450, 550);
	end
end

CMBMenu.SecretNote_OnCreate = function(signobject, player)
	if signobject == nil then return end
	if math.floor(signobject:getZ()) ~= math.floor(player:getZ()) then return end	
	if signobject and luautils.walkAdj(player, signobject:getSquare()) then
		local text = getText("Tooltip_SecretText1") .. "<H1> <IMAGECENTRE:secret1.png> <LINE>";
		ISTimedActionQueue.add(OnReadSN:new(player, signobject, "Base.CMBSecretKey1", "Secret Key A Received", text, 50001, 50));
	end
end

CMBMenu.Safe_OnCreate = function(Safe, player)
	if Safe == nil then return end
	if Safe and luautils.walkAdj(player, Safe:getSquare()) then
		local data = Safe:getModData();
		if not data.opened or data.opened ~= "1" then
			ISTimedActionQueue.add(CMBOnOpenSafe:new(player, Safe, "Magazines", 50001, 100));
		end
	end
end

Events.OnFillWorldObjectContextMenu.Add(CMBMenu.initContextMenu);
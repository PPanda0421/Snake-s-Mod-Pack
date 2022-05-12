AMGuideManager = ISBaseObject:derive("AMGuideManager");

function AMGuideManager:update()
     if self.panel == nil then
         self.panel = AMTutorialPanel:new(0, 0, 240, 250);
         self.panel:initialise();
         self.panel:addToUIManager();
         self.panel.tutorialSetInfo = ISTutorialSetInfo:new();

         local entry = AMGuideEntries.getEntry(0);
         self.panel.tutorialSetInfo:addPage(entry.title, entry.text, entry.moreInfo);

         self.panel.tutorialSetInfo:applyPageToRichTextPanel(self.panel.richtext);
         self.panel.moreInfo = entry.moreInfo;

		 for i=1,AMGuideEntries.list:size() -1 do
			entry = AMGuideEntries.getEntry(i);
			self.panel.tutorialSetInfo:addPage(entry.title, entry.text, entry.moreInfo);
		 end

		ISLayoutManager.RegisterWindow('amguide', AMGuideManager, self) 
     end
end

function AMGuideManager:new()
    local o = {}
    setmetatable(o, self)
    self.__index = self
    self.moreInfoVisible = false
    return o
end

function AMGuideManager:RestoreLayout(name, layout)
	-- Only save/restore visibility, the size/position is fixed
	if layout.visible == 'false' then
		self.panel:setVisible(false);
        self.panel.showOnStartup = false;
    else
        self.panel.showOnStartup = false;
    end

    -- always show the guide for beginner
    if getCore():getGameMode() == "Beginner" then
        self.panel:setVisible(true);
        self.panel.showOnStartup = false;
        self.panel:setX(getCore():getScreenWidth()/2 - self.panel.width / 2);
        self.panel:setY(getCore():getScreenHeight()/2 - self.panel.height / 2);
        --self.panel.tickBox:setVisible(false);
    end

    --if self.panel.tickBox then
    --    self.panel.tickBox:setSelected(1, self.panel.showOnStartup);
    --end
end

function AMGuideManager:SaveLayout(name, layout)
	-- Only save/restore visibility, the size/position is fixed
    if self.panel then
        if not self.panel.showOnStartup then
            layout.visible = 'false';
            self.panel:setVisible(false);
        else
            layout.visible = 'true';
            self.panel:setVisible(true);
        end
        ISLayoutManager.SaveWindowVisible(self.panel, layout);
    end
end

function doAMGuide()
	if isServer() then return; end
	-- Disable with controller for now.
	if JoypadState[1] then return end
    -- hide it for tut
    if getCore():getGameMode() == "Tutorial" and not getCore():isTutorialDone() then
        return;
    end
    -- only happens on single player so no splitscreen support required.
    if AMGuideManager.instance == nil then
        AMGuideManager.instance = AMGuideManager:new();
		--AMGuideManager.instance.panel:setVisible(false);
    end

    AMGuideManager.instance:update();
	local pl = getSpecificPlayer(0);
	local prhand = nil;
	local schand = nil;
	if pl then
		prhand = pl:getPrimaryHandItem();
		schand = pl:getSecondaryHandItem();
	end
	local panel = AMGuideManager.instance.panel
	if pl and ((prhand ~= nil and prhand:getType() == "ManualAM") or (schand ~= nil and schand:getType() == "ManualAM")) then
		if getGameSpeed() == 0 or pl:IsRunning() then
			AMGuideManager.instance.panel:setVisible(false);
			if panel.moreinfo and panel:getIsVisible() then
				AMGuideManager.instance.moreInfoVisible = panel.moreinfo:getIsVisible()
				panel.moreinfo:setVisible(false)
			elseif panel.moreinfo then
				AMGuideManager.instance.moreInfoVisible = panel.moreinfo:getIsVisible()
				panel.moreinfo:setVisible(false)
			end
		end
	else
		AMGuideManager.instance.panel:setVisible(false);
		if panel.moreinfo and panel:getIsVisible() then
			AMGuideManager.instance.moreInfoVisible = panel.moreinfo:getIsVisible()
			panel.moreinfo:setVisible(false)
		elseif panel.moreinfo then
			AMGuideManager.instance.moreInfoVisible = panel.moreinfo:getIsVisible()
			panel.moreinfo:setVisible(false)
		end
	end
    if isDemo() and ISDemoPopup.instance ~= nil then
        AMGuideManager.instance.panel:setVisible(false);
    end
end

AMGuideManager.OnNewGame = function()
	if isServer() then return; end
	Events.OnTick.Add(doAMGuide);
end


AMGuideManager.onKeyPressed = function()

	--if key == getCore():getKey("Toggle Survival Guide") then
		if AMGuideManager.instance == nil then
			Events.OnTick.Add(doAMGuide);
		else
			if AMGuideManager.instance.panel:getIsVisible() == false then
				AMGuideManager.instance.panel:setVisible(not AMGuideManager.instance.panel:getIsVisible());
				local panel = AMGuideManager.instance.panel
				if panel.moreinfo and panel:getIsVisible() then
					panel.moreinfo:setVisible(AMGuideManager.instance.moreInfoVisible)
				elseif panel.moreinfo then
					AMGuideManager.instance.moreInfoVisible = panel.moreinfo:getIsVisible()
					panel.moreinfo:setVisible(false)
				end
			end
		end
	--end
end

AMGuideManager.OnGameStart = function()
	if getCore():isShowFirstTimeWeatherTutorial() then
		if AMGuideManager.instance == nil then
			AMGuideManager.instance = AMGuideManager:new();
			AMGuideManager.instance:update();
		end
		local panel = AMGuideManager.instance.panel
		AMGuideManager.instance.panel:setVisible(true);
		if not panel.moreinfo then
			panel:initMoreInfoPanel();
		end
		panel.moreinfo:setVisible(true)
		panel.moreInfo = panel.tutorialSetInfo.pages[9].moreTextInfo;
		panel.tut.textDirty = true;
		panel.tut.text = panel.moreInfo;
		panel.tut:paginate();
		panel.tut:setYScroll(0);
		panel.tutorialSetInfo.currentPage = 9;
		panel.tutorialSetInfo:applyPageToRichTextPanel(panel.richtext);
		panel:reloadBtns();
		--getCore():setShowFirstTimeWeatherTutorial(false);
		--getCore():saveOptions();
	end
end

--Events.OnGameStart.Add(AMGuideManager.OnGameStart)
--Events.OnEnterVehicle.Add(SurvivalGuideManager.onEnterVehicle);
--Events.OnKeyPressed.Add(AMGuideManager.onKeyPressed);
--Events.OnNewGame.Add(SurvivalGuideManager.OnNewGame);
Events.OnTick.Add(doAMGuide);
--~ Events.OnMainMenuEnter.Add(doAMGuide);

--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

local FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.Small)

IsPainthVehicleWindow = ISCollapsableWindow:derive("IsPainthVehicleWindow")

function IsPainthVehicleWindow:update()
	if self.vehicle and self.chr:DistTo(self.vehicle:getX(), self.vehicle:getY()) > 4 then
		self:close()
	elseif not self.vehicle or not self.vehicle:getSquare() or self.vehicle:getSquare():getMovingObjects():indexOf(self.vehicle) < 0 then
		self:close() -- handle vehicle being removed by admin/cheat command
	else
	end
end


function IsPainthVehicleWindow:onRightMouseDownOutside(x, y)
    if((self:getMouseX() < 0 or self:getMouseY() < 0 or self:getMouseX() > self:getWidth() or self:getMouseY() > self:getHeight())) then
        self:close()
    end
end

function IsPainthVehicleWindow:addLabel(_x, _y, _title, _font, _bLeft)
    local FONT_HGT = getTextManager():getFontHeight(_font)
    local label = ISLabel:new(_x, _y, FONT_HGT, _title, 1, 1, 1, 1.0, _font, _bLeft==nil and true or _bLeft)
    label:initialise()
    label:instantiate()
--    label.customData = _data
    self:addChild(label)
    return label:getY() + label:getHeight(), label
end

function IsPainthVehicleWindow:addSlider(_x, _y, _w, _h, _func)
    local slider = ISSliderPanel:new(_x, _y, _w, _h, self, _func )
    slider:initialise()
    slider:instantiate()
--    slider.valueLabel = true
--    slider.customData = _data
    self:addChild(slider)
    return slider:getY() + slider:getHeight(), slider
end

function IsPainthVehicleWindow:callbackAngleX(value, slider)
end

function IsPainthVehicleWindow:callbackAngleY(value, slider)
end

function IsPainthVehicleWindow:callbackAngleZ(value, slider)
end

function IsPainthVehicleWindow:createChildren()
	ISCollapsableWindow.createChildren(self)

	--self.oldValues = ISLabel:new(10, self:titleBarHeight() + 10, FONT_HGT_SMALL, "Old Values", 1, 1, 1, 1, UIFont.Small, true)
	--self:addChild(self.oldValues)

	self.scriptName = ISLabel:new(10, self:titleBarHeight() + 10, FONT_HGT_SMALL, getText("ContextMenu_Model"), 1, 1, 1, 1, UIFont.Small, true)
	self:addChild(self.scriptName)

	self:addLabel(10, self.scriptName:getBottom() + 24, getText("ContextMenu_Hue"), UIFont.Small, true)
	local y,slider = self:addSlider(80, self.scriptName:getBottom() + 24, 200, 20, self.callbackAngleX)
	slider:setValues(0, 100, 1, 10, true)
	self.colorHue = slider

	self:addLabel(10, y + 16, getText("ContextMenu_Saturation"), UIFont.Small, true)
	y,slider = self:addSlider(80, y + 16, 200, 20, self.callbackAngleY)
	slider:setValues(0, 100, 1, 10, true)
	self.colorSaturation = slider

	self:addLabel(10, y + 16, getText("ContextMenu_Value"), UIFont.Small, true)
	y,slider = self:addSlider(80, y + 16, 200, 20, self.callbackAngleZ)
	slider:setValues(0, 100, 1, 10, true)
	self.colorValue = slider

	local button = ISButton:new(10, y + 30, 60, 16, getText("ContextMenu_Red"), self, self.onButtonRed)
	button:initialise()
	button:instantiate()
	button.borderColor = {r=1, g=1, b=1, a=0.1}
	self:addChild(button)

	local button2 = ISButton:new(button:getRight() + 10, y + 30, 60, 16, getText("ContextMenu_Blue"), self, self.onButtonBlue)
	button2:initialise()
	button2:instantiate()
	button2.borderColor = {r=1, g=1, b=1, a=0.1}
	self:addChild(button2)

	local button3 = ISButton:new(button2:getRight() + 10, y + 30, 60, 16, getText("ContextMenu_White"), self, self.onButtonWhite)
	button3:initialise()
	button3:instantiate()
	button3.borderColor = {r=1, g=1, b=1, a=0.1}
	self:addChild(button3)

	local button4 = ISButton:new(button3:getRight() + 10, y + 30, 60, 16, getText("ContextMenu_Black"), self, self.onButtonBlack)
	button4:initialise()
	button4:instantiate()
	button4.borderColor = {r=1, g=1, b=1, a=0.1}
	self:addChild(button4)

	local button5 = ISButton:new(10, button:getBottom() + 10, 60, 16, getText("ContextMenu_Other"), self, self.onButtonOther)
	button5:initialise()
	button5:instantiate()
	button5.borderColor = {r=1, g=1, b=1, a=0.1}
	self:addChild(button5)

	local button6 = ISButton:new(((self.width / 2) - (120/2)), button:getBottom() + 30, 120, 16, getText("ContextMenu_Paint"), self, self.onButtonPaint)
	button6:initialise()
	button6:instantiate()
	button6.borderColor = {r=1, g=1, b=1, a=0.1}
	button6.tooltip = getText("ContextMenu_PaintWarning");
	self:addChild(button6)
end

function IsPainthVehicleWindow:onButtonRed()
	if not self.vehicle then return end
	self.colorHue:setCurrentValue(ZombRand(0, 3))
	self.colorSaturation:setCurrentValue(ZombRand(85, 100))
	self.colorValue:setCurrentValue(ZombRand(55, 85))
	self.chr:playSound("PaintSpray")
end

function IsPainthVehicleWindow:onButtonBlue()
	if not self.vehicle then return end
	self.colorHue:setCurrentValue(ZombRand(55, 61))
	self.colorSaturation:setCurrentValue(ZombRand(85, 100))
	self.colorValue:setCurrentValue(ZombRand(65, 75))
	self.chr:playSound("PaintSpray")
end

function IsPainthVehicleWindow:onButtonWhite()
	if not self.vehicle then return end
	self.colorHue:setCurrentValue(15) -- ZombRand(0, 100)
	self.colorSaturation:setCurrentValue(ZombRand(000, 10))
	self.colorValue:setCurrentValue(ZombRand(70, 80))
	self.chr:playSound("PaintSpray")
end

function IsPainthVehicleWindow:onButtonBlack()
	if not self.vehicle then return end
	self.colorHue:setCurrentValue(ZombRand(0, 100))
	self.colorSaturation:setCurrentValue(ZombRand(0, 10))
	self.colorValue:setCurrentValue(ZombRand(10, 25))
	self.chr:playSound("PaintSpray")
end

function IsPainthVehicleWindow:onButtonOther()
	if not self.vehicle then return end
	self.colorHue:setCurrentValue(ZombRand(0, 100))
	self.colorSaturation:setCurrentValue(ZombRand(60, 75))
	self.colorValue:setCurrentValue(ZombRand(30, 70))
	self.chr:playSound("PaintSpray")
end

function IsPainthVehicleWindow:onButtonPaint()
	if not self.vehicle then return end
	-- local centered = true;
	-- local posX;
	-- local posY;
	-- local width = 300;
	-- local height = 200;
	-- local core = getCore();
	-- if centered ~= nil then
		-- posX = core:getScreenWidth() * 0.5 - width * 0.5;
		-- posY = core:getScreenHeight() * 0.5 - height * 0.5;
	-- end
	-- local modal = ISModalRichText2:new(posX, posY, width, height, getText("ContextMenu_PaintWarning"), true, nil, self.onYesButtonClick, self.chr:getPlayerNum(), nil, nil);
	-- modal:initialise();
	-- modal:addToUIManager();
	self:setMachineData()
	self.startcolorHue = (self.colorHue.currentValue)
	self.startcolorSaturation = (self.colorSaturation.currentValue)
	self.startcolorValue = (self.colorValue.currentValue)
	self.chr:playSound("PaintSpray")
	self:close()
end

-- function IsPainthVehicleWindow:onYesButtonClick(modalbutton, nil, nil)
	-- if modalbutton.internal == "YES" then
		-- self.startcolorHue = (self.colorHue.currentValue)
		-- self.startcolorSaturation = (self.colorSaturation.currentValue)
		-- self.startcolorValue = (self.colorValue.currentValue)
	-- end
-- end

function IsPainthVehicleWindow:clearVehicle()
	self.vehicle = nil
	self.scriptName.name = "No vehicle selected"
end

function IsPainthVehicleWindow:prerender()
	ISCollapsableWindow.prerender(self)
	if self.vehicle and (self.vehicle:getMovingObjectIndex() < 0) then
		self:clearVehicle()
	end
	if self.vehicle then
		self.vehicle:setColorHSV(self.colorHue.currentValue / 100, self.colorSaturation.currentValue / 100, self.colorValue.currentValue / 100)
		local x = 20
		self.colorHue:drawText(tostring(self.colorHue.currentValue), x, -20, 1, 1, 1, 1, UIFont.Small)
		self.colorSaturation:drawText(tostring(self.colorSaturation.currentValue), x, -20, 1, 1, 1, 1, UIFont.Small)
		self.colorValue:drawText(tostring(self.colorValue.currentValue), x, -20, 1, 1, 1, 1, UIFont.Small)
	end
end

function IsPainthVehicleWindow:close()
	if self.vehicle then
		if (self.startcolorHue ~= self.colorHue.currentValue) or (self.startcolorSaturation ~= self.colorSaturation.currentValue) or (self.startcolorValue ~= self.colorValue.currentValue) then
			--self.chr:Say(tostring(self.startcolorHue) .. " " .. tostring(self.colorHue.currentValue));
			self.vehicle:setColorHSV(self.startcolorHue / 100, self.startcolorSaturation / 100, self.startcolorValue / 100)
		end
		self:clearVehicle()
	end
	ISCollapsableWindow.close(self)
end

function IsPainthVehicleWindow:setMachineData()
	if not self.vehicle then
		self:close()
	end
	local square = PMRMISVehicleMenu.getNearbyPaintMachine(self.vehicle)
	if square then
		local PMachine = nil;
		for i=0,square:getObjects():size()-1 do
			local object = square:getObjects():get(i);
			if instanceof(object, "IsoObject") and
			  object:getSprite() and
			  object:getSprite():getProperties() and 
			  object:getSprite():getProperties():Val("CustomName") == "Paint Machine" then
				PMachine = object;
				break;
			end
		end
		if PMachine ~= nil then
			local objectData = PMachine:getModData();
			if objectData.Full then
				local index = 0;
				for i = 1, #PaintingMachineMenu.PaintBuckets do
					index = index +1;
					local PaintType = PaintingMachineMenu.PaintBuckets[index];
					if objectData[PaintType] and objectData[PaintType] > 0 then
						objectData[PaintType] = 0;
						objectData.Full = false;
						PMachine:transmitModData();
					end
				end
			end
		end
	end
end

function IsPainthVehicleWindow:setVehicle(vehicle)
	self.vehicle = vehicle
	self.script = vehicle and vehicle:getScript() or nil
	if self.vehicle then
		local name = getText("IGUI_VehicleName" .. self.script:getName());
		if string.match(self.script:getName(), "Burnt") then
			local unburnt = string.gsub(self.script:getName(), "Burnt", "")
			if getTextOrNull("IGUI_VehicleName" .. unburnt) then
				name = getText("IGUI_VehicleName" .. unburnt)
			end
			name = getText("IGUI_VehicleNameBurntCar", name);
		end
		self.scriptName.name = getText("ContextMenu_Model")..name
		
		self.colorHue:setCurrentValue(self.vehicle:getColorHue() * 100)
		self.colorSaturation:setCurrentValue(self.vehicle:getColorSaturation() * 100)
		self.colorValue:setCurrentValue(self.vehicle:getColorValue() * 100)
	
		self.startcolorHue = (self.colorHue.currentValue)
		self.startcolorSaturation = (self.colorSaturation.currentValue)
		self.startcolorValue = (self.colorValue.currentValue)
	end
end

function IsPainthVehicleWindow:new()
	local width = 300
	local height = 270
	local x = (getCore():getScreenWidth() - width)
	local y = (getCore():getScreenHeight() / 2) - (height / 2)

	local o = ISCollapsableWindow:new(x, y, width, height)
	setmetatable(o, self)
	self.__index = self
	o.width = width;
	o.height = height;
	o:setResizable(false)
	o.title = getText("ContextMenu_PaintVehicle")
	o.chr = getSpecificPlayer(0);
	return o
end

local ui = nil

function PaintVehicleColor(vehicle)
	ui = ui or IsPainthVehicleWindow:new()
	ui:setVisible(true)
	ui:addToUIManager()
	ui:setVehicle(vehicle or getSpecificPlayer(0):getVehicle())
end


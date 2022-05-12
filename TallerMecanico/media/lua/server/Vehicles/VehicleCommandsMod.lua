if isClient() then return end

local VehicleCommandsTMMod = {}
local CommandsTMMod = {}

VehicleCommandsTMMod.wantNoise = getDebug() or false

local noise = function(msg)
	if VehicleCommandsTMMod.wantNoise then
		print('VehicleCommandsTMMod: '..msg)
	end
end

--- Contenido del mod ---------------------------------------------------------------------------------------------

function CommandsTMMod.repairHeater(player, args)
	local vehicle = getVehicleById(args.vehicle)
	if vehicle then
		local part = vehicle:getPartById("Heater")
		if not part then
			noise('no such part Heater')
			return
		end
		local condPerPart = 1 + (args.skillLevel / 2)
		if condPerPart > 5 then condPerPart = 5 end
		local done = 0
		for i=1,args.numberOfParts do
			part:setCondition(part:getCondition() + condPerPart)
			done = done + 1
			if part:getCondition() >= 100 then
				part:setCondition(100)
				break
			end
		end
		if done > 0 then
			--if args.giveXP then
				player:sendObjectChange('addXp', { perk = Perks.Mechanics:index(), xp = done, noMultiplier = false })
			--end
			player:sendObjectChange('removeItemType', { type = 'Base.ElectronicsScrap', count = done })
			vehicle:transmitPartCondition(part)
		end
		player:sendObjectChange('mechanicActionDone', { success = (done > 0), vehicleId = vehicle:getId(), partId = part:getId(), itemId = -1, installing = true })
	else
		noise('no such vehicle id='..tostring(args.vehicle))
	end
end

function CommandsTMMod.repairGloveBox(player, args)
	local vehicle = getVehicleById(args.vehicle)
	if vehicle then
		local part = vehicle:getPartById("GloveBox")
		if not part then
			noise('no such part GloveBox')
			return
		end
		local condPerPart = 1 + (args.skillLevel / 2)
		if condPerPart > 5 then condPerPart = 5 end
		local done = 0
		for i=1,args.numberOfParts do
			part:setCondition(part:getCondition() + condPerPart)
			done = done + 1
			if part:getCondition() >= 100 then
				part:setCondition(100)
				break
			end
		end
		if done > 0 then
			if args.giveXP then
				player:sendObjectChange('addXp', { perk = Perks.Mechanics:index(), xp = done, noMultiplier = false })
			end
			player:sendObjectChange('removeItemType', { type = 'Base.Screws', count = done })
			vehicle:transmitPartCondition(part)
		end
		player:sendObjectChange('mechanicActionDone', { success = (done > 0), vehicleId = vehicle:getId(), partId = part:getId(), itemId = -1, installing = true })
	else
		noise('no such vehicle id='..tostring(args.vehicle))
	end
end

function CommandsTMMod.repairlightbar(player, args)
	local vehicle = getVehicleById(args.vehicle)
	if vehicle then
		local part = vehicle:getPartById("lightbar")
		if not part then
			noise('no such part lightbar')
			return
		end
		local condPerPart = 1 + (args.skillLevel / 2)
		if condPerPart > 5 then condPerPart = 5 end
		local done = 0
		for i=1,args.numberOfParts do
			part:setCondition(part:getCondition() + condPerPart)
			done = done + 1
			if part:getCondition() >= 100 then
				part:setCondition(100)
				break
			end
		end
		if done > 0 then
			--if args.giveXP then
				player:sendObjectChange('addXp', { perk = Perks.Mechanics:index(), xp = done, noMultiplier = false })
			--end
			player:sendObjectChange('removeItemType', { type = 'Base.ElectronicsScrap', count = done })
			vehicle:transmitPartCondition(part)
		end
		player:sendObjectChange('mechanicActionDone', { success = (done > 0), vehicleId = vehicle:getId(), partId = part:getId(), itemId = -1, installing = true })
	else
		noise('no such vehicle id='..tostring(args.vehicle))
	end
end
-------------------------------------------------------------------------------------------

VehicleCommandsTMMod.OnClientCommand = function(module, command, player, args)
	if module == 'vehicletmmod' and CommandsTMMod[command] then
		local argStr = ''
		args = args or {}
		for k,v in pairs(args) do
			argStr = argStr..' '..k..'='..tostring(v)
		end
		noise('received '..module..' '..command..' '..tostring(player)..argStr)
		CommandsTMMod[command](player, args)
	end
end

Events.OnClientCommand.Add(VehicleCommandsTMMod.OnClientCommand)

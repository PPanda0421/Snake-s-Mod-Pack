if isClient() then return end

local ClientCommandsTM = {}
local CommandsTM = {}
CommandsTM.object = {}

ClientCommandsTM.wantNoise = getDebug()
local noise = function(msg)
	if (ClientCommandsTM.wantNoise) then print('ClientCommandTM: '..msg) end
end
--- Contenido del mod ---------------------------------------------------------------------------------------------
local _getVulcanizer = function(x, y, z, index)
	local sq = getCell():getGridSquare(x, y, z)
	if sq and index >= 0 and index < sq:getObjects():size() then
		local object = sq:getObjects():get(index)
		--if object:getSprite() and object:getSprite():getProperties():Is("IsTrashCan") then
		if object:getSprite() and object:getSprite():getProperties():Val("GroupName") == "Red" and object:getSprite():getProperties():Val("CustomName") == "Tire Machine" then
			return object
		end
	end
	return nil
end

CommandsTM.object.emptyVulcanizer = function(player, args)
	local object = _getVulcanizer(args.x, args.y, args.z, args.index)
	if object then
		object:getContainer():clear()
		if object:getOverlaySprite() then
			ItemPicker.updateOverlaySprite(object)
		end
		object:sendObjectChange('emptyVulcanizer');
	else
		print('expected vulcanizer')
	end
end


ClientCommandsTM.OnClientCommand = function(module, command, player, args)
	if CommandsTM[module] and CommandsTM[module][command] then
		local argStr = ''
		for k,v in pairs(args) do argStr = argStr..' '..k..'='..tostring(v) end
		noise('received '..module..' '..command..' '..tostring(player)..argStr)
		CommandsTM[module][command](player, args)
	end
end

Events.OnClientCommand.Add(ClientCommandsTM.OnClientCommand)

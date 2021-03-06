function ISCampingMenu.timeString(timeInMinutes)
	local hourStr = getText("IGUI_Gametime_hour")
	local minuteStr = getText("IGUI_Gametime_minute")
	local adviceStr = " <LINE> <LINE>" .. " <RGB:0.596078431372549,0.9843137254901961,0.596078431372549> " .. getText("IGUI_Consumption_advice") .. " <RGB:1,1,1>";
	local hours = math.floor(timeInMinutes / 60)
	local minutes = timeInMinutes % 60
	if hours ~= 1 then hourStr = getText("IGUI_Gametime_hours") end
	if minutes ~= 1 then minuteStr = getText("IGUI_Gametime_minutes") end
	local str = ""
	local rgb = " <RGB:1,1,1>";
	if hours ~= 0 then
		rgb = " <RGB:0,0.8,0>";
		if minutes ~= 0 then
			str = rgb .. hours .. ' ' .. hourStr;
		else
			str = rgb .. hours .. ' ' .. hourStr .. "."  .. ' ' .. adviceStr .. " <LINE>";
		end
	end
	if str == '' or minutes ~= 0 then
		if hours == 0 then
			if minutes <= 10 then
				rgb = " <RGB:1,0,0>"; -- rojo
			elseif minutes > 10 and minutes < 30 then
				rgb = " <RGB:0.98,0.55,0>"; -- naranja
			elseif minutes >= 30 and minutes < 40 then
				rgb = " <RGB:1,1,0>"; -- amarillo
			elseif minutes >= 40 and minutes < 60 then
				rgb = " <RGB:0,0.8,0>"; -- verde
			end
		else
			rgb = " <RGB:0,0.8,0>"; -- verde
		end
		if str ~= '' then str = str .. ', ' end
		str = rgb .. str .. math.floor(minutes) .. ' ' .. minuteStr .. "."  .. ' ' .. adviceStr .. " <LINE>";
	end
	return str
end
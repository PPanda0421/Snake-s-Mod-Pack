function WPAAlice(roomName, containerType, container)
    if container:contains('AlicePack') then
        local alicewpa = container:FindAll('AlicePack');
        for i = 0, alicewpa:size() - 1 do
			local chance = {};
            if SandboxVars.OtherLoot == 1 then -- very poor
                chance = ZombRand(11);
		    elseif SandboxVars.OtherLoot == 2 then -- poor
		        chance = ZombRand(9);
		     elseif SandboxVars.OtherLoot == 3 then -- normal
		        chance = ZombRand(7);
	        elseif SandboxVars.OtherLoot == 4 then -- abundant
		        chance = ZombRand(5);
	        elseif SandboxVars.OtherLoot == 5 then -- very abundant
		        chance = ZombRand(2);
		    end
            if chance == 0 then
			    if ZombRand(2) == 0 then
                    alicewpa:get(i):getItemContainer():AddItem('WPA.Pistolx2Scope2');
				end
			    if ZombRand(2) == 0 then
					alicewpa:get(i):getItemContainer():AddItem('WPA.StealthTacticalScope2');
				end
			    if ZombRand(2) == 0 then
					alicewpa:get(i):getItemContainer():AddItem('WPA.SRTPS');
				end
				if ZombRand(15) == 0 then
					alicewpa:get(i):getItemContainer():AddItem('WPA.SilencerRK');
				end
            end
        end
    end
    if container:contains('MilitiaPouch1') then
        local pouch1am = container:FindAll('MilitiaPouch1');
        for i = 0, pouch1am:size() - 1 do
            if ZombRand(10) == 0 then
                pouch1am:get(i):getItemContainer():AddItem('WPA.M16TL');
            end
            if ZombRand(15) == 0 then
                pouch1am:get(i):getItemContainer():AddItem('WPA.M16LaserLight');
            end
            if ZombRand(10) == 0 then
                pouch1am:get(i):getItemContainer():AddItem('WPA.M16Laser');
            end
            if ZombRand(10) == 0 then
                pouch1am:get(i):getItemContainer():AddItem('WPA.M16Grip');
            end
            if ZombRand(15) == 0 then
                pouch1am:get(i):getItemContainer():AddItem('WPA.M16Reflex');
            end
            if ZombRand(10) == 0 then
                pouch1am:get(i):getItemContainer():AddItem('WPA.M16x4Scope');
            end
            if ZombRand(15) == 0 then
                pouch1am:get(i):getItemContainer():AddItem('WPA.Silencerm16');
            end
			if ZombRand(15) == 0 then
                pouch1am:get(i):getItemContainer():AddItem('WPA.M16HG');
            end
        end
    end
    if container:contains('MilitiaPouch2') then
        local pouch2am = container:FindAll('MilitiaPouch2');
        for i = 0, pouch2am:size() - 1 do
            if ZombRand(10) == 0 then
                pouch2am:get(i):getItemContainer():AddItem('WPA.M16TL');
            end
            if ZombRand(15) == 0 then
                pouch2am:get(i):getItemContainer():AddItem('WPA.M16LaserLight');
            end
            if ZombRand(10) == 0 then
                pouch2am:get(i):getItemContainer():AddItem('WPA.M16Laser');
            end
            if ZombRand(10) == 0 then
                pouch2am:get(i):getItemContainer():AddItem('WPA.M16Grip');
            end
            if ZombRand(15) == 0 then
                pouch2am:get(i):getItemContainer():AddItem('WPA.M16Reflex');
            end
            if ZombRand(10) == 0 then
                pouch2am:get(i):getItemContainer():AddItem('WPA.M16x4Scope');
            end
            if ZombRand(15) == 0 then
                pouch2am:get(i):getItemContainer():AddItem('WPA.Silencerm16');
            end
			if ZombRand(15) == 0 then
                pouch2am:get(i):getItemContainer():AddItem('WPA.M16HG');
            end
        end
    end
end

Events.OnFillContainer.Add(WPAAlice);
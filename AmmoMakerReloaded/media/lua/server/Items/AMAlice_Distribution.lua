function AMAlice(roomName, containerType, container)
    if container:contains('AlicePack') then
        local aliceam = container:FindAll('AlicePack');
        for i = 0, aliceam:size() - 1 do
            if ZombRand(30) == 0 then
				aliceam:get(i):getItemContainer():AddItem('Base.AssaultRifle');
		        if ZombRand(3) == 0 then
					aliceam:get(i):getItemContainer():AddItems('Base.556Clip', ZombRand(1,4));
				end
				if ZombRand(10) == 0 then
					aliceam:get(i):getItemContainer():AddItem('Base.556Box');
				end
				if ZombRand(2) == 0 then
					aliceam:get(i):getItemContainer():AddItems('Base.556Bullets', ZombRand(1,5));
				end
            end
			if ZombRand(5) == 0 then
				aliceam:get(i):getItemContainer():AddItems('Base.556Bullets', ZombRand(1,5));
			end
        end
    end
    if container:contains('MilitiaPouch1') then
        local pouch1am = container:FindAll('MilitiaPouch1');
        for i = 0, pouch1am:size() - 1 do
            if ZombRand(10) == 0 then
                pouch1am:get(i):getItemContainer():AddItems('Base.556Clip', ZombRand(1,3));
            end
            if ZombRand(20) == 0 then
                pouch1am:get(i):getItemContainer():AddItem('Base.556Box');
            end
            if ZombRand(5) == 0 then
                pouch1am:get(i):getItemContainer():AddItems('Base.556Bullets', ZombRand(1,3));
            end
        end
    end
    if container:contains('MilitiaPouch2') then
        local pouch2am = container:FindAll('MilitiaPouch2');
        for i = 0, pouch2am:size() - 1 do
            if ZombRand(10) == 0 then
                pouch2am:get(i):getItemContainer():AddItems('Base.556Clip', ZombRand(1,3));
            end
            if ZombRand(20) == 0 then
                pouch2am:get(i):getItemContainer():AddItem('Base.556Box');
            end
            if ZombRand(5) == 0 then
                pouch2am:get(i):getItemContainer():AddItems('Base.556Bullets', ZombRand(1,3));
            end
        end
    end
end

Events.OnFillContainer.Add(AMAlice);
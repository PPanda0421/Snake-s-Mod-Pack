-- print("[ CARGANDO CONFIGURACION SNAKE UTILS PACK ]");

-- sup_settings = {
	-- cursor_settings = {
		-- customskillwindow = false,
	-- },
-- };

-- function sup_settings:load_settings()
	-- local info = "";
	-- local fileReaderObj = getFileReader("sup_settings.ini", true);
	-- if not fileReaderObj:readLine() then
		-- self:save();
	-- else
		-- local fileData = {};
		-- while true do
			-- local fileLine = fileReaderObj:readLine();
			-- if fileLine then
				-- table.insert(fileData, fileLine);
			-- else
				-- break;
			-- end;
		-- end;
		-- for i = 1, #fileData do
			-- local fileDataExp = {}; local j = 1;
			-- for dataExp in string.gmatch(fileData[i], "([^=]+)") do
				-- fileDataExp[j] = dataExp;
				-- j = j + 1;
			-- end;
			-- if #fileDataExp == 2 then
				-- if self.cursor_settings[fileDataExp[1]] ~= nil then
					-- if tonumber(fileDataExp[2]) then
						-- fileDataExp[2] = tonumber(fileDataExp[2]);
					-- elseif fileDataExp[2] == "true" then
						-- fileDataExp[2] = true;
					-- elseif fileDataExp[2] == "false" then
						-- fileDataExp[2] = false;
					-- end;
					-- self.cursor_settings[fileDataExp[1]] = fileDataExp[2];
				-- else
				-- end;
			-- else
			-- end;
		-- end;
	-- end;
	-- fileReaderObj:close();
-- end

-- function sup_settings:save_settings()
	-- local fileWriterObj = getFileWriter("sup_settings.ini", true, false);
	-- fileWriterObj:write("[SNAKE UTILS PACK SETTINGS]" .. "\r\n");
	-- for setting, value in pairs(self.cursor_settings) do
		-- fileWriterObj:write(setting .. "=" .. tostring(value) .. "\r\n");
	-- end
	-- fileWriterObj:close();
-- end

-- function sup_settings:load()
	-- self:load_settings();
-- end

-- function sup_settings:save()
	-- self:save_settings();
-- end

-- sup_settings:load()
-------------------------TESTING ZONE---------------------------TESTING ZONE------------TESTING ZONE-----------TESTING ZONE---------------------TESTING ZONE--------TESTING ZONE------------------------------------------------------------------------------------------
------TESTING ZONE----------------TESTING ZONE--------------TESTING ZONE--------------TESTING ZONE--------------TESTING ZONE----TESTING ZONE-------------------TESTING ZONE-------------------------------TESTING ZONE
---TESTING ZONE--------TESTING ZONE--------TESTING ZONE-------TESTING ZONE-----------TESTING ZONE----TESTING ZONE---------------------TESTING ZONE--------TESTING ZONE------------------------------------------------------------
-------------------------TESTING ZONE---------------------------TESTING ZONE------------TESTING ZONE-----------TESTING ZONE---------------------TESTING ZONE--------TESTING ZONE------------------------------------------------------------------------------------------
------TESTING ZONE----------------TESTING ZONE--------------TESTING ZONE--------------TESTING ZONE--------------TESTING ZONE----TESTING ZONE-------------------TESTING ZONE-------------------------------TESTING ZONE
---TESTING ZONE--------TESTING ZONE--------TESTING ZONE-------TESTING ZONE-----------TESTING ZONE----TESTING ZONE---------------------TESTING ZONE--------TESTING ZONE-----------
-------------------------TESTING ZONE---------------------------TESTING ZONE------------TESTING ZONE-----------TESTING ZONE---------------------TESTING ZONE--------TESTING ZONE------------------------------------------------------------------------------------------
------TESTING ZONE----------------TESTING ZONE--------------TESTING ZONE--------------TESTING ZONE--------------TESTING ZONE----TESTING ZONE-------------------TESTING ZONE-------------------------------TESTING ZONE
---TESTING ZONE--------TESTING ZONE--------TESTING ZONE-------TESTING ZONE-----------TESTING ZONE----TESTING ZONE---------------------TESTING ZONE--------TESTING ZONE-----------
--[[RegisterServerEvent("getChar1")
AddEventHandler("getChar1", function(source, char1)
	local identifier = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll('SELECT * FROM `characters` WHERE `identifier` = @identifier', {
		['@identifier'] = identifier
	}, function(result)
		if result[1]  then
		local data = {
			firstname				= result[1].firstname,
			lastname				= result[1].lastname,
			dateofbirth				= result[1].dateofbirth,
			sex						= result[1].sex,
			height					= result[1].height,
			skin					= result[1].skin,
			money					= result[1].money,
			job						= result[1].job,
			job_grade	 			= result[1].job_grade,
			loadout					= result[1].loadout,
			bank 					= result[1].bank,
			permission_level 		= result[1].permission_level,
			is_dead					= result[1].last_property,
			position				= result[1].position
			}
			char1(data)
		end
	end)
end)
RegisterServerEvent("getChar2")
AddEventHandler("getChar2", function(source, char2)
	local identifier = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll('SELECT * FROM `characters` WHERE `identifier` = @identifier', {
		['@identifier'] = identifier
	}, function(result)
		if result[2] then
		local data = {
			firstname				= result[2].firstname,
			lastname				= result[2].lastname,
			dateofbirth				= result[2].dateofbirth,
			sex						= result[2].sex,
			height					= result[2].height,
			skin					= result[2].skin,
			money					= result[2].money,
			job						= result[2].job,
			job_grade	 			= result[2].job_grade,
			loadout 				= result[2].loadout,
			bank					= result[2].bank,
			permission_level 		= result[2].permission_level,
			is_dead 				= result[2].last_property,
			position				= result[2].position
			}
			char2(data)
		end
	end)
end)
RegisterServerEvent("getChar3")
AddEventHandler("getChar3", function(source, char3)
	local identifier = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll('SELECT * FROM `characters` WHERE `identifier` = @identifier', {
		['@identifier'] = identifier
	}, function(result)
		if result[3] then
		local data = {
			firstname				= result[3].firstname,
			lastname				= result[3].lastname,
			dateofbirth				= result[3].dateofbirth,
			sex						= result[3].sex,
			height					= result[3].height,
			skin					= result[3].skin,
			money 					= result[3].money,
			job 					= result[3].job,
			job_grade	 			= result[3].job_grade,
			loadout 				= result[3].loadout,
			bank 					= result[3].bank,
			permission_level 		= result[3].permission_level,
			is_dead 				= result[3].last_property,
			position				= result[3].position
		}
		char3(data)
		end
	end)
end)
TriggerEvent('es:addCommand', 'getchars', function(source, args, user)	
	TriggerEvent('getCharacters', source, function(data)
	print("testing")
		for k, v in pairs(data) do
		print(k,v)
		end
	print (source)
	end)
end)]]--

-------------------------TESTING ZONE---------------------------TESTING ZONE------------TESTING ZONE-----------TESTING ZONE---------------------TESTING ZONE--------TESTING ZONE------------------------------------------------------------------------------------------
------TESTING ZONE----------------TESTING ZONE--------------TESTING ZONE--------------TESTING ZONE--------------TESTING ZONE----TESTING ZONE-------------------TESTING ZONE-------------------------------TESTING ZONE
---TESTING ZONE--------TESTING ZONE--------TESTING ZONE-------TESTING ZONE-----------TESTING ZONE----TESTING ZONE---------------------TESTING ZONE--------TESTING ZONE------------------------------------TESTING ZONE---------------------------TESTING ZONE------------TESTING ZONE-----------TESTING ZONE---------------------TESTING ZONE--------TESTING ZONE------------------------------------------------------------------------------------------
------TESTING ZONE----------------TESTING ZONE--------------TESTING ZONE--------------TESTING ZONE--------------TESTING ZONE----TESTING ZONE-------------------TESTING ZONE-------------------------------TESTING ZONE
---TESTING ZONE--------TESTING ZONE--------TESTING ZONE-------TESTING ZONE-----------TESTING ZONE----TESTING ZONE---------------------TESTING ZONE--------TESTING ZONE------------------------------------TESTING ZONE---------------------------TESTING ZONE------------TESTING ZONE-----------TESTING ZONE---------------------TESTING ZONE--------TESTING ZONE------------------------------------------------------------------------------------------
------TESTING ZONE----------------TESTING ZONE--------------TESTING ZONE--------------TESTING ZONE--------------TESTING ZONE----TESTING ZONE-------------------TESTING ZONE-------------------------------TESTING ZONE
---TESTING ZONE--------TESTING ZONE--------TESTING ZONE-------TESTING ZONE-----------TESTING ZONE----TESTING ZONE---------------------TESTING ZONE--------TESTING ZONE------------------------------------TESTING ZONE---------------------------TESTING ZONE------------TESTING ZONE-----------TESTING ZONE---------------------TESTING ZONE--------TESTING ZONE------------------------------------------------------------------------------------------
------TESTING ZONE----------------TESTING ZONE--------------TESTING ZONE--------------TESTING ZONE--------------TESTING ZONE----TESTING ZONE-------------------TESTING ZONE-------------------------------TESTING ZONE
---TESTING ZONE--------TESTING ZONE--------TESTING ZONE-------TESTING ZONE-----------TESTING ZONE----TESTING ZONE---------------------TESTING ZONE--------TESTING ZONE-----------
----------------------------------------------------------------------------------------------------------------------------------------------------




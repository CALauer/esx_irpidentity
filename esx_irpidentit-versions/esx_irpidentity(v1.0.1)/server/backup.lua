ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function getIdentity(source, callback)
	local identifier = GetPlayerIdentifiers(source)[1]
-----------------------------------------------------------------------------              -----------------------------------------------------------------------------
---------                        IMPULSERP                      ---------- FETCH CHARACTERS------------                        IMPULSERP                       --------- 
-----------------------------------------------------------------------------			   -----------------------------------------------------------------------------
---------                        IMPULSERP                      ---------- FETCH CHARACTERS------------                        IMPULSERP                       --------- 
-----------------------------------------------------------------------------			   -----------------------------------------------------------------------------
	MySQL.Async.fetchAll('SELECT identifier, firstname, lastname, dateofbirth, sex, height, skin FROM `users` WHERE `identifier` = @identifier', {
		['@identifier'] = identifier
	}, function(result)
		if result[1].firstname ~= nil then
			local data = {
				identifier				= result[1].identifier,
				firstname				= result[1].firstname,
				lastname				= result[1].lastname,
				dateofbirth				= result[1].dateofbirth,
				sex						= result[1].sex,
				height					= result[1].height,
				skin					= result[1].skin,
				money 					= result[1].money,
				job 					= result[1].job,
				job_grade	 			= result[1].job_grade,
				loadout					= result[1].loadout,
				bank					= result[1].bank,
				permission_level 		= result[1].permission_level,
				is_dead 				= result[1].last_property,
				position				= result[1].position,
			}

			callback(data)
		else
			local data = {
				identifier				=  '',
				firstname3				=  '',
				lastname3				=  '',
				dateofbirth3			=  '',
				sex3					=  '',
				height3					=  '',
				skin3					=  '',
				money3 					=  '',
				job3 					=  '',
				job_grade3	 			=  '',
				loadout3 				=  '',
				bank3 					=  '',
				permission_level3 		=  '',
				is_dead3 				=  '',
				position3				=  '',
			}

			callback(data)
		end
	end)
end

RegisterServerEvent("getCharacters")
AddEventHandler("getCharacters", function(source, callback)
	local identifier = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll('SELECT * FROM `characters` WHERE `identifier` = @identifier', {
		['@identifier'] = identifier
	}, function(result)
		if result[1] and result[2] and result[3] then

			local data = {
				firstname1				= result[1].firstname,
				lastname1				= result[1].lastname,
				dateofbirth1			= result[1].dateofbirth,
				sex1					= result[1].sex,
				height1					= result[1].height,
				skin1					= result[1].skin,
				money1 					= result[1].money,
				job1 					= result[1].job,
				job_grade1	 			= result[1].job_grade,
				loadout1 				= result[1].loadout,
				bank1 					= result[1].bank,
				permission_level1 		= result[1].permission_level,
				is_dead1 				= result[1].last_property,
				position1				= result[1].position,
				firstname2				= result[2].firstname,
				lastname2				= result[2].lastname,
				dateofbirth2			= result[2].dateofbirth,
				sex2					= result[2].sex,
				height2					= result[2].height,
				skin2					= result[2].skin,
				money2 					= result[2].money,
				job2 					= result[2].job,
				job_grade2	 			= result[2].job_grade,
				loadout2 				= result[2].loadout,
				bank2 					= result[2].bank,
				permission_level2 		= result[2].permission_level,
				is_dead2 				= result[2].last_property,
				position2				= result[2].position,
				firstname3				= result[3].firstname,
				lastname3				= result[3].lastname,
				dateofbirth3			= result[3].dateofbirth,
				sex3					= result[3].sex,
				height3					= result[3].height,
				skin3					= result[3].skin,
				money3 					= result[3].money,
				job3 					= result[3].job,
				job_grade3	 			= result[3].job_grade,
				loadout3 				= result[3].loadout,
				bank3 					= result[3].bank,
				permission_level3 		= result[3].permission_level,
				is_dead3 				= result[3].last_property,
				position3				= result[3].position
			}

			callback(data)

		elseif result[1] and result[2] and not result[3] then

			local data = {
				identifier				= result[1].identifier,
				firstname1				= result[1].firstname,
				lastname1				= result[1].lastname,
				dateofbirth1			= result[1].dateofbirth,
				sex1					= result[1].sex,
				height1					= result[1].height,
				skin1					= result[1].skin,
				money1 					= result[1].money,
				job1 					= result[1].job,
				job_grade1	 			= result[1].job_grade,
				loadout1 				= result[1].loadout,
				bank1 					= result[1].bank,
				permission_level1 		= result[1].permission_level,
				is_dead1 				= result[1].last_property,
				position1				= result[1].position,
				firstname2				= result[2].firstname,
				lastname2				= result[2].lastname,
				dateofbirth2			= result[2].dateofbirth,
				sex2					= result[2].sex,
				height2					= result[2].height,
				skin2					= result[2].skin,
				money2 					= result[2].money,
				job2 					= result[2].job,
				job_grade2	 			= result[2].job_grade,
				loadout2 				= result[2].loadout,
				bank2 					= result[2].bank,
				permission_level2 		= result[2].permission_level,
				is_dead2 				= result[2].last_property,
				position2				= result[2].position,
				firstname3				= '',
				lastname3				= '',
				dateofbirth3			= '',
				sex3					= '',
				height3					= '',
				skin3					= '',
				money3 					= '',
				job3 					= '',
				job_grade3	 			= '',
				loadout3 				= '',
				bank3 					= '',
				permission_level3 		= '',
				is_dead3 				= '',
				position3				= ''
			}

			callback(data)

		elseif result[1] and not result[2] and not result[3] then

			local data = {
				identifier				= result[1].identifier,
				firstname1				= result[1].firstname,
				lastname1				= result[1].lastname,
				dateofbirth1			= result[1].dateofbirth,
				sex1					= result[1].sex,
				height1					= result[1].height,
				skin1					= result[1].skin,
				money1 					= result[1].money,
				job1 					= result[1].job,
				job_grade1	 			= result[1].job_grade,
				loadout1 				= result[1].loadout,
				bank1 					= result[1].bank,
				permission_level1 		= result[1].permission_level,
				is_dead1 				= result[1].last_property,
				position1				= result[1].position,
				firstname2				= '',
				lastname2				= '',
				dateofbirth2			= '',
				sex2					= '',
				height2					= '',
				skin2					= '',
				money2 					= '',
				job2 					= '',
				job_grade2	 			= '',
				loadout2 				= '',
				bank2 					= '',
				permission_level2 		= '',
				is_dead2 				= '',
				position2				= '',
				firstname3				= '',
				lastname3				= '',
				dateofbirth3			= '',
				sex3					= '',
				height3					= '',
				skin3					= '',
				money3 					= '',
				job3 					= '',
				job_grade3	 			= '',
				loadout3 				= '',
				bank3 					= '',
				permission_level3 		= '',
				is_dead3 				= '',
				position3				= ''
			}

			callback(data)

		else

			local data = {
				firstname1				= '',
				lastname1				= '',
				dateofbirth1			= '',
				sex1					= '',
				height1					= '',
				skin1					= '',
				money1 					= '',
				job1 					= '',
				job_grade1	 			= '',
				loadout1 				= '',
				bank1 					= '',
				permission_level1 		= '',
				is_dead1 				= '',
				position1				= '',
				firstname2				= '',
				lastname2				= '',
				dateofbirth2			= '',
				sex2					= '',
				height2					= '',
				skin2					= '',
				money2 					= '',
				job2 					= '',
				job_grade2	 			= '',
				loadout2 				= '',
				bank2 					= '',
				permission_level2 		= '',
				is_dead2 				= '',
				position2				= '',
				firstname3				= '',
				lastname3				= '',
				dateofbirth3			= '',
				sex3					= '',
				height3					= '',
				skin3					= '',
				money3 					= '',
				job3 					= '',
				job_grade3	 			= '',
				loadout3 				= '',
				bank3 					= '',
				permission_level3 		= '',
				is_dead3 				= '',
				position3				= ''
			}

			callback(data)	
		end
	end)
end)

function setIdentity(identifier, data, callback)
	MySQL.Async.execute('INSERT INTO characters (identifier, firstname, lastname, dateofbirth, sex, height) VALUES (@identifier, @firstname, @lastname, @dateofbirth, @sex, @height)', {
		['@identifier']		= identifier,
		['@firstname']		= data.firstname,
		['@lastname']		= data.lastname,
		['@dateofbirth']	= data.dateofbirth,
		['@sex']			= data.sex,
		['@height']			= data.height
	}, function(rowsChanged)
		if callback then
			callback(true)
		end
	end)

	MySQL.Async.execute('UPDATE `users` SET `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `sex` = @sex, `height` = @height WHERE identifier = @identifier', {
		['@identifier']		= identifier,
		['@firstname']		= data.firstname,
		['@lastname']		= data.lastname,
		['@dateofbirth']	= data.dateofbirth,
		['@sex']			= data.sex,
		['@height']			= data.height
	})
end
-----------------------------------------------------------------------------              -----------------------------------------------------------------------------
---------                        IMPULSERP                         ---------- DO NOT TOUCH------------                            IMPULSERP                    --------- 
-----------------------------------------------------------------------------			   -----------------------------------------------------------------------------
---------                        IMPULSERP                         ---------- DO NOT TOUCH------------                            IMPULSERP                    --------- 
-----------------------------------------------------------------------------			   -----------------------------------------------------------------------------
RegisterServerEvent('updateIdentity')

AddEventHandler('updateIdentity', function(identifier, data, callback)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	

		MySQL.Async.execute('UPDATE users SET `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `sex` = @sex, `height` = @height, `skin` = @skin, `money` = @money,`job` = @job,`job_grade` = @job_grade,`loadout` = @loadout,`bank` = @bank,`permission_level` = @permission_level,`is_dead` = @is_dead,`position` = @position WHERE identifier = @identifier', {
			['@identifier']					= identifier,
			['@firstname']					= data.firstname,
			['@lastname']					= data.lastname,
			['@dateofbirth']				= data.dateofbirth,
			['@sex']						= data.sex,
			['@height']						= data.height,
			['@skin']						= data.skin,
			['@money']						= data.money,
			['@job']						= data.job,
			['@job_grade']					= data.job_grade,
			['@loadout']					= data.loadout,
			['@bank']						= data.bank,
			['@permission_level']			= data.permission_level

		}, function(rowsChanged)
			if callback then
				callback(true)
			end
			
		end)

		Citizen.Wait(1000)
		TriggerClientEvent('updateIdentity', -1, skin, skin)
		Citizen.Wait(100)
		print()
	end)
-----------------------------------------------------------------------------              -----------------------------------------------------------------------------
---------                        IMPULSERP                         ---------- DO NOT TOUCH------------                            IMPULSERP                    --------- 
-----------------------------------------------------------------------------			   -----------------------------------------------------------------------------
---------                        IMPULSERP                         ---------- DO NOT TOUCH------------                            IMPULSERP                    --------- 
-----------------------------------------------------------------------------			   -----------------------------------------------------------------------------

AddEventHandler('saveIdentity', function (identifier, data, callback)
	MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
		['@identifier'] = identifier}, function(data)

	MySQL.Async.execute('UPDATE `characters` SET `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `sex` = @sex, `height` = @height, `skin` = @skin, `money` = @money,`job` = @job,`job_grade` = @job_grade,`loadout` = @loadout,`bank` = @bank,`permission_level` = @permission_level,`is_dead` = @is_dead,`position` = @position WHERE identifier = @identifier AND firstname = @firstname AND lastname = @lastname AND dateofbirth = @dateofbirth AND sex = @sex AND height = @height', {
		['@identifier']					= identifier,
		['@firstname']					= data[1].firstname,
		['@lastname']					= data[1].lastname,
		['@dateofbirth']				= data[1].dateofbirth,
		['@sex']						= data[1].sex,
		['@height']						= data[1].height,
		['@skin']						= data[1].skin,
		['@money']						= data[1].money,
		['@job']						= data[1].job,
		['@job_grade']					= data[1].job_grade,
		['@loadout']					= data[1].loadout,
		['@bank']						= data[1].bank,
		['@permission_level']			= data[1].permission_level
	}, function(rowsChanged)
			if callback then
				callback(true)
			end
		end)
		Citizen.Wait(2000)
end)

function deleteIdentity(identifier, data, callback)
	MySQL.Async.execute('DELETE FROM `characters` WHERE identifier = @identifier AND firstname = @firstname AND lastname = @lastname AND dateofbirth = @dateofbirth AND sex = @sex AND height = @height', {
		['@identifier']		= identifier,
		['@firstname']		= data.firstname,
		['@lastname']		= data.lastname,
		['@dateofbirth']	= data.dateofbirth,
		['@sex']			= data.sex,
		['@height']			= data.height
	}, function(rowsChanged)
		if callback then
			callback(true)
			end
		end)
	end
end)




--[[TriggerEvent('es:addCommand', 'testing2',  function(source)	
		local source = source
		local xPlayer = ESX.GetPlayerFromId(source)	
		local identifier = GetPlayerIdentifiers(source)[1]	
		MySQL.Async.fetchAll('SELECT * FROM `users` WHERE `identifier` = @identifier', {
			['@identifier'] = identifier,
		}, function(result)
			if result[1].firstname ~= nil then
				local data = {
					identifier	= result[1].identifier,
					job 		= result[1].job,
					job_grade	 = result[1].job_grade,
				}
				local job1 = result[1].job
				local grade1 = result[1].job_grade
				if xPlayer then
					if ESX.DoesJobExist(job1, grade1) then
						xPlayer.setJob(job1,grade1)
					else
						TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'That job does not exist.' } })
					end
				end
				print(job1)
				print(grade1)
		end
	end)
end)]]-- 100% Working Configuration
RegisterServerEvent("setJob")
AddEventHandler("setJob", function(source, xPlayer, identifier)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)	
	local identifier = GetPlayerIdentifiers(source)[1]	
	MySQL.Async.fetchAll('SELECT * FROM `users` WHERE `identifier` = @identifier', {
		['@identifier'] = identifier,
	}, function(result)
		if result[1].firstname ~= nil then
			local data = {
				identifier	= result[1].identifier,
				job 		= result[1].job,
				job_grade	 = result[1].job_grade,
			}
			local job1 = result[1].job
			local grade1 = result[1].job_grade
			if xPlayer then
				if ESX.DoesJobExist(job1, grade1) then
					xPlayer.setJob(job1,grade1)
				else
					TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'That job does not exist.' } })
				end
			end
			print(job1)
			print(grade1)
	end
end)
end)

	




		
-------------------------------------------------------------------------              -----------------------------------------------------------------------------
---------                        IMPULSERP                         ---------- DO NOT TOUCH------------                            IMPULSERP                    --------- 
-----------------------------------------------------------------------------			   -----------------------------------------------------------------------------
---------                        IMPULSERP                         ---------- DO NOT TOUCH------------                            IMPULSERP                    --------- 
-----------------------------------------------------------------------------			   -----------------------------------------------------------------------------
RegisterServerEvent('esx_irpidentity:setIdentity')
AddEventHandler('esx_irpidentity:setIdentity', function(data, myIdentifiers)
	setIdentity(myIdentifiers.steamid, data, function(callback)
		if callback then
			TriggerClientEvent('esx_irpidentity:identityCheck', myIdentifiers.playerid, true)
		else
			TriggerClientEvent('chat:addMessage', source, { args = { '^[ImpulseRP]', 'Failed to set character, try again later or contact the server admin!' } })
		end
	end)
end)
-----------------------------------------------------------------------------              -----------------------------------------------------------------------------
---------                        COMPLETE                         ---------- DO NOT TOUCH------------                            COMPLETE                      --------- 
-----------------------------------------------------------------------------			   -----------------------------------------------------------------------------
---------                   IMPULSERP COMPLETE                    ---------- DO NOT TOUCH------------                        IMPULSERP COMPLETE                --------- 
-----------------------------------------------------------------------------			   -----------------------------------------------------------------------------
AddEventHandler('es:playerLoaded', function(source)
	local myID = {
		steamid = GetPlayerIdentifiers(source)[1],
		playerid = source
	}

	TriggerClientEvent('esx_irpidentity:saveID', source, myID)
	getIdentity(source, function(data)
		if data.firstname == '' then
			TriggerClientEvent('esx_irpidentity:identityCheck', source, false)
			TriggerClientEvent('esx_irpidentity:showRegisterIdentity', source)
		else
			TriggerClientEvent('esx_irpidentity:identityCheck', source, true)
		end
	end)
end)
-----------------------------------------------------------------------------              -----------------------------------------------------------------------------
---------                        BUGGED                           ---------- DO NOT TOUCH  ------------                            BUGGED                      --------- 
-----------------------------------------------------------------------------			   -----------------------------------------------------------------------------
---------                   IMPULSERP COMPLETE                    ---------- DO NOT TOUCH------------                        IMPULSERP COMPLETE                --------- 
-----------------------------------------------------------------------------			   -----------------------------------------------------------------------------

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		Citizen.Wait(3000)

		-- Set all the client side variables for connected users one new time
		local xPlayers, xPlayer = ESX.GetPlayers()
		for i=1, #xPlayers, 1 do
			xPlayer = ESX.GetPlayerFromId(xPlayers[i])

			local myID = {
				steamid  = xPlayer.identifier,
				playerid = xPlayer.source
			}

			TriggerClientEvent('esx_irpidentity:saveID', xPlayer.source, myID)

			getIdentity(xPlayer.source, function(data)
				if data.firstname == '' then
					TriggerClientEvent('esx_irpidentity:identityCheck', xPlayer.source, false)
					TriggerClientEvent('esx_irpidentity:showRegisterIdentity', xPlayer.source)
				else
					TriggerClientEvent('esx_irpidentity:identityCheck', xPlayer.source, true)
				end
			end)
		end
	end
end)

-----------------------------------------------------------------------------              -----------------------------------------------------------------------------
---------                        IMPULSERP                         ---------- DO NOT TOUCH------------                            IMPULSERP                    --------- 
-----------------------------------------------------------------------------			   -----------------------------------------------------------------------------
---------                        IMPULSERP                         ---------- DO NOT TOUCH------------                            IMPULSERP                    --------- 
-----------------------------------------------------------------------------			   -----------------------------------------------------------------------------
RegisterServerEvent('esx_irpidentity:getCharacterInformation')
AddEventHandler('esx_irpidentity:getCharacterInformation', function()
TriggerEvent('es:addCommand', 'testing1', function(source, args, user)	
	TriggerEvent('getCharacters', source, function(data)
		local source = source
		local xPlayer = ESX.GetPlayerFromId(source)

		if xPlayer ~= nil then
			local source		= source
			local firstname1 	= data.firstname1
			local lastname1 	= data.lastname1
			local job1			= data.job1
			local money1 		= data.money1
			local bank1 		= data.bank1
			local firstname2 	= data.firstname2
			local lastname2 	= data.lastname2
			local job2			= data.job2
			local money2 		= data.money2
			local bank2 		= data.bank2
			local firstname3 	= data.firstname3
			local lastname3 	= data.lastname3
			local job3			= data.job3
			local money3 		= data.money3
			local bank3 		= data.bank3

		TriggerClientEvent('esx_irpidentity:setCharacterInformation', source, firstname1, lastname1, job1, money1, bank1,firstname2, lastname2, job2, money2, bank2,firstname3, lastname3, job3, money3, bank3)
		end
	end)
	end)
end)

-----------------------------------------------------------------------------              -----------------------------------------------------------------------------
---------                        IMPULSERP                         ---------- DO NOT TOUCH------------                            IMPULSERP                    --------- 
-----------------------------------------------------------------------------			   -----------------------------------------------------------------------------
---------                        IMPULSERP                         ---------- DO NOT TOUCH------------                            IMPULSERP                    --------- 
-----------------------------------------------------------------------------			   -----------------------------------------------------------------------------	



-----------------------------------------------------------------------------              -----------------------------------------------------------------------------
---------                        IMPULSERP                          ---------    SWITCH   ----------                      IMPULSERP                            --------- 
-----------------------------------------------------------------------------			   -----------------------------------------------------------------------------
---------                        IMPULSERP                          ---------    SWITCH   ----------                      IMPULSERP                            --------- 
-----------------------------------------------------------------------------			   -----------------------------------------------------------------------------
-----------------------------------------------------------------------------              -----------------------------------------------------------------------------
---------                        IMPULSERP                      ---------- DELETE CHARACTERS------------                          IMPULSERP                    --------- 
-----------------------------------------------------------------------------			   -----------------------------------------------------------------------------
---------                        IMPULSERP                      ---------- DELETE CHARACTERS------------                          IMPULSERP                    --------- 
-----------------------------------------------------------------------------			   -----------------------------------------------------------------------------
--[[TriggerEvent('es:addGroupCommand', 'chardel', 'user', function(source, args, user)
	local charNumber = tonumber(args[1])

	if charNumber == nil or charNumber > 3 or charNumber < 1 then
		TriggerClientEvent('chat:addMessage', source, { args = { '^[ImpulseRP]', 'That\'s an invalid character!' } })
		return
	end

	TriggerEvent('getCharacters', source, function(data)	

		if charNumber == 1 then

			local data = {
				identifier					= data.identifier,
				firstname					= data.firstname1,
				lastname					= data.lastname1,
				dateofbirth					= data.dateofbirth1,
				sex							= data.sex1,
				height						= data.height1,
				skin						= data.skin1,
				money						= data.money1,
				job							= data.job1,
				job_grade					= data.job_grade1,
				loadout						= data.loadout1,
				bank						= data.bank1,
				permission_level			= data.permission_level1,
				is_dead						= data.is_dead1,
				position					= data.position1
			}

			if data.firstname ~= '' then
				deleteIdentity(GetPlayerIdentifiers(source)[1], data, function(callback)
					if callback then
						TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'You have deleted ^3' .. data.firstname .. ' ' .. data.lastname } })
					else
						TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'Failed to delete the character, try again later or contact the server admin!' } })
					end
				end)
			else
				TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'You don\'t have a character in slot 1!' } })
			end

		elseif charNumber == 2 then

			local data = {
				identifier					= data.identifier,
				firstname					= data.firstname2,
				lastname					= data.lastname2,
				dateofbirth					= data.dateofbirth2,
				sex							= data.sex2,
				height						= data.height2,
				skin						= data.skin2,
				money						= data.money2,
				job							= data.job2,
				job_grade					= data.job_grade2,
				loadout						= data.loadout2,
				bank						= data.bank2,
				permission_level			= data.permission_level2,
				is_dead						= data.is_dead2,
				position					= data.position2
			}

			if data.firstname ~= '' then
				deleteIdentity(GetPlayerIdentifiers(source)[1], data, function(callback)
					if callback then
						TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'You have deleted ^3' .. data.firstname .. ' ' .. data.lastname } })
					else
						TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'Failed to delete the character, try again later or contact the server admin!' } })
					end
				end)
			else
				TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'You don\'t have a character in slot 2!' } })
			end

		elseif charNumber == 3 then

			local data = {
				identifier					= data.identifier,
				firstname					= data.firstname3,
				lastname					= data.lastname3,
				dateofbirth					= data.dateofbirth3,
				sex							= data.sex3,
				height						= data.height3,
				skin						= data.skin3,
				money						= data.money3,
				job							= data.job3,
				job_grade					= data.job_grade3,
				loadout						= data.loadout3,
				bank						= data.bank3,
				permission_level			= data.permission_level3,
				is_dead						= data.is_dead3,
				position					= data.position3
			}

			if data.firstname ~= '' then
				deleteIdentity(GetPlayerIdentifiers(source)[1], data, function(callback)
					if callback then
						TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'You have deleted ^3' .. data.firstname .. ' ' .. data.lastname } })
					else
						TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'Failed to delete the character, try again later or contact the server admin!' } })
					end
				end)
			else
				TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'You don\'t have a character in slot 3!' } })
			end
		else
			TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'Failed to delete the character, try again!' } })
		end
	end)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^3SYSTEM', 'Insufficient permissions!' } })
end, {help = "Delete a registered character", params = {{name = "char", help = "the character id, ranges from 1-3"}}}) ]]--

-----------------------------------------------------------------------------              -----------------------------------------------------------------------------
---------                        IMPULSERP                     ---------- GUI CHARACTER SELECT------------                        IMPULSERP                    --------- 
-----------------------------------------------------------------------------			   -----------------------------------------------------------------------------
---------                        IMPULSERP                     ---------- GUI CHARACTER SELECT------------                        IMPULSERP                    --------- 
-----------------------------------------------------------------------------			   -----------------------------------------------------------------------------

RegisterServerEvent("esx_irpidentity:CharacterChosen")
AddEventHandler("esx_irpidentity:CharacterChosen", function(charid)
	local source = source
	local charNumber = tonumber(charid)
	local xPlayer = ESX.GetPlayerFromId(source)
	print(charNumber)
	TriggerEvent('getCharacters', source, function(data)	
		if charNumber == 1 then
			local data = {
				identifier					= data.identifier,
				firstname					= data.firstname1,
				lastname					= data.lastname1,
				dateofbirth					= data.dateofbirth1,
				sex							= data.sex1,
				height						= data.height1,
				skin						= data.skin1,
				money						= data.money1,
				job							= data.job1,
				job_grade					= data.job_grade1,
				loadout						= data.loadout1,
				bank						= data.bank1,
				permission_level			= data.permission_level1,
				is_dead						= data.is_dead1,
				position					= data.position1

			}

			if data.firstname ~= '' then
				TriggerEvent('saveIdentity', GetPlayerIdentifiers(source)[1], data, function(callback)
					Citizen.Wait(2000)
					TriggerEvent('updateIdentity', GetPlayerIdentifiers(source)[1], data, function(callback)
						if callback then
							TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'Updated your active character to ^2' .. data.firstname .. ' ' .. data.lastname } })
						else
							TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'Failed to update your identity, try again later or contact the server admin!' } })
						end
					end)
				end)
			else
				TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'You don\'t have a character in slot 1!' } })
			end
		elseif charNumber == 2 then

			local data = {
				identifier					= data.identifier,
				firstname					= data.firstname2,
				lastname					= data.lastname2,
				dateofbirth					= data.dateofbirth2,
				sex							= data.sex2,
				height						= data.height2,
				skin						= data.skin2,
				money						= data.money2,
				job							= data.job2,
				job_grade					= data.job_grade2,
				loadout						= data.loadout2,
				bank						= data.bank2,
				permission_level			= data.permission_level2,
				is_dead						= data.is_dead2,
				position					= data.position2
			}

			if data.firstname ~= '' then
				TriggerEvent('saveIdentity', GetPlayerIdentifiers(source)[1], data, function(callback)
					Citizen.Wait(2000)
					TriggerEvent('updateIdentity', GetPlayerIdentifiers(source)[1], data, function(callback)
						if callback then
							TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'Updated your active character to ^2' .. data.firstname .. ' ' .. data.lastname } })
						else
							TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'Failed to update your identity, try again later or contact the server admin!' } })
						end
					end)
				end)
			else
				TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'You don\'t have a character in slot 2!' } })
			end
		elseif charNumber == 3 then

			local data = {
				identifier					= data.identifier,
				firstname					= data.firstname3,
				lastname					= data.lastname3,
				dateofbirth					= data.dateofbirth3,
				sex							= data.sex3,
				height						= data.height3,
				skin						= data.skin3,
				money						= data.money3,
				job							= data.job3,
				job_grade					= data.job_grade3,
				loadout						= data.loadout3,
				bank						= data.bank3,
				permission_level			= data.permission_level3,
				is_dead						= data.is_dead3,
				position					= data.position3
			}

			if data.firstname ~= '' then
				TriggerEvent('saveIdentity', GetPlayerIdentifiers(source)[1], data, function(callback)
					Citizen.Wait(2000)
					TriggerEvent('updateIdentity', GetPlayerIdentifiers(source)[1], data, function(callback)
						if callback then
							TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'Updated your active character to ^2' .. data.firstname .. ' ' .. data.lastname } })
						else
							TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'Failed to update your identity, try again later or contact the server admin!' } })
						end
					end)
				end)
			else
				TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'You don\'t have a character in slot 3!' } })
			end
		end

	end)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^3SYSTEM', 'Insufficient permissions!' } })
end, {help = "Switch between character", params = {{name = "char", help = "the character id, ranges from 1-3"}}})
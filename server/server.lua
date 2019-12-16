-----------------------------------------------------------------------------              -----------------------------------------------------------------------------
---------                        IMPULSERP                         ---------- DO NOT TOUCH------------                            IMPULSERP                    --------- 
-----------------------------------------------------------------------------			   -----------------------------------------------------------------------------
---------                        IMPULSERP                         ---------- DO NOT TOUCH------------                            IMPULSERP                    --------- 
-----------------------------------------------------------------------------			   -----------------------------------------------------------------------------	
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
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

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		Citizen.Wait(5000)

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

function getIdentity(source, callback)
	local identifier = GetPlayerIdentifiers(source)[1]

	MySQL.Async.fetchAll('SELECT identifier, firstname, lastname, dateofbirth, sex, height, skin FROM `users` WHERE `identifier` = @identifier', {
		['@identifier'] = identifier
	}, function(result)
		if result[1].firstname ~= nil then
			local data = {
				identifier				= result[1].identifier,
				irpid					= result[1].irpid,
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
				is_dead 				= result[1].is_dead,
				position				= result[1].position,
				phone_number			= result[1].phone_number,
			}

			callback(data)
		else
			local data = {
				identifier				=  '',
				irpid					=  '',
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
				phone_number			=  '',
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
				identifier				= result[1].identifier,
				irpid1					= result[1].irpid,
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
				is_dead1 				= result[1].is_dead,
				position1				= result[1].position,
				phone_number1			= result[1].phone_number,
				irpid2					= result[1].irpid,
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
				is_dead2 				= result[2].is_dead,
				position2				= result[2].position,
				phone_number2			= result[2].phone_number,
				irpid3					= result[3].irpid,
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
				is_dead3 				= result[3].is_dead,
				position3				= result[3].position,
				phone_number3			= result[3].phone_number
			}

			callback(data)

		elseif result[1] and result[2] and not result[3] then

			local data = {
				identifier				= result[1].identifier,
				irpid1					= result[1].irpid,
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
				is_dead1 				= result[1].is_dead,
				position1				= result[1].position,
				phone_number1			= result[1].phone_number,
				irpid2					= result[2].irpid,
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
				is_dead2 				= result[2].is_dead,
				position2				= result[2].position,
				phone_number2			= result[2].phone_number,
				irpid3					= '',
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
				position3				= '',
				phone_number			= ''
			}

			callback(data)

		elseif result[1] and not result[2] and not result[3] then

			local data = {
				identifier				= result[1].identifier,
				irpid					= result[1].irpid,
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
				is_dead1 				= result[1].is_dead,
				position1				= result[1].position,
				phone_number1			= result[1].phone_number,
				irpid2					= '',
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
				phone_number2			= '',
				irpid3					= '',
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
				position3				= '',
				phone_number3			= ''
			}

			callback(data)

		else

			local data = {
				irpid1					= '',
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
				phone_number1			= '',
				irpid2					= '',
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
				phone_number2			= '',
				irpid3					= '',
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
				position3				= '',
				phone_number3			= ''
			}
			callback(data)	
		end
	end)
end)
-- Sets initial identity upon entering the server
RegisterServerEvent('setIdentity')
AddEventHandler('setIdentity', function(identifier, data, callback)
	local chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
	local length = 10
	local irpid = ''
	math.randomseed(os.time())
	charTable = {}
	for c in chars:gmatch"." do
		table.insert(charTable, c)
	end
	for i = 1, length do
		irpid = irpid .. charTable[math.random(1, #charTable)]
	end
	MySQL.Async.execute('UPDATE `users` SET `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `sex` = @sex, `height` = @height, `bank` = @bank, `money` = @money, `job` = @job, `job_grade` = @job_grade, `irpid` = @irpid, `phone_number` = @phone_number WHERE identifier = @identifier', {
	['@identifier']		= identifier,
	['@firstname']		= data.firstname,
	['@lastname']		= data.lastname,
	['@dateofbirth']	= data.dateofbirth,
	['@sex']			= data.sex,
	['@height']			= data.height,
	['@bank']			= "0",
	['@money']			= "0",
	['@job']			= "unemployed",
	['@job_grade']		= "0",
	['@irpid']			= irpid,
	['@phone_number']	= "0"
}, function(rowsChanged)
	if callback then
		callback(true)
	end
	MySQL.Async.execute('INSERT INTO characters (identifier, firstname, lastname, dateofbirth, sex, height, bank, money, job, job_grade, phone_number, irpid) VALUES (@identifier, @firstname, @lastname, @dateofbirth, @sex, @height, @bank, @money, @job, @job_grade, @phone_number, @irpid)', {
	['@identifier']		= identifier,
	['@firstname']		= data.firstname,
	['@lastname']		= data.lastname,
	['@dateofbirth']	= data.dateofbirth,
	['@sex']			= data.sex,
	['@height']			= data.height,
	['@bank']			= "0",
	['@money']			= "0",
	['@job']			= "unemployed",
	['@job_grade']		= "0",
	['@irpid']			= irpid,
	['@phone_number']	= "0"


	})
	MySQL.Async.execute('UPDATE `user_inventory` SET `irpid` = @irpid, count = 0 WHERE identifier = @identifier', {   --- Sets inventory account to 0 when registering/creating new character
	['@identifier'] = identifier,
	['@irpid'] = irpid
	})
	MySQL.Async.execute('SELECT * FROM `user_inventory` WHERE identifier = @identifier AND irpid = @irpid', { --- Gets character unique irpid
	['@identifier'] = identifier,
	['@irpid'] = irpid
	})
	MySQL.Async.execute('INSERT INTO character_inventory (identifier, irpid, item, count) SELECT identifier, irpid, item, count FROM user_inventory WHERE irpid = @irpid', { --- Updates the character inventory
		['@irpid'] = irpid
	})
	end)
end)

RegisterServerEvent('updateIdentity')
AddEventHandler('updateIdentity', function(source, xPlayer, identifier, data, callback)
	local identifier = GetPlayerIdentifiers(source)[1] --grabs ingame identifier else will not find it
	local xPlayer = xPlayer
	MySQL.Async.execute('UPDATE users SET `irpid` = @irpid, `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `sex` = @sex, `height` = @height, `skin` = @skin, `money` = @money,`job` = @job,`job_grade` = @job_grade,`loadout` = @loadout,`bank` = @bank,`permission_level` = @permission_level,`is_dead` = @is_dead,`position` = @position, `phone_number` = @phone_number WHERE identifier = @identifier', {
		['@identifier']					= identifier,
		['@irpid']						= data.irpid,
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
		['@permission_level']			= data.permission_level,
		['@phone_number']				= data.phone_number,
		['@position']					= data.position
	}, function(rowsChanged)
		if callback then
			callback(true)
			end
			print(xPlayer)
			print(identifier)
			print(source)
				TriggerClientEvent('updateIdentity', source, skin)
		end)

end)

	-- Save most recent loadout/money/ect to both characters table //is necessary
RegisterServerEvent('saveIdentityBeforeChange')  
AddEventHandler('saveIdentityBeforeChange', function (identifier, data, callback)
	local identifier = GetPlayerIdentifiers(source)[1] --grabs ingame identifier else will not find it
	local xPlayer = ESX.GetPlayerFromId(source)
	local source = xPlayer.source
	local money1 = xPlayer.getMoney()
	MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
		['@identifier'] = identifier}, function(data)

		MySQL.Async.execute('UPDATE `characters` SET `irpid` = @irpid, `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `sex` = @sex, `height` = @height, `skin` = @skin, `money` = @money,`job` = @job,`job_grade` = @job_grade,`loadout` = @loadout,`bank` = @bank,`permission_level` = @permission_level,`is_dead` = @is_dead,`position` = @position, `phone_number` = @phone_number WHERE identifier = @identifier AND irpid = @irpid', {
		['@identifier']					= identifier,
		['@irpid']						= data[1].irpid,
		['@firstname']					= data[1].firstname,
		['@lastname']					= data[1].lastname,
		['@dateofbirth']				= data[1].dateofbirth,
		['@sex']						= data[1].sex,
		['@height']						= data[1].height,
		['@skin']						= data[1].skin,
		['@money']						= money1,
		['@job']						= xPlayer.job.name,
		['@job_grade']					= xPlayer.job.grade,
		['@loadout']					= json.encode(xPlayer.getLoadout()),
		['@bank']						= data[1].bank,
		['@permission_level']			= data[1].permission_level,
		['@position']					= data[1].position,
		['@phone_number']				= data[1].phone_number
	}, function(rowsChanged)
			if callback then
				callback(true)
		end
		TriggerEvent('saveXplayerInventory', xPlayer, identifier)
	end)
end)
RegisterNetEvent('deleteCharacter')
AddEventHandler('deleteCharacter', function (identifier, data, callback)
	MySQL.Async.execute('DELETE characters, character_inventory FROM characters INNER JOIN character_inventory ON characters.irpid = character_inventory.irpid WHERE characters.irpid = @irpid AND character_inventory.irpid = @irpid', {
		['@identifier']					= identifier,
		['@irpid']						= data.irpid
	}, function(rowsChanged)
				if callback then
				callback(true)
			end
		end)
	end)
end)

RegisterServerEvent('esx_irpidentity:getClientInfo')
AddEventHandler('esx_irpidentity:getClientInfo', function(identifier)
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local source = xPlayer.source	
	TriggerEvent('getCharacters', source, function(data)
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
			TriggerClientEvent('esx_irpidentity:setCharacterInformation',  source, firstname1, lastname1, job1, money1, bank1,firstname2, lastname2, job2, money2, bank2,firstname3, lastname3, job3, money3, bank3)
		end
	end)
end)

RegisterServerEvent('loadoutupdate')
AddEventHandler('loadoutupdate', function(loadout)
	local loadout1 = {}
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll('SELECT * FROM `users` WHERE `identifier` = @identifier', {
		['@identifier'] = identifier,
		['@loadout']	= loadout,
	}, function(result)
		if result[1].firstname ~= nil then
			local data = {
				identifier			= result[1].identifier,
				loadout				= result[1].loadout,
			}
			local loadout = json.decode(result[1].loadout)
				for i=1, #xPlayer.loadout, 1 do
				xPlayer.removeWeapon(xPlayer.loadout[i].name)
				end
				for i=1, #loadout1, 1 do
				if loadout1[i].label ~= nil then
				xPlayer.addWeapon(loadout1[i].name, loadout1[i].ammo)
				end
			end
		end
	end)
end)

RegisterServerEvent('setCharacterData')
AddEventHandler("setCharacterData", function(xPlayer, setData)
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll('SELECT * FROM `users` WHERE `identifier` = @identifier', {
		['@identifier'] = identifier,
		['@loadout']	= loadout,
		['@group']		= group,
	}, function(result)
				TriggerEvent('es:playerLoaded', xPlayer.source, xPlayer)
	end)
end)

RegisterServerEvent('setCharacterDataSwitch')
AddEventHandler("setCharacterDataSwitch", function(setData)
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll('SELECT * FROM `users` WHERE `identifier` = @identifier', {
		['@identifier'] = identifier,
		['@loadout']	= loadout,
		['@group']		= group,
	}, function(result)
		if result[1].firstname ~= nil and  xPlayer ~= nill then
				TriggerEvent('es:playerLoaded', xPlayer.source, xPlayer)
		end
	end)
end)
																		------------------------SERVER EVENTS---------------------------
RegisterServerEvent('esx_irpidentity:setIdentity')
AddEventHandler('esx_irpidentity:setIdentity', function(data, myIdentifiers)
	TriggerEvent('setIdentity', myIdentifiers.steamid, data, function(callback)
		if callback then
			TriggerClientEvent('esx_irpidentity:identityCheck', myIdentifiers.playerid, true)
		else
			TriggerClientEvent('chat:addMessage', source, { args = { '^[ImpulseRP]', 'Failed to set character, try again later or contact the server admin!' } })
		end
	end)
end)

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

			TriggerClientEvent('esx_irpidentity:setCharacterInformation',  source, firstname1, lastname1, job1, money1, bank1,firstname2, lastname2, job2, money2, bank2,firstname3, lastname3, job3, money3, bank3)		
			end
		end)
	end)
end)

ESX.RegisterServerCallback('esx_irpidentity:characterCheck', function(source, check)
	TriggerEvent('getCharacters', source, function(data)
		if data.firstname3 == '' then
		check(true)
		elseif data.firstname3 ~= '' then
		check(false)
		print(check)
		end
	end)
end)
RegisterServerEvent("deleteCharacters")
AddEventHandler('deleteCharacters', function(charid)
	local source = source
	local charNumber = tonumber(charid)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerEvent('getCharacters', source, function(data)	
		if charNumber == 1 and xPlayer ~= nil then
			local data = {
				irpid						= data.irpid1
			}
			if data.firstname ~= '' then				
				TriggerEvent('deleteCharacter', GetPlayerIdentifiers(source)[1], data, function(callback)
					Citizen.Wait(1000)
					if callback then
						TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'You have deleted your character in slot 1' } })
					else
						TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'Failed to delete you character, try again or contact the server admin!' } })
					end
				end)
			else
				TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'You don\'t have a character in slot 1!' } })
			end

		elseif charNumber == 2 then
			local data = {
				irpid						= data.irpid2
			}

			if data.firstname ~= '' then				
				TriggerEvent('deleteCharacter', GetPlayerIdentifiers(source)[1], data, function(callback)
					Citizen.Wait(1000)
					if callback then
						TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'You have deleted your character in slot 2' } })
					else
						TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'Failed to delete you character, try again or contact the server admin!' } })
					end
				end)
			else
				TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'You don\'t have a character in slot 2!' } })
			end

		elseif charNumber == 3 then
			local data = {
				irpid						= data.irpid3
			}
			if data.firstname ~= '' then				
				TriggerEvent('deleteCharacter', GetPlayerIdentifiers(source)[1], data, function(callback)
					Citizen.Wait(1000)
					if callback then
						TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'You have deleted your character in slot 3' } })
					else
						TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'Failed to delete you character, try again or contact the server admin!' } })
					end
				end)
			else
				TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'You don\'t have a character in slot 3!' } })
			end
		end
	end)
end)

RegisterServerEvent("esx_irpidentity:CharacterChosen") --triggered from "Play button"
AddEventHandler("esx_irpidentity:CharacterChosen", function(charid)
	local source = source
	local charNumber = tonumber(charid)
	local xPlayer = ESX.GetPlayerFromId(source)
	print(charNumber)
	TriggerEvent('getCharacters', source, function(data)	
		if charNumber == 1 and xPlayer ~= nil then
			local data = {
				identifier					= data.identifier,
				irpid						= data.irpid1,
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
				position					= data.position1,
				phone_number		     	= data.phone_number1

			}
			if data.firstname ~= '' then
				TriggerEvent('updateIdentity',source, xPlayer, GetPlayerIdentifiers(source)[1], data, function(callback)
					if callback then
						TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'Updated your active character to ^2' .. data.firstname .. ' ' .. data.lastname } })
					else
						TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'Failed to update your identity, try again later or contact the server admin!' } })
					end
				end)
			else
				TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'You don\'t have a character in slot 1!' } })
			end
		elseif charNumber == 2 then

			local data = {
				identifier					= data.identifier,
				irpid						= data.irpid2,
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
				position					= data.position2,
				phone_number		     	= data.phone_number2
			}

			if data.firstname ~= '' then
				TriggerEvent('updateIdentity', source, xPlayer, GetPlayerIdentifiers(source)[1], data, function(callback)
					if callback then
						TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'Updated your active character to ^2' .. data.firstname .. ' ' .. data.lastname } })
					else
						TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'Failed to update your identity, try again later or contact the server admin!' } })
					end
				end)
			else
				TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'You don\'t have a character in slot 2!' } })
			end

		elseif charNumber == 3 then

			local data = {
				identifier					= data.identifier,
				irpid						= data.irpid3,
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
				position					= data.position3,
				phone_number		     	= data.phone_number3
			}
			if data.firstname ~= '' then
				TriggerEvent('updateIdentity',source, xPlayer, GetPlayerIdentifiers(source)[1], data, function(callback)
					if callback then
						TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'Updated your active character to ^2' .. data.firstname .. ' ' .. data.lastname } })
					else
						TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'Failed to update your identity, try again later or contact the server admin!' } })
					end
				end)
			else
				TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'You don\'t have a character in slot 3!' } })
			end
		end
	end)
end)

----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------                        UPDATES CHARACTER INVENTORY                       -------------------------------------
-------------------------------------                        UPDATES CHARACTER FROM USER                       -------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent('updateCharacterInventory')
AddEventHandler("updateCharacterInventory", function(identifier)
local xPlayer = ESX.GetPlayerFromId(source)
local identifier = identifier
print("Updating character inventory")
	MySQL.Async.fetchAll('SELECT irpid FROM users WHERE identifier = @identifier', {
	['@identifier'] = identifier
	}, function(result)
		print(result[1].irpid)
		local irpid = result[1].irpid
		print(irpid)
	MySQL.Async.execute('UPDATE character_inventory, user_inventory SET character_inventory.count = user_inventory.count WHERE user_inventory.irpid = @irpid AND character_inventory.item = user_inventory.item', {
	['@irpid'] = irpid
	})
		end)
end)
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------							 UPDATES USER INVENTORY                        -------------------------------------
-------------------------------------                         UPDATES USER FROM CHARACTER DB                   -------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent('updateUserInventory')
AddEventHandler("updateUserInventory", function(userInv)
local xPlayer = ESX.GetPlayerFromId(source)
local identifier = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll('SELECT irpid, identifier FROM users WHERE identifier = @identifier', { --gets players irpid || identifier = steamID
	['@irpid'] = irpid,
	['@identifier'] = identifier
	}, function(result)
		print(result[1].irpid)
		local irpid = result[1].irpid
		print(irpid)
	MySQL.Async.execute('UPDATE user_inventory, character_inventory SET user_inventory.irpid = character_inventory.irpid, user_inventory.count = character_inventory.count WHERE character_inventory.irpid = @irpid AND character_inventory.item = user_inventory.item', {
	['@identifier'] = identifier,
	['@irpid']	= irpid
	})
	end)
end)
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------                  UPDATES XPLAYER INVENTORY IN GAME REAL TIME             -------------------------------------
-------------------                                                  FROM DATABASE												 ------------------- 
-------------------------------------                   ALSO UPDATES INVENTORY IF NO VALUES FOUND              -------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------                          UPDATES USER INVENTORY                          -------------------------------------
-------------------                                                  FROM XPLAYER												 ------------------- 
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent('saveXplayerInventory')
AddEventHandler("saveXplayerInventory", function(xPlayer, identifier)
	local xPlayer = xPlayer
	local identifier = identifier
	MySQL.Async.fetchAll('SELECT irpid, identifier FROM users WHERE identifier = @identifier', { --gets players irpid || identifier = steamID
	['@identifier'] = identifier,
	}, function(result)
		print(result[1].irpid)
		local irpid = result[1].irpid
		for i=1, #xPlayer.inventory, 1 do
			MySQL.Async.execute('UPDATE character_inventory SET count = @count WHERE identifier = @identifier AND item = @item AND irpid = @irpid', {
				['@irpid']		= irpid,
				['@count']      = xPlayer.inventory[i].count,
				['@identifier'] = xPlayer.identifier,
				['@item']       = xPlayer.inventory[i].name
			}, function(rowsChanged)
			end)
		end
	end)
end)
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------                  UPDATES XPLAYER INVENTORY IN GAME REAL TIME             -------------------------------------
-------------------                                                  FROM DATABASE												 ------------------- 
-------------------------------------                   ALSO UPDATES INVENTORY IF NO VALUES FOUND              -------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent('updateXplaysetInvZero')
AddEventHandler("updateXplaysetInvZero", function(InvZ)
	
	--TriggerEvent('es:addCommand', 'testing1', function(source, args, user)
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = GetPlayerIdentifiers(source)[1]
		playerInventory = json.encode(xPlayer.getInventory())
		print(ESX.Items)
		MySQL.Async.fetchAll('SELECT irpid, identifier FROM users WHERE identifier = @identifier', { --gets players irpid || identifier = steamID
		['@irpid'] = irpid,
		['@identifier'] = identifier
			}, function(result)
					print(result[1].irpid)
					local irpid = result[1].irpid
				MySQL.Async.fetchAll('SELECT item, count FROM character_inventory WHERE identifier = @identifier AND irpid = @irpid', {
					['@identifier'] = identifier,
					['@irpid'] = irpid
				}, function(inventory) --Returnns items from database
					for k,v in ipairs(inventory) do
						local item = ESX.Items[v.item] -- Checks to make sure item is item
						if item then
							table.insert(xPlayer.inventory, { -- inserts the items into Xplayer inventory in propper format
								name = v.item,
								count = v.count,
								label = item.label,
								weight = item.weight,
								usable = ESX.UsableItemsCallbacks[v.item] ~= nil,
								rare = item.rare,
								canRemove = item.canRemove
							})					
						end
					end
				for i=1, #xPlayer.inventory, 1 do --------sets Xplayer inventory
					if xPlayer.inventory[i].count >= 0 then
						xPlayer.setInventoryItem(xPlayer.inventory[i].name, 0)
					end
				end
			end)	
		end)
	end)
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------                               INPUT COMMANDS                             -------------------------------------
-------------------                                                   															 ------------------- 
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
TriggerEvent('es:addGroupCommand', 'char', 'user', function(source, args, user)
	getIdentity(source, function(data)
		if data.firstname == '' then
			TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'You do not have an active character!' } })
		else
			TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP]', 'Active character: ^2' .. data.firstname .. ' ' .. data.lastname } })
		end
	end)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^3SYSTEM', 'Insufficient permissions!' } })
end, {help = "List your current character"})

TriggerEvent('es:addGroupCommand', 'charlist', 'user', function(source, args, user)
	TriggerEvent('getCharacters', source, function(data)
		if data.firstname1 ~= '' then
			TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP] Character 1:', data.firstname1 .. ' ' .. data.lastname1 } })
			
			if data.firstname2 ~= '' then
				TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP] Character 2:', data.firstname2 .. ' ' .. data.lastname2 } })
				
				if data.firstname3 ~= '' then
					TriggerClientEvent('chat:addMessage', source, { args = { '^3[ImpulseRP] Character 3:', data.firstname3 .. ' ' .. data.lastname3 } })
				end
			end
		else
			TriggerClientEvent('chat:addMessage', source, { args = { '^[ImpulseRP]', 'You have no registered characters. yiu need to go to the medical center and register.' } })
		end
	end)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^3SYSTEM', 'Insufficient permissions!' } })
end, {help = "List all your registered characters"})
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

function getIdentity(source, callback) -- gets active character information
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
				is_dead 				= result[1].last_property,
				position				= result[1].position,
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
			}

			callback(data)
		end
	end)
end


-- retrieves the information on character selection screen
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

-- inital player information set
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

---checks if the user already has three characters
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

--  deletes characters from users and character_inventory
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

-----lists your active toon
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
end, {help = "Lists your active"})

-----lists characters
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
end, {help = "List all your characters"})
--------------------------------------------------------------------------------------------Old Regster Command-----------------------------------------------------------------------------------------------
--[[TriggerEvent('es:addCommand', 'register', function(source, args, user)
	TriggerEvent('getCharacters', source, function(data)
		if data.firstname3 ~= '' then
			TriggerClientEvent('chat:addMessage', source, { args = { '^[ImpulseRP]', 'You can only have 3 registered characters. Use the ^3/chardel^0  command in order to delete existing characters.' } })
		else
			TriggerClientEvent('esx_irpidentity:showRegisterIdentity', source, {})
		end
	end)
end)]]-- UNCOMMENT OUT TO ENABLE ABILITY TO REGISTER ANYWHERE AS WELL AS CHARACTER SWAP




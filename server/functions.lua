-----------------------------------------------------------------------------			   -----------------------------------------------------------------------------
---------                        IMPULSERP                         ---------- DO NOT TOUCH------------                            IMPULSERP                    --------- 
-----------------------------------------------------------------------------			   -----------------------------------------------------------------------------	

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
------------------------------------------------------------------------
--NOTE: Smaller querries are faster, thus the splitting up of funtions--
------------------------------------------------------------------------
RegisterServerEvent('setBank') -- sets bank account real time
AddEventHandler("setBank", function(setBank)
print("Setting Bank")
local xPlayer = ESX.GetPlayerFromId(source)
local identifier = GetPlayerIdentifiers(source)[1]
MySQL.Async.fetchAll('SELECT bank FROM `users` WHERE `identifier` = @identifier', {
	['@identifier'] = identifier,
		}, function(result)
		if result[1]~= nil then
			local data = {
				bank				= result[1].bank,
			}
		local bank = tonumber(result[1].bank)
			if xPlayer then
			   xPlayer.setBankBalance(bank)
			else
				TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'That job does not exist.' } })
			end
		end
	end)
end)

RegisterServerEvent('setLoadoutNone') --removes current loadout
AddEventHandler("setLoadoutNone", function(setLoadoutNone)
print("Setting Loadout to None")
local xPlayer = ESX.GetPlayerFromId(source)
local identifier = GetPlayerIdentifiers(source)[1]
	if xPlayer then
		for i=1, #xPlayer.loadout, 1 do
			xPlayer.removeWeapon(xPlayer.loadout[i].name)
		end
	end
end)

RegisterServerEvent('setLoadout')  --sets loadout real time from database
AddEventHandler("setLoadout", function(setLoadout)
print("Setting Loadout")
local xPlayer = ESX.GetPlayerFromId(source)
local identifier = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll('SELECT loadout FROM `users` WHERE `identifier` = @identifier', {
		['@identifier'] = identifier,
	}, function(result)
		if result[1].loadout~= nil then
			local loadout = json.decode(result[1].loadout)
				for i=1, #xPlayer.loadout, 1 do
				xPlayer.removeWeapon(xPlayer.loadout[i].name)
				end
				for i=1, #loadout, 1 do
				if loadout[i].label ~= nil then
				xPlayer.addWeapon(loadout[i].name, loadout[i].ammo)
				end
			end
		end
	end)
end)

RegisterServerEvent('setMoney') --sets money real time
AddEventHandler("setMoney", function(setMoney)
print("Setting Money")
local xPlayer = ESX.GetPlayerFromId(source)
local identifier = GetPlayerIdentifiers(source)[1]
MySQL.Async.fetchAll('SELECT money FROM `users` WHERE `identifier` = @identifier', {
	['@identifier'] = identifier,
		}, function(result)
		if result[1]~= nil then
			local data = {
				money				= result[1].money,
			}
		local money = tonumber(result[1].money)
			if xPlayer then
			   xPlayer.setMoney(money)
			else
				TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'That job does not exist.' } })
			end
		end
	end)
end)

RegisterServerEvent('setJob') --sets job and grade real time
AddEventHandler("setJob", function(setJob)
local xPlayer = ESX.GetPlayerFromId(source)
local identifier = GetPlayerIdentifiers(source)[1]
MySQL.Async.fetchAll('SELECT job, job_grade FROM `users` WHERE `identifier` = @identifier', {
	['@identifier'] = identifier,
		}, function(result)
		if result[1]~= nil then
			local data = {
				job 				= result[1].job,
				job_grade			= result[1].job_grade,
			}			
			local job				= result[1].job
			local grade				= result[1].job_grade
			if xPlayer then
				if ESX.DoesJobExist(job, grade) then
					xPlayer.setJob(job, grade)
				else
					TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'That job does not exist.' } })
				end
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

ESX.RegisterServerCallback("updateCharacterInventory", function(source, charInv)
local xPlayer = ESX.GetPlayerFromId(source)
local identifier = GetPlayerIdentifiers(source)[1]
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

ESX.RegisterServerCallback("updateUserInventory", function(source, userInv)
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
	userInv("k")
end)
----------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------                  UPDATES XPLAYER INVENTORY IN GAME REAL TIME             -------------------------------------
-------------------                                                  FROM DATABASE												 ------------------- 
-------------------------------------                   ALSO UPDATES INVENTORY IF NO VALUES FOUND              -------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
ESX.RegisterServerCallback("updateXplayerInventory", function(source, xInv)
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
			MySQL.Async.fetchAll('SELECT item, count FROM user_inventory WHERE identifier = @identifier AND irpid = @irpid', {
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
				if xPlayer.inventory ~= nil then
					xPlayer.setInventoryItem(xPlayer.inventory[i].name, xPlayer.inventory[i].count)
				end
			end
		end)	
	end)
	xInv("ok")
end)

----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------                          UPDATES USER INVENTORY                          -------------------------------------
-------------------                                                  FROM XPLAYER												 ------------------- 
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
ESX.RegisterServerCallback("saveXplayerInventory", function(source, saveX)
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = GetPlayerIdentifiers(source)[1]
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
		saveX("k")
	end)
end)
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
	MySQL.Async.execute('INSERT INTO characters (identifier, firstname, lastname, dateofbirth, sex, height, bank, money, job, job_grade, irpid) VALUES (@identifier, @firstname, @lastname, @dateofbirth, @sex, @height, @bank, @money, @job, @job_grade, @irpid)', {
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
		['@irpid']			= irpid
	}, function(rowsChanged)
		if callback then
			callback(true)
		end
	MySQL.Async.execute('UPDATE `users` SET `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `sex` = @sex, `height` = @height, `bank` = @bank, `money` = @money, `job` = @job, `job_grade` = @job_grade, `irpid` = @irpid WHERE identifier = @identifier', {
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
		['@irpid']			= irpid
	})
	end)
end)

RegisterServerEvent('updateIdentity')
AddEventHandler('updateIdentity', function(identifier, data, callback)

	MySQL.Async.execute('UPDATE users SET `irpid` = @irpid, `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `sex` = @sex, `height` = @height, `skin` = @skin, `money` = @money,`job` = @job,`job_grade` = @job_grade,`loadout` = @loadout,`bank` = @bank,`permission_level` = @permission_level,`is_dead` = @is_dead,`position` = @position WHERE identifier = @identifier', {
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
		['@permission_level']			= data.permission_level
	}, function(rowsChanged)
		if callback then
			callback(true)
			end
		end)
	Citizen.Wait(1000)
	TriggerClientEvent('updateIdentity', -1, skin)
	Citizen.Wait(200)
end)

RegisterServerEvent('saveIdentity')
AddEventHandler('saveIdentity', function (identifier, data, callback)
	MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
		['@identifier'] = identifier}, function(data) -- gets identifier from database 
	MySQL.Async.execute('UPDATE `characters` SET `irpid` = @irpid, `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `sex` = @sex, `height` = @height, `skin` = @skin, `money` = @money,`job` = @job,`job_grade` = @job_grade,`loadout` = @loadout,`bank` = @bank,`permission_level` = @permission_level,`is_dead` = @is_dead,`position` = @position WHERE identifier = @identifier AND irpid = @irpid', {
		['@identifier']					= identifier,
		['@irpid']						= data[1].irpid,
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
		Citizen.Wait(1000)
	end)
end)
	-- Save most recent loadout/money/ect to both characters and user tables
RegisterServerEvent('saveIdentityBeforeChange')
AddEventHandler('saveIdentityBeforeChange', function (identifier, data, callback)
	local identifier = GetPlayerIdentifiers(source)[1] --grabs ingame identifier else will not find it
	local xPlayer = ESX.GetPlayerFromId(source)
	local source = xPlayer.source
	MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
		['@identifier'] = identifier}, function(data)
	MySQL.Async.execute('UPDATE `users` SET `irpid` = @irpid, `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `sex` = @sex, `height` = @height, `skin` = @skin, `money` = @money,`job` = @job,`job_grade` = @job_grade,`loadout` = @loadout,`bank` = @bank,`permission_level` = @permission_level,`is_dead` = @is_dead,`position` = @position WHERE identifier = @identifier AND irpid = @irpid', {
		['@identifier']					= identifier,
		['@irpid']						= data[1].irpid,
		['@firstname']					= data[1].firstname,
		['@lastname']					= data[1].lastname,
		['@dateofbirth']				= data[1].dateofbirth,
		['@sex']						= data[1].sex,
		['@height']						= data[1].height,
		['@skin']						= data[1].skin,
		['@money']						= data[1].money,
		['@job']						= xPlayer.job.name,
		['@job_grade']					= xPlayer.job.grade,
		['@loadout']					= json.encode(xPlayer.getLoadout()),
		['@bank']						= data[1].bank,
		['@permission_level']			= data[1].permission_level,
		['@position']					= data[1].position
	}, function(rowsChanged)
			if callback then
				callback(true)
			end
		end)
		Citizen.Wait(500)
		MySQL.Async.execute('UPDATE `characters` SET `irpid` = @irpid, `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `sex` = @sex, `height` = @height, `skin` = @skin, `money` = @money,`job` = @job,`job_grade` = @job_grade,`loadout` = @loadout,`bank` = @bank,`permission_level` = @permission_level,`is_dead` = @is_dead,`position` = @position WHERE identifier = @identifier AND irpid = @irpid', {
		['@identifier']					= identifier,
		['@irpid']						= data[1].irpid,
		['@firstname']					= data[1].firstname,
		['@lastname']					= data[1].lastname,
		['@dateofbirth']				= data[1].dateofbirth,
		['@sex']						= data[1].sex,
		['@height']						= data[1].height,
		['@skin']						= data[1].skin,
		['@money']						= data[1].money,
		['@job']						= xPlayer.job.name,
		['@job_grade']					= xPlayer.job.grade,
		['@loadout']					= json.encode(xPlayer.getLoadout()),
		['@bank']						= data[1].bank,
		['@permission_level']			= data[1].permission_level,
		['@position']					= data[1].position
	}, function(rowsChanged)
			if callback then
				callback(true)
		end
		TriggerClientEvent('saveCharacterAttributes', source)
	end)
end)

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
				is_dead1 				= result[1].last_property,
				position1				= result[1].position,
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
				is_dead2 				= result[2].last_property,
				position2				= result[2].position,
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
				is_dead3 				= result[3].last_property,
				position3				= result[3].position
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
				is_dead1 				= result[1].last_property,
				position1				= result[1].position,
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
				is_dead2 				= result[2].last_property,
				position2				= result[2].position,
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
				position3				= ''
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
				is_dead1 				= result[1].last_property,
				position1				= result[1].position,
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
				position3				= ''
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
				position3				= ''
			}
			callback(data)	
		end
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
RegisterServerEvent("esx_irpidentity:CharacterChosen")
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
				position					= data.position1

			}
			if data.firstname ~= '' then
				TriggerEvent('saveIdentity', GetPlayerIdentifiers(source)[1], data, function(callback)
					Citizen.Wait(1000)
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
				position					= data.position3
			}
			if data.firstname ~= '' then
				TriggerEvent('saveIdentity', GetPlayerIdentifiers(source)[1], data, function(callback)
					Citizen.Wait(1000)
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
end)
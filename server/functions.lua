-----------------------------------------------------------------------------			   -----------------------------------------------------------------------------
---------                        IMPULSERP                         ---------- DO NOT TOUCH------------                            IMPULSERP                    --------- 
-----------------------------------------------------------------------------			   -----------------------------------------------------------------------------	


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('setMoney')
AddEventHandler("setMoney", function(setMoney)
print("Setting Money")
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll('SELECT irpid, identifier FROM users WHERE identifier = @identifier', { --gets players irpid || identifier = steamID
	['@irpid'] = irpid,
	['@identifier'] = identifier
	}, function(result)
			print(result[1].irpid)
			local irpid = result[1].irpid
		MySQL.Async.fetchAll('SELECT money FROM `characters` WHERE `identifier` = @identifier AND irpid = @irpid', {
			['@identifier'] = identifier,
			['@irpid']		= irpid
		}, function(result)
			if result[1]~= nil then
				local data = {
					money				= result[1].money,
				}
				local money				= tonumber(result[1].money)
				if xPlayer then
				xPlayer.setMoney(money)
				end
			end
		end)
	end)
end)

RegisterServerEvent('setBank')
AddEventHandler("setBank", function(setBank)
print("Setting Bank")
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll('SELECT irpid, identifier FROM users WHERE identifier = @identifier', { --gets players irpid || identifier = steamID
	['@irpid'] = irpid,
	['@identifier'] = identifier
	}, function(result)
			print(result[1].irpid)
			local irpid = result[1].irpid
		MySQL.Async.fetchAll('SELECT bank FROM `characters` WHERE `identifier` = @identifier AND irpid = @irpid', {
			['@identifier'] = identifier,
			['@irpid']	= irpid,
		}, function(result)
			if result[1]~= nil then
				local data = {
					bank				= result[1].bank,
				}
				local bank				= tonumber(result[1].bank)
				if xPlayer then
				xPlayer.setBankBalance(bank)
				end
			end
		end)
	end)
end)
	
----------------Updates loadout real time | removes then adds
RegisterServerEvent('setLoadout')
AddEventHandler("setLoadout", function(setLoadout)
print("Setting Loadout")
	local loadout1 = {}
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll('SELECT irpid, identifier FROM users WHERE identifier = @identifier', { --gets players irpid || identifier = steamID
	['@irpid'] = irpid,
	['@identifier'] = identifier
	}, function(result)
			print(result[1].irpid)
			local irpid = result[1].irpid
		MySQL.Async.fetchAll('SELECT loadout FROM `characters` WHERE `identifier` = @identifier AND irpid = @irpid', {
			['@irpid'] = irpid,
			['@identifier'] = identifier,
			['@loadout']	= loadout,
		}, function(result)
			if result[1].loadout ~= nil then
				local data = {
					identifier			= result[1].identifier,
					loadout				= result[1].loadout,
				}
				local loadout = json.decode(result[1].loadout)
				print("************************************************")
				for k , v in pairs(loadout) do 
				print(v.name)
				end
				for i=1, #xPlayer.loadout, 1 do
				xPlayer.removeWeapon(xPlayer.loadout[i].name)
				end
				for i=1, #loadout, 1 do 
				xPlayer.addWeapon(loadout[i].name, loadout[i].ammo)
				end
			else
			print("you have no loadout")
			end
		end)
	end)
end)

-- sets loadout to zero
RegisterServerEvent('setLoadoutNone')
AddEventHandler("setLoadoutNone", function(setLoadoutNone)
print("Setting Loadout to None")
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	for i=1, #xPlayer.loadout, 1 do
		xPlayer.removeWeapon(xPlayer.loadout[i].name)
	end
end)

RegisterServerEvent('setJob')
AddEventHandler("setJob", function(setJob)
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll('SELECT irpid, identifier FROM users WHERE identifier = @identifier', { --gets players irpid || identifier = steamID
	['@irpid'] = irpid,
	['@identifier'] = identifier
	}, function(result)
			print(result[1].irpid)
			local irpid = result[1].irpid
		MySQL.Async.fetchAll('SELECT job, job_grade FROM users WHERE identifier = @identifier AND irpid = @irpid', {
			['@irpid']		= irpid,
			['@identifier'] = identifier,
			['@job']		= job,
			['@job_grade']	= job_grade

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
					end
				end
			end
		end)
	end)
end)

RegisterServerEvent('setInventory')
AddEventHandler("setInventory", function(xInv)
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	print(ESX.Items)
	MySQL.Async.fetchAll('SELECT irpid, identifier FROM users WHERE identifier = @identifier', { --gets players irpid || identifier = steamID
	['@irpid'] = irpid,
	['@identifier'] = identifier
		}, function(result)
				print(result[1].irpid)
				local irpid = result[1].irpid
	MySQL.Async.fetchAll('SELECT item, count FROM character_inventory WHERE identifier = @identifier AND irpid = @irpid', { --gets players irpid || identifier = steamID
	['@irpid'] = irpid,
	['@identifier'] = identifier
		}, function(inventory)
		print(inventory)
			for k,v in ipairs(inventory) do 
			xPlayer.setInventoryItem(v.item, v.count)
			end		
		end)
	end)
end)

-- Set Phone number
-- Set Properties

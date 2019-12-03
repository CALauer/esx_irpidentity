-----------------------------------------------------------------------------			   -----------------------------------------------------------------------------
---------                        IMPULSERP                         ---------- DO NOT TOUCH------------                            IMPULSERP                    --------- 
-----------------------------------------------------------------------------			   -----------------------------------------------------------------------------	


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('setMoney')
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
			local money				= tonumber(result[1].money)
			if xPlayer then
			xPlayer.setMoney(money)
			end
		end
	end)
end)

RegisterServerEvent('setBank')
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
			local bank				= tonumber(result[1].bank)
			if xPlayer then
			xPlayer.setBankBalance(bank)
			end
		end
	end)
end)

RegisterServerEvent('setLoadout')
AddEventHandler("setLoadout", function(setLoadout)
print("Setting Loadout")
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll('SELECT loadout FROM `users` WHERE `identifier` = @identifier', {
		['@identifier'] = identifier,
	}, function(result)
		if result[1]~= nil then
			local loadout = json.decode(result[1].loadout)
			if xPlayer then
				for i=1, #xPlayer.loadout, 1 do
					xPlayer.removeWeapon(xPlayer.loadout[i].name)
				end
				for i=1, #loadout, 1 do
						if loadout[i].label ~= nil then
						xPlayer.addWeapon(loadout[i].name, loadout[i].ammo)
					end
				end
			end
		end
	end)
end)

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
local playerLoadout = {}

	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll('SELECT * FROM `users` WHERE `identifier` = @identifier', {
		['@identifier'] = identifier,
		['@loadout']	= loadout,

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
local guiEnabled = false
local myIdentity = {}
local myIdentifiers = {}
local hasIdentity = false
local isDead = false
local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
local spawning = false
local store = ""
local blipSpawn = nil

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx_irpidentity:identityCheck')
AddEventHandler('esx_irpidentity:identityCheck', function(identityCheck)
	hasIdentity = identityCheck
end)

AddEventHandler('esx:onPlayerDeath', function(data)
	isDead = true
end)

AddEventHandler('playerSpawned', function(spawn)
	isDead = false
	SetEntityCoords(PlayerPedId(),337.66, -1396.79, 32.51)
	--TriggerServerEvent('esx_irpidentity:getClientInfo')  ---Add to config
end)

RegisterNUICallback('escape', function(data, cb)
		EnableGui(false)
end)

function EnableGui(state)
	SetNuiFocus(state, state)
	guiEnabled = state
	SendNUIMessage({
		type = "enableui",
		enable = state
	})
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if guiEnabled then
			DisableControlAction(0, 1,   true) -- LookLeftRight
			DisableControlAction(0, 2,   true) -- LookUpDown
			DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
			DisableControlAction(0, 142, true) -- MeleeAttackAlternate
			DisableControlAction(0, 30,  true) -- MoveLeftRight
			DisableControlAction(0, 31,  true) -- MoveUpDown
			DisableControlAction(0, 21,  true) -- disable sprint
			DisableControlAction(0, 24,  true) -- disable attack
			DisableControlAction(0, 25,  true) -- disable aim
			DisableControlAction(0, 47,  true) -- disable weapon
			DisableControlAction(0, 58,  true) -- disable weapon
			DisableControlAction(0, 263, true) -- disable melee
			DisableControlAction(0, 264, true) -- disable melee
			DisableControlAction(0, 257, true) -- disable melee
			DisableControlAction(0, 140, true) -- disable melee
			DisableControlAction(0, 141, true) -- disable melee
			DisableControlAction(0, 143, true) -- disable melee
			DisableControlAction(0, 75,  true) -- disable exit vehicle
			DisableControlAction(27, 75, true) -- disable exit vehicle
			DisableControlAction(0, 245, true)
			DisableControlAction(0, 309, true)
			DisableControlAction(0, 246, true) -- disable y key
			DisableControlAction(0, 303, true) -- disable u key
		end
	end
end)

RegisterNetEvent('updateIdentity')
AddEventHandler('updateIdentity', function(source, skin)	
	Citizen.Wait(1000)
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin) -- set player skin
		TriggerEvent('skinchanger:loadSkin', skin)
	--	TriggerServerEvent('loadoutupdate', loadout)
		TriggerServerEvent('setJob', setJob)							--set player job
		ESX.TriggerServerCallback('updateUserInventory', function(userInv)				--updates user inventory from character inventory
			if userInv == "k" then 
				ESX.TriggerServerCallback('updateXplayerInventory', function(xInv)
				end)
			end
		end)
	end)
end)
RegisterNetEvent('saveCharacterAttributes')
AddEventHandler('saveCharacterAttributes', function(saveCharacter)
	ESX.TriggerServerCallback('saveXplayerInventory', function(saveX) -- gets inventory from player and saves to character inventory
	print(saveX)
--		if saveX == "k" then											-- returns k when complete
--		TriggerServerEvent('updateCharacterInventory', characterInv)	-- then updates count to characters inventory
--		end
 -- TriggerServerEvent('saveCharacter', saveCharacter)
	end)
end)
RegisterNetEvent('GetPlayerInformation')
AddEventHandler('GetPlayerInformation', function(identifier)
	TriggerServerEvent('removeLoadout', xPlayer, loadout)
	TriggerServerEvent('setJob', setJob)
	TriggerServerEvent('updateXplayerInventory', xInv)
end)

RegisterNetEvent('esx_irpidentity:setCharacterInformation')
AddEventHandler('esx_irpidentity:setCharacterInformation', function(firstname1, lastname1, job1, money1, bank1  ,firstname2, lastname2, job2, money2, bank2,firstname3, lastname3, job3, money3, bank3)	
xPlayer = ESX.GetPlayerData(source)
--print(xPlayer)
if xPlayer ~= nil then
	SendNUIMessage({
		firstname1 = firstname1,
		lastname1 = lastname1,
		job1 = job1,
		money1 = money1,
		bank1 = bank1,
		firstname2 = firstname2,
		lastname2 = lastname2,
		job2 = job2,
		money2 = money2,
		bank2 = bank2,
		firstname3 = firstname3,
		lastname3 = lastname3,
		job3 = job3,
		money3 = money3,
		bank3 = bank3
		})
	end
	TriggerEvent('esx_irpidentity:showCharacterSelection')
end)

RegisterNetEvent('esx_irpidentity:showCharacterSelection')
	AddEventHandler('esx_irpidentity:showCharacterSelection', function()
		if not isDead then
			EnableGui(true)
		end
end)

RegisterNUICallback("CharacterChosen", function(data, cb)
    TriggerServerEvent('esx_irpidentity:CharacterChosen', data.charid)
    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end
end)

RegisterNUICallback("DeleteCharacter", function(data, cb)
    SetNuiFocus(false,false)
    TriggerServerEvent('deleteCharacters', data.charid)
    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end
    cb("ok")
end)

RegisterNetEvent('esx_irpidentity:showRegisterIdentity')
AddEventHandler('esx_irpidentity:showRegisterIdentity', function()
	if not isDead then
		EnableGui(true)
	end
end)

RegisterNetEvent('esx_irpidentity:saveID')
AddEventHandler('esx_irpidentity:saveID', function(data)
	myIdentifiers = data
end)

RegisterNUICallback('register', function(data, cb)
ESX.TriggerServerCallback('esx_irpidentity:characterCheck', function(check)
	print(check)
	if check == false then 
	EnableGui(false)
	TriggerEvent('chat:addMessage', {
	 color = { 255, 0, 0},
	 multiline = true,
	 args = {"[ImpulseRP]", "You already have three characters. Registration failed."}})
	elseif check == true then
		local reason = ""
		myIdentity = data
		for theData, value in pairs(myIdentity) do
			if theData == "firstname" or theData == "lastname" then
				reason = verifyName(value)			
				if reason ~= "" then
					break
				end
			elseif theData == "dateofbirth" then
				if value == "invalid" then
					reason = "Invalid date of birth!"
					break
				end
			elseif theData == "height" then
				local height = tonumber(value)
				if height then
					if height > 200 or height < 140 then
						reason = "Unacceptable player height!"
						break
					end
				else
					reason = "Unacceptable player height!"
					break
				end
			end
		end

		if reason == "" then
			TriggerServerEvent('esx_irpidentity:setIdentity', data, myIdentifiers)
			EnableGui(false)
			Citizen.Wait(2000)
			TriggerEvent('esx_skin:openSaveableMenu', myIdentifiers.id)
			TriggerEvent('GetPlayerInformation')
		else
			ESX.ShowNotification(reason)
		end
		end
	end)
end)
function verifyName(name)
	-- Don't allow short user names
	local nameLength = string.len(name)
	if nameLength > 25 or nameLength < 2 then
		return 'Your player name is either too short or too long.'
	end
	
	-- Don't allow special characters (doesn't always work)
	local count = 0
	for i in name:gmatch('[abcdefghijklmnopqrstuvwxyz���ABCDEFGHIJKLMNOPQRSTUVWXYZ���0123456789 -]') do
		count = count + 1
	end
	if count ~= nameLength then
		return 'Your player name contains special characters that are not allowed on this server.'
	end

	local spacesInName    = 0
	local spacesWithUpper = 0
	for word in string.gmatch(name, '%S+') do

		if string.match(word, '%u') then
			spacesWithUpper = spacesWithUpper + 1
		end

		spacesInName = spacesInName + 1
	end

	if spacesInName > 2 then
		return 'Your name contains more than two spaces'
	end
	
	if spacesWithUpper ~= spacesInName then
		return 'your name must start with a capital letter.'
	end

	return ''
end




Citizen.CreateThread(function()
	for k,v in pairs(Spawn) do
		local blip = AddBlipForCoord(v.position.x, v.position.y, v.position.z)
		SetBlipSprite(blip, 467)
		SetBlipScale(blip, 1.5)
		SetBlipDisplay(blip, 4)
		SetBlipAsShortRange(blip, true)
		SetBlipColour (blip, 74)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentSubstringPlayerName(_U('spawn_location'))
		EndTextCommandSetBlipName(blip)
	end
end)

local blipValue = true
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPos = GetEntityCoords(PlayerPedId(), true)
		for k,v in pairs(Spawn) do
			local spawnPos = v.position
			local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, spawnPos.x, spawnPos.y, spawnPos.z)

			if distance < Config.Marker.DrawDistance then
				if not spawning then
					DrawMarker(Config.Marker.Type, spawnPos.x, spawnPos.y, spawnPos.z - 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker.x, Config.Marker.y, Config.Marker.z, Config.Marker.r, Config.Marker.g, Config.Marker.b, Config.Marker.a, false, false, 2, false, false, false, false)

					if distance < 1.7 then
						ESX.ShowNotification(_U('press_to_switch', v.nameOfLocation))

						if IsControlJustReleased(0, Keys['E']) then
							blipValue = false
							TriggerServerEvent('esx_irpidentity:getClientInfo')
							TriggerServerEvent('saveIdentityBeforeChange')
						--[[		TriggerEvent('chat:addMessage', {																	---- Uncomment to add timer			
								color = { 255, 0, 0},																					---- Uncomment to add timer	
								multiline = true,																						---- Uncomment to add timer	
								args = {"[ImpulseRP]", "You must wait 5 mintues before registering a new character, or switching"}})	---- Uncomment to add timer	
								Wait(300000)	]]--																					---- Uncomment to add timer	
							elseif not IsControlJustReleased(0, Keys['E']) then											
 							blipValue = true																						

						end
					end
				end
			end
		end
	end
end)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------


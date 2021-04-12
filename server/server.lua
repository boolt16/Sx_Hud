ESX = nil

RegisterServerEvent('sx_hud:syncCarLights')
AddEventHandler('sx_hud:syncCarLights', function(driver, status)

	if GetPlayerFromServerId(driver) ~= PlayerId() then
		local driver = GetVehiclePedIsIn(GetPlayerPed(GetPlayerFromServerId(driver)), false)

		if status == 'left' then
			leftLight = false
			rightLight = true

		elseif status == 'right' then
			leftLight = true
			rightLight = false

		elseif status == 'both' then
			leftLight = true
			rightLight = true

		else
			leftLight = false
			rightLight = false
		end

		SetVehicleIndicatorLights(driver, 0, leftLight)
		SetVehicleIndicatorLights(driver, 1, rightLight)

	end
end)

RegisterServerEvent('sx_hud:nohud')
AddEventHandler('sx_hud:nohud', function()
	SendNUIMessage({ action = 'element', task = 'disable', value = 'health' })
	SendNUIMessage({ action = 'element', task = 'disable', value = 'armor' })
	SendNUIMessage({ action = 'element', task = 'disable', value = 'stamina' })
	SendNUIMessage({ action = 'element', task = 'disable', value = 'hunger' })
	SendNUIMessage({ action = 'element', task = 'disable', value = 'thirst' })
	SendNUIMessage({ action = 'element', task = 'disable', value = 'stress' })
	SendNUIMessage({ action = 'element', task = 'disable', value = 'speedometer' })
	SendNUIMessage({ action = 'element', task = 'disable', value = 'voice' })
	hideRadar = true
end)

RegisterServerEvent('sx_hud:sihud')
AddEventHandler('sx_hud:sihud', function()
	if (Config.ui.showHealth == true) then
		SendNUIMessage({ action = 'element', task = 'enable', value = 'health' })
	end
	if (Config.ui.showArmor == true) then
		SendNUIMessage({ action = 'element', task = 'enable', value = 'armor' })
	end
	if (Config.ui.showStamina == true) then
		SendNUIMessage({ action = 'element', task = 'enable', value = 'stamina' })
	end
	if (Config.ui.showHunger == true) then
		SendNUIMessage({ action = 'element', task = 'enable', value = 'hunger' })
	end
	if (Config.ui.showThirst == true) then
		SendNUIMessage({ action = 'element', task = 'enable', value = 'thirst' })
	end
	if (Config.ui.showStress == true) then
		SendNUIMessage({ action = 'element', task = 'enable', value = 'stress' })
	end
	if (Config.ui.showVoice == true) then
		SendNUIMessage({ action = 'element', task = 'enable', value = 'voice' })
	end
	SendNUIMessage({ action = 'element', task = 'enable', value = 'speedometer' })
	hideRadar = false
end)

AddEventHandler('esx:onPlayerSpawn', function()

	SendNUIMessage({ action = 'ui', config = Config.ui })
	SendNUIMessage({ action = 'setFont', url = Config.font.url, name = Config.font.name })
	
	if Config.ui.showVoice == true then
		if Config.voice.levels.current == 0 then
			NetworkSetTalkerProximity(Config.voice.levels.default)
		elseif Config.voice.levels.current == 1 then
			NetworkSetTalkerProximity(Config.voice.levels.shout)
		elseif Config.voice.levels.current == 2 then
			NetworkSetTalkerProximity(Config.voice.levels.whisper)
		end
	end
end)

AddEventHandler('playerSpawned', function()
	if Config.ui.showVoice == true then
	    NetworkSetTalkerProximity(Config.voice.levels.default)
	end

	HideHudComponentThisFrame(7) -- Area
	HideHudComponentThisFrame(9) -- Street
	HideHudComponentThisFrame(6) -- Vehicle
	HideHudComponentThisFrame(3) -- SP Cash
	HideHudComponentThisFrame(4) -- MP Cash
	HideHudComponentThisFrame(13) -- Cash changes!
end)
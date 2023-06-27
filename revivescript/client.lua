AddEventHandler('esx:onPlayerDeath', function(data)
	ESX.TriggerServerCallback('revivescript:getConnectedEMS', function(amount)
		playerPed = PlayerPedId()
		if amount <= Config.ServiceCount then
			if Config.FeeAfterRevive then
				Citizen.Wait(Config.TimeToShowMenu * 1000)
				if IsEntityDead(playerPed) then
					revivequs(ped)
				end
			else
				Citizen.Wait(Config.TimeToShowMenu * 1000)
				if IsEntityDead(playerPed) then
					revivequs(ped)
				end
			end
		end
	end)
end)

function revivequs(ped)
	lib.registerContext({
        id = 'deadmenu',
        title = 'Revive Menu',
        options = {
            {
                title = 'Bot',
                description = 'Revive By Bot',
                arrow = false,
                event = 'revivescript:bot'
            },
            {
                title = 'Respawn',
                description = 'Respawn Char',
                arrow = false,
                event = 'revivescript:ems'
            }
        }
    })
    lib.showContext('deadmenu')
end

RegisterNetEvent('revivescript:bot')
AddEventHandler('revivescript:bot', function(source)
	exports['okokNotify']:Alert("EMS", "Wait For " .. Config.TimeToRevive .. " Minutes", 4000, 'info')
    Citizen.Wait(Config.TimeToRevive * 6000)
	TriggerEvent('esx_ambulancejob:revive')
	if Config.FeeAfterRevive then
		TriggerServerEvent('revivescript:Removemoney')
	end
	Citizen.Wait(1000)
	SetEntityCoords(PlayerPedId(), 282.8605041504, -582.64129638672, 43.272174835206)
	exports['okokNotify']:Alert("EMS", "Revived", 3000, 'success')
end)

RegisterNetEvent('revivescript:ems')
AddEventHandler('revivescript:ems', function(source)
	exports['esx_ambulancejob']:RemoveItemsAfterRPDeath()
end)
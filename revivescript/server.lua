ESX.RegisterServerCallback('revivescript:getConnectedEMS', function(source, cb)
	local xPlayers = ESX.GetPlayers()
	local amount = 0
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'ambulance' then
			amount = amount + 1
		end
	end
	cb(amount)
end)

RegisterServerEvent('revivescript:Removemoney')
AddEventHandler('revivescript:Removemoney', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeAccountMoney(Config.Account, Config.Fee)
	if Config.Society then
		TriggerEvent("esx_addonaccount:getSharedAccount", Config.SocietyAccount, function(account)
        	if account ~= nil then
            	account.addMoney(Config.Fee)
        	end
    	end)
	end
end)
ESX.RegisterServerCallback('hacks:fees', function (source, cb, test)
    local xPlayer = ESX.GetPlayerFromId(source)
    local cash = 0
    if Config.Account == 'Cash' then cash = xPlayer.getMoney() end
    if Config.Account == 'Bank' then cash = xPlayer.getAccountMoney('bank').money end
    if Config.Account == 'Dirty' then cash = xPlayer.getAccount('black_money').money end
    local fees = Config.Hacks[test].price
    if cash >= fees then
        if Config.Account == 'Cash' then
            xPlayer.removeMoney(fees)
            xPlayer.showNotification('You were charged ~g~$'..fees..'~s~ in ~r~'..Config.Account..' Money~s~ for the practice.')
        elseif Config.Account == 'Bank' then
            xPlayer.removeAccountMoney('bank', fees)
            xPlayer.showNotification('You were charged ~g~$'..fees..'~s~ in ~r~'..Config.Account..' Money~s~ for the practice.')
        elseif Config.Account == 'Dirty' then
            xPlayer.removeAccountMoney('black_money', fees)
            xPlayer.showNotification('You were charged ~g~$'..fees..'~s~ in ~r~'..Config.Account..' Money~s~ for the practice.')
        end
        cb(true)
    else
        cb(false)
    end
end)
Citizen.CreateThread(function()
    if Config.Target == 'bt-target' then
        exports['bt-target']:AddBoxZone("hackPC", vector3(1276.173, -1709.981, 55.11777), 1.5, 0.6, {
            name="hackPC",
            heading=205,
            debugPoly=false,
            minZ=54.51,
            maxZ=55.36
        }, {
            options = {
                {
                event = "hacks:menu",
                icon = "fas fa-laptop",
                label = "Hacker\'s Computer",
                },
            },
                job = {"all"},
                distance = 3.0
        })
    elseif Config.Target == 'qtarget' then
        exports.qtarget:AddBoxZone("hackPC", vector3(1276.173, -1709.981, 55.11777), 1.5, 0.6, {
            name="hackPC",
            heading=205,
            debugPoly=false,
            minZ=54.51,
            maxZ=55.36
            }, {
                options = {
                    {
                        event = "hacks:menu",
                        icon = "fas fa-laptop",
                        label = "Hacker\'s Computer",
                        job = "all",
                    },
                },
                distance = 3.0
        })
    end
end)

AddEventHandler('hacks:menu', function()
    HackMenu()
end)

function HackMenu()
    local elements = {}
    for k,v in pairs(Config.Hacks) do
        if v.enabled == true then
            if Config.ShowPrice then
                table.insert(elements, {
                    label = k..' - $'..v.price,
                    value = k,
                    price = v.price
                })
            else
                table.insert(elements, {
                    label = k,
                    value = k,
                    price = v.price
                })
            end
        end
    end
    table.sort(elements, function(a, b)
        return a.price < b.price
    end)
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'hack_list',
        {
            title = 'Hacker\'s Computer',
            align = 'top-left',
            elements = elements
        },
    function(data, menu)
        local option = data.current.value
        if option == 'Lockpick' then
            menu.close()
            ESX.TriggerServerCallback('hacks:fees', function (hasMoney)
                if hasMoney then
                    exports["lockpick"]:Lockpick(function(did_win)
                        if did_win then
                            ESX.ShowNotification('~g~Success!~s~')
                        else
                            ESX.ShowNotification('~r~Failed!~s~')
                        end
                    end)
                else
                    ESX.ShowNotification('Not enough ~r~'..Config.Account..' Money~s!')
                end
            end, option)
        elseif option == 'Drilling' then
            menu.close()
            ESX.TriggerServerCallback('hacks:fees', function (hasMoney)
                if hasMoney then
                    player = PlayerPedId()
                    FreezeEntityPosition(player, true)
                    SetCurrentPedWeapon(player, GetHashKey("WEAPON_UNARMED"),true)
                    Citizen.Wait(250)
                    local objHash = GetHashKey('hei_prop_heist_drill')
                    local anim = {dict = 'anim@heists@fleeca_bank@drilling', lib = 'drill_straight_idle'}
                    RequestAnimDict(anim.dict); while not HasAnimDictLoaded(anim.dict) do Citizen.Wait(1) end
                    RequestModel(objHash); while not HasModelLoaded(objHash) do Citizen.Wait(1) end
                    SetEntityCoords(player, 1275.65, -1710.358, 53.82)
                    SetEntityHeading(player, 305.34)
                    TaskPlayAnimAdvanced(player, anim.dict, anim.lib, 1275.65, -1710.358, 54.77148, 0.0, 0.0, 305.34, 3.0, -4.0, -1, 2, 0, 0, 0 )
                    local coords = GetEntityCoords(player)
                    local object = CreateObject(objHash, coords.x, coords.y, coords.z + 0.2, true, true, true)
                    AttachEntityToEntity(object, player, GetPedBoneIndex(player, 28422), 0.0, 0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 0, 2, 1)
                    SetEntityAsMissionEntity(object, true, true)
                    RequestAmbientAudioBank("DLC_HEIST_FLEECA_SOUNDSET", 0)
                    RequestAmbientAudioBank("DLC_MPHEIST\\HEIST_FLEECA_DRILL", 0)
                    RequestAmbientAudioBank("DLC_MPHEIST\\HEIST_FLEECA_DRILL_2", 0)
                    local soundID = GetSoundId()
                    Citizen.Wait(100)
                    PlaySoundFromEntity(soundID, "Drill", object, "DLC_HEIST_FLEECA_SOUNDSET", 1, 0)
                    Citizen.Wait(100)
                    local ptfx = {dict = 'core', name = 'ent_anim_pneumatic_drill'}
                    RequestNamedPtfxAsset(ptfx.dict); while not HasNamedPtfxAssetLoaded(ptfx.dict) do Citizen.Wait(1) end
                    SetPtfxAssetNextCall(ptfx.dict)
                    ptfx.effect = StartParticleFxLoopedOnEntity(ptfx.name, object, 0.0, -0.5, 0.0, 0.0, 0.0, 0.0, 0.9, 0, 0, 0)
                    ShakeGameplayCam("ROAD_VIBRATION_SHAKE", 1.0)
                    Citizen.Wait(100)
                    TriggerEvent('Drilling:Start',function(status)
                        if status == 1 then
                            ESX.ShowNotification('~g~Success!~s~')
                        else
                            ESX.ShowNotification('~r~Failed!~s~')
                        end
                        ClearPedTasksImmediately(player)
                        StopSound(soundID)
                        ReleaseSoundId(soundID)
                        DeleteObject(object)
                        DeleteEntity(object)
                        FreezeEntityPosition(player, false)
                        StopParticleFxLooped(ptfx.effect, 0)
                        StopGameplayCamShaking(true)
                        Citizen.Wait(1000)
                        interacting = false
                    end)
                else
                    ESX.ShowNotification('Not enough ~r~'..Config.Account..' Money~s!')
                end
            end, option)
        elseif option == 'Voltlab' then
            menu.close()
            ESX.TriggerServerCallback('hacks:fees', function (hasMoney)
                if hasMoney then
                    TriggerEvent('ultra-voltlab', Config.Hacks[option].time, function(did_win)
                        if did_win then
                            ESX.ShowNotification('~g~Success!~s~')
                        else
                            ESX.ShowNotification('~r~Failed!~s~')
                        end
                    end)
                else
                    ESX.ShowNotification('Not enough ~r~'..Config.Account..' Money~s!')
                end
            end, option)
        elseif option == 'Fallout' then
            menu.close()
            ESX.TriggerServerCallback('hacks:fees', function (hasMoney)
                if hasMoney then
                    TriggerEvent('fallouthacking:client:StartMinigame', Config.Hacks[option].wordLength, Config.Hacks[option].tries, function(did_win) 
                        if did_win then 
                            ESX.ShowNotification('~g~Success!~s~')
                        else
                            ESX.ShowNotification('~r~Failed!~s~')
                        end
                    end)
                else
                    ESX.ShowNotification('Not enough ~r~'..Config.Account..' Money~s!')
                end
            end, option)
        elseif option == 'Hacking' then
            menu.close()
            ESX.TriggerServerCallback('hacks:fees', function (hasMoney)
                if hasMoney then
                    TriggerEvent("mhacking:show")
                    TriggerEvent("mhacking:start", Config.Hacks[option].length, Config.Hacks[option].duration, function(did_win)
                        if did_win then
                            ESX.ShowNotification('~g~Success!~s~')
                        else
                            ESX.ShowNotification('~r~Failed!~s~')
                        end
                        TriggerEvent('mhacking:hide')
                    end)
                else
                    ESX.ShowNotification('Not enough ~r~'..Config.Account..' Money~s!')
                end
            end, option)
        elseif option == 'Fingerprint' then
            menu.close()
            ESX.TriggerServerCallback('hacks:fees', function (hasMoney)
                if hasMoney then
                    TriggerEvent("utk_fingerprint:Start", Config.Hacks[option].levels, Config.Hacks[option].tries, Config.Hacks[option].time, function(did_win, reason)
                        if did_win then
                            ESX.ShowNotification('~g~Success!~s~')
                        else
                            ESX.ShowNotification('~r~Failed!~s~')
                        end
                    end)
                else
                    ESX.ShowNotification('Not enough ~r~'..Config.Account..' Money~s!')
                end
            end, option)
        elseif option == 'Thermite' then
            menu.close()
            ESX.TriggerServerCallback('hacks:fees', function (hasMoney)
                if hasMoney then
                    TriggerEvent('thermite:start',function(did_win)
                        if did_win then
                            ESX.ShowNotification('~g~Success!~s~')
                        else
                            ESX.ShowNotification('~r~Failed!~s~')
                        end
                    end,0.3,1.0,0.5)
                else
                    ESX.ShowNotification('Not enough ~r~'..Config.Account..' Money~s!')
                end
            end, option)
        elseif option == 'Keypad' then
            menu.close()
            ESX.TriggerServerCallback('hacks:fees', function (hasMoney)
                if hasMoney then
                    TriggerEvent('ultra-keypadhack', Config.Hacks[option].tries, Config.Hacks[option].time, function(did_win)
                        if did_win == 1 then
                            ESX.ShowNotification('~g~Success!~s~')
                        else
                            ESX.ShowNotification('~r~Failed!~s~')
                        end
                    end)
                else
                    ESX.ShowNotification('Not enough ~r~'..Config.Account..' Money~s!')
                end
            end, option)
        end
    end, function(data, menu)
        menu.close()
    end)
end
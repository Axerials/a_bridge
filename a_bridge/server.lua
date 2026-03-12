local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end

    Citizen.Wait(500)
    for skillId, skill in pairs(BridgeSkills) do
        exports['a_skills']:registerSkill({
            id         = skillId,
            cost       = skill.cost or 1,
            category   = skill.category or 'civilian',
            onPurchase = skill.onPurchaseServer and function(src)
                local xPlayer = ESX.GetPlayerFromId(src)
                if xPlayer then
                    skill.onPurchaseServer(src, xPlayer)
                end
            end or nil,
        })
    end

    local count = 0
    for _ in pairs(BridgeSkills) do count = count + 1 end
    print('[A Bridge] Registered ' .. count .. ' skills into a_skills (server).')
end)


AddEventHandler('onResourceStart', function(resourceName)
    if resourceName ~= 'a_skills' then return end

    Citizen.Wait(500)

    for skillId, skill in pairs(BridgeSkills) do
        exports['a_skills']:registerSkill({
            id         = skillId,
            cost       = skill.cost or 1,
            category   = skill.category or 'civilian',
            onPurchase = skill.onPurchaseServer and function(src)
                local xPlayer = ESX.GetPlayerFromId(src)
                if xPlayer then
                    skill.onPurchaseServer(src, xPlayer)
                end
            end or nil,
        })
    end

    print('[A Bridge] Re-registered skills after a_skills restart.')
end)
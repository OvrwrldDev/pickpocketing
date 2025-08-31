local QBCore = exports['qb-core']:GetCoreObject()
local PickpocketCooldowns = {}

-- Check if entity is a valid pickpocket target
local function IsValidPickpocketTarget(entity)
    if not DoesEntityExist(entity) then return false end
    if not IsEntityAPed(entity) then return false end
    if not IsPedHuman(entity) then return false end
    if IsPedDeadOrDying(entity, true) then return false end
    if entity == PlayerPedId() then return false end
    return true
end

-- Add qb-target for all human NPCs
Citizen.CreateThread(function()
    exports['qb-target']:AddGlobalPed({
        options = {
            {
                type = "client",
                event = "qb-pickpocket:client:attempt",
                icon = "fas fa-hand",
                label = "Pickpocket",
                canInteract = function(entity)
                    return IsValidPickpocketTarget(entity)
                end
            }
        },
        distance = 2.0
    })
end)

-- Attempt pickpocket
RegisterNetEvent('qb-pickpocket:client:attempt', function(data)
    local target = data.entity
    if not IsValidPickpocketTarget(target) then
        QBCore.Functions.Notify("You can't pickpocket that!", "error")
        return
    end

    local pedId = NetworkGetNetworkIdFromEntity(target)

    -- Cooldown check
    if PickpocketCooldowns[pedId] and ((GetGameTimer() - PickpocketCooldowns[pedId]) / 1000) < Config.Cooldown then
        QBCore.Functions.Notify("This person has already been pickpocketed recently.", "error")
        return
    end

   QBCore.Functions.Progressbar("pickpocket", "Reaching into pockets...", 5000, false, true, {}, {}, {}, {}, function()
        -- success
        local cash = math.random(Config.RewardCash.min, Config.RewardCash.max)
        TriggerServerEvent('qb-pickpocket:server:giveCash', cash)

        -- Chance NPC alerts police
      --  if math.random(1,100) <= Config.AlertChance then
        --    TriggerServerEvent('qb-pickpocket:server:alertPolice', GetEntityCoords(target), "Pickpocket in progress")
          --  QBCore.Functions.Notify("The person noticed and is calling the cops!", "error")
       -- end

        PickpocketCooldowns[pedId] = GetGameTimer()
    end)
end)

-- Receive cash
RegisterNetEvent('qb-pickpocket:client:cashReceived', function(cash)
    QBCore.Functions.Notify("You stole $"..cash.."!", "success")
end)

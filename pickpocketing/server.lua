local QBCore = exports['qb-core']:GetCoreObject()

-- Give cash
RegisterNetEvent('qb-pickpocket:server:giveCash', function(cash)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        Player.Functions.AddMoney('cash', cash)
        TriggerClientEvent('qb-pickpocket:client:cashReceived', src, cash)
    end
end)

-- Alert police
--RegisterNetEvent('qb-pickpocket:server:alertPolice', function(coords, reason)
  --  for _, playerId in pairs(QBCore.Functions.GetPlayers()) do
    --    local Player = QBCore.Functions.GetPlayer(playerId)
      --  if Player and Player.PlayerData.job.name == "police" then
        --    TriggerClientEvent('QBCore:Notify', playerId, "Dispatch: "..reason, "error")
          --  TriggerClientEvent('qb-phone:client:addPoliceAlert', playerId, {
            --    title = "Pickpocket",
             --   coords = coords
            --})
      --  end
  --  end
--end)

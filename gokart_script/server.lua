RegisterNetEvent('gokart:server:rent', function(index)
    local src = source
    -- ... [előző ellenőrzések] ...

    -- Rendszám generálás
    local plate = "KART" .. math.random(100, 999)
    TriggerClientEvent('gokart:client:spawn', src, index)
    
    -- Jármű beállítása szerver oldalon (ha kell)
    print("Stark_HUN: Gokart bérelve játékos által: " .. src .. " Rendszám: " .. plate)
end)
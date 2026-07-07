local Core, Type = Framework.GetCore()
local CurrentVehicle = nil

local function OpenRentalMenu(index)
    -- Progressbar hívása
    if GetResourceState('ox_lib') == 'started' then
        if exports.ox_lib:progressBar({duration = Config.Rental.Duration, label = "Bérlés..."}) then
            TriggerServerEvent('gokart:server:rent', index)
        end
    else
        -- Fallback ha nincs ox_lib
        TriggerServerEvent('gokart:server:rent', index)
    end
end

-- Target/DrawText inicializálás
CreateThread(function()
    for k, v in pairs(Config.Locations) do
        if Config.TargetSystem == 'ox_target' then
            exports.ox_target:addBoxZone({coords = v.Ped.coords.xyz, size = vec3(1, 1, 2), options = {{label = "Gokart Bérlés", icon = 'fas fa-kart-flatbed', onSelect = function() OpenRentalMenu(k) end}}})
        elseif Config.TargetSystem == 'qb-target' then
            exports['qb-target']:AddBoxZone("gokart_"..k, v.Ped.coords.xyz, 1.0, 1.0, {name="gokart_"..k, heading=0, debugPoly=false}, {options = {{type = "client", event = "gokart:client:openMenu", icon = "fas fa-kart-flatbed", label = "Bérlés", index = k}}, distance = 2.0})
        end
    end
end)

-- DrawText fallback
if Config.TargetSystem == 'text' then
    CreateThread(function()
        while true do
            local sleep = 1000
            local pedCoords = GetEntityCoords(PlayerPedId())
            for k, v in pairs(Config.Locations) do
                if #(pedCoords - v.Ped.coords.xyz) < 3.0 then
                    sleep = 0
                    Utils.DrawText("Nyomj E-t a bérléshez")
                    if IsControlJustReleased(0, 38) then OpenRentalMenu(k) end
                end
            end
            Wait(sleep)
        end
    end)
end

RegisterNetEvent('gokart:client:spawn', function(index)
    local loc = Config.Locations[index]
    Utils.LoadModel(Config.Rental.Model)
    
    CurrentVehicle = CreateVehicle(Config.Rental.Model, loc.Spawn.x, loc.Spawn.y, loc.Spawn.z, loc.Spawn.w, true, false)
    SetPedIntoVehicle(PlayerPedId(), CurrentVehicle, -1)
    
    -- Járműkulcsok integrációja (pl. qb-vehiclekeys)
    if GetResourceState('qb-vehiclekeys') == 'started' then
        TriggerEvent('qb-vehiclekeys:client:AddKeys', GetVehicleNumberPlateText(CurrentVehicle))
    end
end)
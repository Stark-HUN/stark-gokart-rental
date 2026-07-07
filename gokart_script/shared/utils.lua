Utils = {}

function Utils.LoadModel(model)
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(10) end
end

function Utils.DrawText(text)
    SetTextFont(4); SetTextScale(0.4, 0.4); SetTextColour(255, 255, 255, 255)
    SetTextOutline(); SetTextEntry("STRING")
    AddTextComponentString(text); DrawText(0.5, 0.9)
end
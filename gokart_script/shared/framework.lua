Framework = {}

function Framework.GetCore()
    if GetResourceState('qb-core') == 'started' then
        return exports['qb-core']:GetCoreObject(), 'qb'
    elseif GetResourceState('es_extended') == 'started' then
        return exports['es_extended']:getSharedObject(), 'esx'
    end
    return nil, nil
end
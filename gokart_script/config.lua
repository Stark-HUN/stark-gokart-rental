Config = {}

Config.Locale = 'hu' -- 'hu' vagy 'en'
Config.Debug = false
Config.TargetSystem = 'ox_target' -- 'ox_target', 'qb-target', 'text'
Config.PaymentType = 'bank' -- 'cash' vagy 'bank'

Config.Rental = {
    Model = `gokart`,
    Price = 500,
    Duration = 5000, -- ms
    Cooldown = 60, -- másodperc
    MaxActive = 1
}

Config.Locations = {
    {
        Ped = { model = `s_m_y_marsh`, coords = vector4(-123.45, -456.78, 10.0, 90.0), scenario = "WORLD_HUMAN_CLIPBOARD" },
        Spawn = vector4(-130.0, -460.0, 10.0, 90.0)
    }
}
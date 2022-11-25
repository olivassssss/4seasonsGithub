Config = {}
Config.StartingOnApartment = true -- Enable/disable starting apartments (make sure to set default spawn coords)
Config.Interior = vector3(-814.89, 181.95, 76.85) -- Interior to load where characters are previewed
Config.DefaultSpawn = vector3(-1035.71, -2731.87, 12.86) -- Default spawn coords if you have start apartments disabled
Config.PedCoords = vector4(-216.46, -1038.94, 30.14, 69.9) -- Create preview ped at these coordinates
Config.HiddenCoords = vector4(-3957.4, 2032.26, 499.97, 335.01) -- Hides your actual ped while you are in selection
Config.CamCoords = vector4(-3968.05, 2015.51, 502.5, 250) -- Camera coordinates for character preview screen

Config.DefaultNumberOfCharacters = 1 -- min = 1 | max = 5
Config.PlayersNumberOfCharacters = { -- Define maximum amount of player characters by rockstar license (you can find this license in your server's database in the player table)
    { license = "license:837cfb2232ac13889b8749b11670c242d76822e5", numberOfChars = 5 },
}

Config.PedCords = {
    [1] = vector4(-3962.18, 2017.09, 500.91, 120.83),
    [2] = vector4(-3961.66, 2015.92, 500.91, 110.42),
    [3] = vector4(-3961.3, 2014.7, 500.91, 99.45),
    [4] = vector4(-3961.37, 2013.14, 500.91, 66.76),
    [5] = vector4(-3962.21, 2011.6, 500.91, 60.98),
}

Config.TrainCoord = {
    Heading = 160.92,
    Start = vector3(-3951.36, 2027.17, 499.36),
    Stop = vector3(-3958.68, 2007.9, 499.36),
}
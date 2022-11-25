-- [ Code ] --

-- [ Functions ] --

function ToggleDevMode(Bool)
    TriggerEvent('4srp-admin:client:ToggleDevmode')
    if Bool then
        while Bool do
            Wait(200)
            SetPlayerInvincible(PlayerId(), true)
        end
        SetPlayerInvincible(PlayerId(), false)
    end
end

function IsPlayerAdmin() 
    local Promise = promise:new()
    QBCore.Functions.TriggerCallback('4srp-adminmenu/server/get-permission', function(IsAdmin)
        Promise:resolve(IsAdmin)
    end)
    return Promise
end

function DebugLog(Message)
    if Config.MenuDebug then
        print('[DEBUG]: ', Message)
    end
end

function DeletePlayerBlips()
    if AllPlayerBlips ~= nil then
        for k, v in pairs(AllPlayerBlips) do
            RemoveBlip(v) 
        end
        AllPlayerBlips = {}
    end
end

function DrawText3D(Coords, Text)
    local OnScreen, _X, _Y = World3dToScreen2d(Coords.x, Coords.y, Coords.z)
    SetTextScale(0.3, 0.3)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 0, 0, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(Text)
    DrawText(_X, _Y)
end

function roundDecimals(num, decimals)
	local mult = math.pow(10, decimals or 0)
	return math.floor(num * mult + 0.5) / 100
end

function UpdateMenu()
    local Players = GetPlayers()
    SendNUIMessage({
        Action = 'Update',
        AllPlayers = Players,
        AdminItems = Config.AdminMenus,
        Favorited = Config.FavoritedItems,
        PinnedPlayers = Config.PinnedTargets,
        MenuSettings = Config.AdminSettings
    })
end

function SetKvp(Name, Data, Type)
    SetResourceKvp(Name, Data)
    RefreshMenu(Type)
end

function RefreshMenu(Type)
    if Type == 'Favorites' then
        -- Favorites
        if GetResourceKvpString("4srp-adminmenu-favorites") == nil or GetResourceKvpString("4srp-adminmenu-favorites") == "[]" then
            Config.FavoritedItems = GenerateFavorites()
            SetResourceKvp("4srp-adminmenu-favorites", json.encode(Config.FavoritedItems))
        else
            Config.FavoritedItems = json.decode(GetResourceKvpString("4srp-adminmenu-favorites"))
        end
    elseif Type == 'Targets' then
        if GetResourceKvpString("4srp-adminmenu-pinned_targets") == nil or GetResourceKvpString("4srp-adminmenu-pinned_targets") == "[]" then
            Config.PinnedTargets = GeneratePinnedPlayers()
            SetResourceKvp("4srp-adminmenu-pinned_targets", json.encode(Config.PinnedTargets))    
        else
            Config.PinnedTargets = json.decode(GetResourceKvpString("4srp-adminmenu-pinned_targets"))
        end
    elseif Type == 'Settings'then
        if GetResourceKvpString("4srp-adminmenu-settings") == nil or GetResourceKvpString("4srp-adminmenu-settings") == "[]" then
            Config.AdminSettings = GenerateAdminSettings()
            SetResourceKvp("4srp-adminmenu-settings", json.encode(Config.AdminSettings))
        else
            Config.AdminSettings = json.decode(GetResourceKvpString("4srp-adminmenu-settings"))
        end
    elseif Type == 'All' then
        if GetResourceKvpString("4srp-adminmenu-favorites") == nil or GetResourceKvpString("4srp-adminmenu-favorites") == "[]" then
            Config.FavoritedItems = GenerateFavorites()
            SetResourceKvp("4srp-adminmenu-favorites", json.encode(Config.FavoritedItems))
        else
            Config.FavoritedItems = json.decode(GetResourceKvpString("4srp-adminmenu-favorites"))
        end
        if GetResourceKvpString("4srp-adminmenu-pinned_targets") == nil or GetResourceKvpString("4srp-adminmenu-pinned_targets") == "[]" then
            Config.PinnedTargets = GeneratePinnedPlayers()
            SetResourceKvp("4srp-adminmenu-pinned_targets", json.encode(Config.PinnedTargets))    
        else
            Config.PinnedTargets = json.decode(GetResourceKvpString("4srp-adminmenu-pinned_targets"))
        end
        if GetResourceKvpString("4srp-adminmenu-settings") == nil or GetResourceKvpString("4srp-adminmenu-settings") == "[]" then
            Config.AdminSettings = GenerateAdminSettings()
            SetResourceKvp("4srp-adminmenu-settings", json.encode(Config.AdminSettings))
        else
            Config.AdminSettings = json.decode(GetResourceKvpString("4srp-adminmenu-settings"))
        end
    end
    UpdateMenu()
end

-- Get

function GetPlayersInArea(Coords, Radius)
	local Prom = promise:new()
	QBCore.Functions.TriggerCallback('4srp-admin/server/get-active-players-in-radius', function(Players)
		Prom:resolve(Players)
	end, Coords, Radius)
	return Citizen.Await(Prom)
end

function GetPlayers()
    local Promise = promise:new()
    QBCore.Functions.TriggerCallback("4srp-admin/server/get-players", function(Players)
        Promise:resolve(Players)
    end)
    return Citizen.Await(Promise)
end

function GetJobs()
    local JobList = {}
    for k, v in pairs(QBShared.Jobs) do
        table.insert(JobList, {
            Text = k,
            Label = ' ['..v.label..']'
        })
    end
    return JobList
end

function GetInventoryItems()
    local Inventory = {}
    for k, v in pairs(QBShared.Items) do
        table.insert(Inventory, {
            Text = v['name']
        });
    end
    return Inventory
end

function GetAddonVehicles()
    local AddonVehicles = {}
    for k, v in pairs(QBShared.Vehicles) do
        -- if v['category'] == 'custom' then -- Enable if you don't want all cars but only cars with 'category' custom
            table.insert(AddonVehicles, {
                Text = k,
                Label = ' ['..v['brand']..' '..v['name']..']'
            })
        -- end
    end
    return AddonVehicles
end

-- Generate

function GenerateFavorites()
    local Retval = {}
    for _, Menu in pairs(Config.AdminMenus) do
        for k, v in pairs(Menu.Items) do
            Retval[v.Id] = false
        end
    end
    return Retval
end

function GeneratePinnedPlayers()
    local Retval = {}
    local Players = GetPlayers()
    for k, v in pairs(Players) do
        Retval[v.License] = false
    end
    return Retval
end

function GenerateAdminSettings()
    local Retval = {}
    -- Default Size
    Retval['DefaultSize'] = "Small"
    -- Tooltips
    Retval['Tooltips'] = true
    -- Bind Open
    Retval['BindOpen'] = true

    return Retval
end

-- Troll

-- Drunk
local DRUNK_ANIM_SET = "move_m@drunk@verydrunk"

local DRUNK_DRIVING_EFFECTS = {
    1, -- brake
    7, --turn left + accelerate
    8, -- turn right + accelerate
    23, -- accelerate
    4, -- turn left 90 + braking
    5, -- turn right 90 + braking
}

local function getRandomDrunkCarTask()
    math.randomseed(GetGameTimer())

    return DRUNK_DRIVING_EFFECTS[math.random(#DRUNK_DRIVING_EFFECTS)]
end

-- NOTE: We might want to check if a player already has an effect
function drunkThread()
    local playerPed = PlayerPedId()
    local isDrunk = true

    RequestAnimSet(DRUNK_ANIM_SET)
    while not HasAnimSetLoaded(DRUNK_ANIM_SET) do
        Wait(5)
    end

    SetPedMovementClipset(playerPed, DRUNK_ANIM_SET)
    ShakeGameplayCam("DRUNK_SHAKE", 3.0)
    SetPedIsDrunk(playerPed, true)
    SetTransitionTimecycleModifier("spectator5", 10.00)

    CreateThread(function()
        while isDrunk do
            local vehPedIsIn = GetVehiclePedIsIn(playerPed)
            local isPedInVehicleAndDriving = (vehPedIsIn ~= 0) and (GetPedInVehicleSeat(vehPedIsIn, -1) == playerPed)

            if isPedInVehicleAndDriving then
                local randomTask = getRandomDrunkCarTask()
                TaskVehicleTempAction(playerPed, vehPedIsIn, randomTask, 500)
            end

            Wait(5000)
        end
    end)

    Wait(30 * 1000)
    isDrunk = false
    SetTransitionTimecycleModifier("default", 10.00)
    StopGameplayCamShaking(true)
    ResetPedMovementClipset(playerPed)
    RemoveAnimSet(DRUNK_ANIM_SET)
end

-- Wild attack

local attackAnimalHashes = {
    GetHashKey("a_c_chimp"),
    GetHashKey("a_c_rottweiler"),
    GetHashKey("a_c_coyote")
}
local animalGroupHash = GetHashKey("Animal")
local playerGroupHash = GetHashKey("PLAYER")

function startWildAttack()
    -- Consts
    local playerPed = PlayerPedId()
    local animalHash = attackAnimalHashes[math.random(#attackAnimalHashes)]
    local coordsBehindPlayer = GetOffsetFromEntityInWorldCoords(playerPed, 100, -15.0, 0)
    local playerHeading = GetEntityHeading(playerPed)
    local belowGround, groundZ, vec3OnFloor = GetGroundZAndNormalFor_3dCoord(coordsBehindPlayer.x, coordsBehindPlayer.y, coordsBehindPlayer.z)

    -- Requesting model
    RequestModel(animalHash)
    while not HasModelLoaded(animalHash) do
        Wait(5)
    end
    SetModelAsNoLongerNeeded(animalHash)

    -- Creating Animal & setting player as enemy
    local animalPed = CreatePed(1, animalHash, coordsBehindPlayer.x, coordsBehindPlayer.y, groundZ, playerHeading, true, false)
    SetPedFleeAttributes(animalPed, 0, 0)
    SetPedRelationshipGroupHash(animalPed, animalGroupHash)
    TaskSetBlockingOfNonTemporaryEvents(animalPed, true)
    TaskCombatHatedTargetsAroundPed(animalPed, 30.0, 0)
    ClearPedTasks(animalPed)
    TaskPutPedDirectlyIntoMelee(animalPed, playerPed, 0.0, -1.0, 0.0, 0)
    SetRelationshipBetweenGroups(5, animalGroupHash, playerGroupHash)
    SetRelationshipBetweenGroups(5, playerGroupHash, animalGroupHash)
end
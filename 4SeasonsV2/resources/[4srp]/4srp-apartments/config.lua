Apartments = {}
Apartments.Starting = true
Apartments.SpawnOffset = 30
Apartments.Locations = {
    ["apartamentocentral"] = {
        name = "apartamentocentral",
        label = "Apartamentos",
        coords = {
            enter = vector4(285.3344, -650.9472, 42.0187, 155.6356),
        },
        pos = {top = 51, left = 65.2},
        polyzoneBoxData = {}
    },
}

Apartments.PolyZonesLobby = {
    [1] = {             --esquerda
        coords = {
            vector2(282.98968505859, -643.31579589844),
            vector2(284.0143737793, -640.10656738281),
            vector2(293.18774414062, -643.47845458984),
            vector2(291.93005371094, -646.70318603516)
        },
        minZ = 40.0,
        maxZ = 44.0,
        debugPoly = false,
        created = false
    },
    [2] = {            --direita
        coords = {
            vector2(280.75411987305, -649.40216064453),
            vector2(279.42626953125, -652.58538818359),
            vector2(288.66055297852, -655.953125),
            vector2(289.49774169922, -652.81042480469)
        },
        minZ = 40.0,
        maxZ = 44.0,
        debugPoly = false,
        created = false
    }
}
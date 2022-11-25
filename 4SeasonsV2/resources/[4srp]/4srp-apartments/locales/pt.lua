local Translations = {
    error = {
        to_far_from_door = 'Estás demasiado longe da campainha..',
        nobody_home = 'Não está ninguém em casa..',
    },
    success = {
        receive_apart = 'Adquiriste um apartamento',
        --changed_apart = 'Mudaste-te para este apartamento',
    },
    info = {
        at_the_door = 'Está alguém à porta!!',
    },
    text = {
        logout = 'Sair da Personagem',
        change_outfit = 'Abrir Roupeiro',
        open_stash = 'Abrir Baú',
        --move_here = 'Mudar Para Cá',
        tennants = 'Moradores',
        options = 'Opções',
    },
    header = {
        enter = 'Entrar no Apartamento',
        ring_doorbell = 'Tocar à Campainha',
        close_menu = 'Fechar Menu',
        open_door = 'Abrir a Porta',
        leave = 'Sair do Apartamento',
    },
    subtext = {
        enter = 'Entrar no teu apartamento',
        ring_doorbell = 'Tocar à campainha de alguem',
        close_menu = 'Fechar o menu atual',
        open_door = 'Abrir a porta a alguém',
        leave = 'Sair do apartamento atual',
    },
    icon = {
        enter = 'fa solid fa-door-open',
        ring_doorbell = 'fa-solid fa-bell',
        close_menu = 'fa-solid fa-x',
        open_door = 'fa-solid fa-lock-open',
        leave = 'fa-solid fa-door-open',
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

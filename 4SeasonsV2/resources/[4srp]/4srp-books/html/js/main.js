$(() => { 

const InitPages = (Pages) => {
        $(".book-wrapper").empty()
        let book = `<div class="book"></div>`
        let bookElement = $(book)
        $(".book-wrapper").append(bookElement)

    Object.keys(Pages).sort((f,s) => f-s).forEach(page => {
        let pageCount = parseInt(page)
        let totalPages = Object.keys(Pages).length
        if (pageCount === 0 || pageCount === 1) {
            $(bookElement).append(`<div class="book-page hard"><img src="${Pages[page]}" alt="wow"></div>`)
        } else if (pageCount === totalPages -1 || pageCount === totalPages -2) {
            $(bookElement).append(`<div class="book-page hard"><img src="${Pages[page]}" alt="wow"></div>`)
        } else {
            $(bookElement).append(`<div class="book-page "><img src="${Pages[page]}" alt="wow"></div>`)
        }
    })
    $(bookElement).turn({});
}

const Show = state => state ? $("body").fadeIn(300) : $("body").fadeOut(300) 
    window.addEventListener("message", e => {
    let data = e.data
    switch(data.action) {
        case "OpenUI":
            Show(true)
            InitPages(data.pages)
            break;
        case "CloseUI":
            Show(false)
            break;
        default:break;
    }
})

window.addEventListener("keyup", e => {
        if (e.key === "Escape" || e.key === "Backspace") {
            $.post(`https://${GetParentResourceName()}/CloseUI`, JSON.stringify({}))
        }
    })
})
let menu_bar = document.getElementsByClassName('menu_bar')[0];
let menu = document.getElementsByClassName('menu')[0];
function menu_open() {
    let not_none = menu_bar.classList.contains("none");
    if (not_none) {
        menu_bar.classList.remove("none");
    } else {
        menu_bar.classList.add("none");
    }
};

menu.addEventListener('click', function () {
    menu_open();
})
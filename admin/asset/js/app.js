const menuLi = document.querySelectorAll(`.admin-sidebar-content > ul > li > a`);
const submenu = document.querySelectorAll(`.sub-menu`);
for (let index = 0; index < menuLi.length; index++) {
    menuLi[index].addEventListener(`click`, function(event){
        event.preventDefault();
        for (let i = 0; i < submenu.length; i++) {
            submenu[i].setAttribute(`style`, `height:0px;`);
        }
        const submenuHeight = menuLi[index].parentNode.querySelector(`ul .sub-menu-items`).offsetHeight;
        menuLi[index].parentNode.querySelector(`ul`).setAttribute(`style`, `height:` + submenuHeight + `px;`);
        
    })
}

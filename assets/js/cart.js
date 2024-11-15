document.getElementById('add-to-cart').addEventListener('click', function(){
    const quantity = parseInt(document.querySelector('.qty').value);
    const cartCount = document.getElementById('cart-count');
    const currentCount = parseInt(cartCount.textContent);

    //cap nhat so luong trong gio hang
    cartCount.textContent = currentCount + parseInt(quantity);

    //tao hieu ung bay len
    let flyItem = document.createElement('div');
    flyItem.classList.add('fly-item');
    document.body.appendChild(flyItem);

    //vi tri bat dau cua vat bay
    let rect = this.getBoundingClientRect();
    flyItem.style.left = rect.left + 'px';
    flyItem.style.top = rect.top + 'px';

    //xoa vat bay
    flyItem.addEventListener('animationend', function(){
        flyItem.remove();
    });

});
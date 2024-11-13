
    const filterBox = document.querySelector('.productfilter-down');
    const product_regular_title = document.querySelector('.product_regular-title');

    product_regular_title.addEventListener('click', function(){
        filterBox.style.display = filterBox.display.style === 'none' ? 'block' : 'none';
    })

    



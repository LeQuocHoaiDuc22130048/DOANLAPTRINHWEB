document.querySelector('.plus').addEventListener('click', function(){
    let quantityInput = document.querySelector('.qty');
    let currentValue = parseInt(quantityInput.value);

    quantityInput.value = currentValue + 1;
});

document.querySelector('.minus').addEventListener('click', function(){
    let quantityInput = document.querySelector('.qty');
    let currentValue = parseInt(quantityInput.value);

    if(currentValue > 1){
        quantityInput.value = currentValue - 1;
    }
});
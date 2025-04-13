document.querySelectorAll('input[name="payment_method"]').forEach(radio =>{
    radio.addEventListener('change',function (){
        const infoBank= document.getElementsByClassName('payment_box_bank')[0];
        if(this.value==='bank'){
            infoBank.style.display='block';
        }else{
            infoBank.style.display= 'none';
        }
    })
});
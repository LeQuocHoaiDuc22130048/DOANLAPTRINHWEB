function updateCart(product_id){
    let quantity= $("#product_quantity"+product_id).val();

   $.ajax({
       url:"update-cart",
       type: "POST",
       data:{id:product_id,quantity:quantity},
       success: function (response){
           $("#total_price" + product_id).text(response.totalPrice.toLocaleString());
           $("#discount").text(response.discountAmount.toLocaleString());
           $("#total_price_orders").text(response.totalAfterDiscount.toLocaleString());
       }

   });
}
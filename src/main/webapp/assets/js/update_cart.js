function updateCart(product_id) {
    let quantity= $("#product_quantity"+product_id).val();

    $.ajax({
        url:"update-cart",
        type: "POST",
        data:{id:product_id,quantity:quantity},
        success: function (response){
            $("#total_price" + product_id).text(response.totalPrice.toLocaleString());
            $("#discount").text(response.discountAmount.toLocaleString());

            let shippingFee = Number($("#shippingFeeHidden").val()) || 0;
            let totalFinal = response.totalAfterDiscount + shippingFee;
            $("#total_price_orders").text(totalFinal.toLocaleString() + " đ");
        }

    });
}

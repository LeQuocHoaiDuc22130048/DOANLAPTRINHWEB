function updateCart(product_id) {
    let quantity = document.getElementById("product_quantity" + product_id).value;

    fetch("update-cart", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({ id: product_id, quantity: quantity })
    })
        .then(response => response.json())
        .then(data => {
            document.getElementById("total_price" + product_id).textContent = Number(data.totalPrice).toLocaleString();
            document.getElementById("discount").textContent = Number(data.discountAmount).toLocaleString();
            document.getElementById("total_price_orders").textContent = Number(data.totalAfterDiscount).toLocaleString();
        })
        .catch(error => console.error("Error updating cart:", error));
}

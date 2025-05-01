document.querySelectorAll(".rate-product").forEach((btn) => {
    btn.addEventListener("click", function (e) {
        e.preventDefault();

        const productDiv = this.closest(".item");
        const productId = productDiv.getAttribute("data-product-id");

        fetch('/DoAnWeb/favorite', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({productId: productId})
        })
            .then(res => res.json())
            .then(data => {
                if (data.status === "success") {
                    const stars = productDiv.querySelectorAll(".stars .fa-star");
                    stars.forEach(star => star.classList.toggle("active"));
                    Swal.fire({
                        icon: data.action === "added" ? 'success' : 'info',
                        text: data.message,
                        confirmButtonText: 'OK'
                    });
                } else if (data.status === "not_logged_in") {
                    Swal.fire({
                        icon: 'info',
                        text: data.message,
                        confirmButtonText: 'OK'
                    });
                }
            })
            .catch(() => {
                Swal.fire({
                    icon: 'error',
                    text: 'Lỗi kết nối với server.',
                    confirmButtonText: 'OK'
                });
            });
    });
});

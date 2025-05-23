document.addEventListener("click", function (e) {
    const btn = e.target.closest(".rate-product");
    if (!btn) return; // không click vào nút đánh giá thì bỏ qua

    e.preventDefault();

    const productDiv = btn.closest(".item");
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
                const starIcon = productDiv.querySelectorAll(".stars .fa-star");

                // Gán class theo kết quả thực tế từ server
                if (data.action === "added") {
                    starIcon.forEach(star => star.classList.add("active"));
                } else {
                    starIcon.forEach(star => star.classList.remove("active"));
                }
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

function formatCurrency(n) {
    return n.toLocaleString('vi-VN') + ' đ';
}

document.addEventListener("DOMContentLoaded", () => {
    document.querySelectorAll('.view-link').forEach(link => {
        link.addEventListener('click', function (e) {
            e.preventDefault(); // Ngăn chuyển trang

            const href = this.getAttribute('href');
            const urlParams = new URLSearchParams(href.split('?')[1]);
            const orderCode = urlParams.get('code');

            // Ẩn bảng chính, hiện bảng chi tiết
            document.getElementById("orderListDiv").style.display = "none";
            document.getElementById("orderDetailDiv").style.display = "block";
            document.getElementById("detailLoader").style.display = "block";
            document.getElementById("orderDetailBody").innerHTML = "";

            fetch(href)
                .then(res => res.json())
                .then(({ data })=> {
                    const tbody = document.getElementById("orderDetailBody");
                    data.forEach((item, index) => {
                        const tr = document.createElement("tr");
                        tr.innerHTML = `
                            <td>${index + 1}</td>
                            <td>
                                <div style="display: flex; align-items: center;">
                                <!-- Hình ảnh -->
                                    <img src="../${item.imagePath}" alt="Product Image" style="width: 80px; height: 80px; margin-right: 10px;">
        
                                <!-- Thông tin sản phẩm -->
                                 <div>
                                        <div><strong>${item.product_name}</strong></div>
                                 </div>
                                 </div>
                            </td>
                            <td>${formatCurrency(item.price_per_item)}</td>
                            <td>${item.quantity}</td>
                            <td>${formatCurrency(item.totalPrice)}</td>
                        `;
                        tbody.appendChild(tr);
                    });
                })
                .catch(err => {
                    alert("Lỗi khi tải chi tiết đơn hàng");
                    console.error(err);
                })
                .finally(() => {
                    document.getElementById("detailLoader").style.display = "none";
                });
        });
    });
});

function goBackToList() {
    document.getElementById("orderDetailDiv").style.display = "none";
    document.getElementById("orderListDiv").style.display = "block";
}

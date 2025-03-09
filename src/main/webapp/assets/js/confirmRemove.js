function confirmRemove(event, productId) {
    event.preventDefault();

    // Hiển thị hộp thoại xác nhận
    const confirmDialog = document.getElementById("customConfirm");
    confirmDialog.style.display = "block";
    confirmDialog.style.display="flex";
    confirmDialog.style.alignItems="center";
    confirmDialog.style.justifyContent="center";

    // Xử lý nút "Có"
    document.getElementById("confirmYes").onclick = function () {
        window.location.href = `remove-cart?id=${productId}`;
    };

    // Xử lý nút "Không"
    document.getElementById("confirmNo").onclick = function () {
        confirmDialog.style.display = "none";
    };

    return false;
}
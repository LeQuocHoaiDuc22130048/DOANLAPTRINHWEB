function copyCode() {
    const discountCode = document.getElementById("discount-code-input");
    discountCode.select();
    document.execCommand("copy");
    alert("Đã sao chép mã khuyến mãi: " + discountCode.value);
}


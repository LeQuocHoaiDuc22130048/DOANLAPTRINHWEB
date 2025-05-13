const inputGiaNhap = document.getElementById("gia-nhap");
const hienThiGiaNhap = document.getElementById("gia-nhap-hien-thi");

const inputGiaBan = document.getElementById("gia-ban");
const hienThiGiaBan = document.getElementById("gia-ban-hien-thi");

inputGiaNhap.addEventListener("input", function () {
    const value = parseInt(inputGiaNhap.value);
    if(!isNaN(value)) {
        hienThiGiaNhap.textContent = value.toLocaleString("vi-VN") + "VNĐ";
    }else {
        hienThiGiaNhap.textContent = "0 VNĐ";
    }
})

inputGiaBan.addEventListener("input", function () {
    const value = parseInt(inputGiaBan.value);
    if(!isNaN(value)) {
        hienThiGiaBan.textContent = value.toLocaleString("vi-VN") + "VNĐ";
    }else {
        hienThiGiaBan.textContent = "0 VNĐ";
    }
})
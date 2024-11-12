//Phân loại sản phẩm theo giới tính
function showProducts(gender) {
  const sanPhamNu = document.getElementById("nu");
  const sanPhamNam = document.getElementById("nam");

  sanPhamNu.classList.remove("active");
  sanPhamNam.classList.remove("active");

  if (gender === "nam") {
    sanPhamNam.classList.add("active");
  } else if (gender === "nu") {
    sanPhamNu.classList.add("active");
  }
}

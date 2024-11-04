//Phân loại sản phẩm theo giới tính
function showProducts(gender) {
  const sanPhamNu = document.getElementById("nu");
  const sanPhamNam = document.getElementById("nam");

  //   if (gender === "nu") {
  //     sanPhamNu.style.display = "block";
  //     sanPhamNam.style.display = "none";
  //   } else if (gender === "nam") {
  //     sanPhamNu.style.display = "none";
  //     sanPhamNam.style.display = "block";
  //   }

  sanPhamNu.classList.remove("active");
  sanPhamNam.classList.remove("active");

  if (gender === "nam") {
    sanPhamNam.classList.add("active");
  } else if (gender === "nu") {
    sanPhamNu.classList.add("active");
  }
}

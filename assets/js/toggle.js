//Khi nhấn vào thẻ a, nó hiện ra div khác ( div type)
function toggleDiv(divId) {
  const divs = document.querySelectorAll(".div_sp_chi_tiet");
  divs.forEach((div) => (div.style.display = "none"));

  // Hiển thị div có id được nhấn
  const divToShow = document.getElementById(divId);
  divToShow.style.display = "block";
}

//khi nhấn vào thẻ a, nó hiện ra các brand khác tương ứng
function toggleBrand(divId) {
  const divs = document.querySelectorAll(".brand_chi_tiet");
  divs.forEach((div) => (div.style.display = "none"));

  // Hiển thị div có id được nhấn
  const divToShow = document.getElementById(divId);
  divToShow.style.display = "block";
}

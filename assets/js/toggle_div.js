function toggleDiv(divId) {
  const divs = document.querySelectorAll(".div_sp_chi_tiet");
  divs.forEach((div) => (div.style.display = "none"));

  // Hiển thị div có id được nhấn
  const divToShow = document.getElementById(divId);
  divToShow.style.display = "block";
}

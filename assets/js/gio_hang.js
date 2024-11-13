const btn = document.querySelectorAll(".btn_gio_hang");
console.log(btn);
btn.forEach(function (button, index) {
  button.addEventListener("click", function (event) {
    {
      event.preventDefault;
      var btnItem = event.target;
      var product = btnItem.parentElement;
      console.log(product);
    }
  });
});

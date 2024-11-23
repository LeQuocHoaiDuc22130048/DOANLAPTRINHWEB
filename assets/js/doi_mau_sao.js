const rateStars = document.querySelectorAll(".rate-product");

rateStars.forEach((rateStar) => {
  rateStar.addEventListener("click", function (event) {
    event.preventDefault();

    const starsList = this.closest(".item").querySelectorAll(".stars i");

    starsList.forEach((star) => {
      star.classList.toggle("selected");
    });
  });
});

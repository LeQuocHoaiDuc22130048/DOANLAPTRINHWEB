// Slider Trên (thumbnail slider)
const slider = document.querySelector('.slider');
const arrowLeft = document.querySelector('.fa-angles-left');
const arrowRight = document.querySelector('.fa-angles-right');
const moreImages = document.querySelectorAll('.more-images img');

let indexTop = 0; // Index cho slider trên

function updateSliderTop() {
  slider.style.transform = `translateX(${-indexTop * 100}%)`;
  updateActiveMoreImages();
}

function updateActiveMoreImages() {
  moreImages.forEach((image, i) => {
    if (i === indexTop) {
      image.classList.add('border'); // Highlight ảnh được chọn
    } else {
      image.classList.remove('border');
    }
  });
}

// Xử lý sự kiện cho slider trên
arrowRight.addEventListener('click', () => {
  indexTop = (indexTop + 1) % moreImages.length;
  updateSliderTop();
});

arrowLeft.addEventListener('click', () => {
  indexTop = (indexTop - 1 + moreImages.length) % moreImages.length;
  updateSliderTop();
});

moreImages.forEach((image, i) => {
  image.addEventListener('click', () => {
    indexTop = i;
    updateSliderTop();
  });
});

// Khởi tạo trạng thái ban đầu cho slider trên
updateActiveMoreImages();

// -------------------------------

// Slider Dưới (main image slider)
document.addEventListener('DOMContentLoaded', function () {
  const rowSlider = document.querySelector('.row-slider');
  const slides = document.querySelectorAll('.col-lg-4-slider');
  const Left = document.querySelector('.arrow-left');
  const Right = document.querySelector('.arrow-right');

  let currentIndexBottom = 1; // Index cho slider dưới
  const slideWidth = slides[0].clientWidth;

  function updateSliderPositionBottom() {
    rowSlider.style.transition = 'transform 0.5s ease-in-out';
    rowSlider.style.transform = `translateX(-${currentIndexBottom * slideWidth}px)`;
  }

  // Xử lý khi nhấn mũi tên phải
  Right.addEventListener('click', function () {
    const totalSlides = rowSlider.children.length;
    if (currentIndexBottom < totalSlides - 1) {
      currentIndexBottom++;
      updateSliderPositionBottom();
    } else {
      currentIndexBottom = 0;
      updateSliderPositionBottom();
    }

    // Reset khi đến clone cuối
    setTimeout(() => {
      if (currentIndexBottom === totalSlides - 1) {
        rowSlider.style.transition = 'none';
        currentIndexBottom = 1;
        rowSlider.style.transform = `translateX(-${currentIndexBottom * slideWidth}px)`;
      }
    }, 500);
  });

  // Xử lý khi nhấn mũi tên trái
  Left.addEventListener('click', function () {
    if (currentIndexBottom > 0) {
      currentIndexBottom--;
      updateSliderPositionBottom();
    } else {
      currentIndexBottom = slides.length - 1;
      updateSliderPositionBottom();
    }

    // Reset khi đến clone đầu
    setTimeout(() => {
      if (currentIndexBottom === 0) {
        rowSlider.style.transition = 'none';
        currentIndexBottom = slides.length;
        rowSlider.style.transform = `translateX(-${currentIndexBottom * slideWidth}px)`;
      }
    }, 500);
  });
});

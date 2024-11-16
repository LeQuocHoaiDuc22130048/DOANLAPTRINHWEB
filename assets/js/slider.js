const slider = document.querySelector('.slider');
const arrowLeft = document.querySelector('.fa-angles-left');
const arrowRight = document.querySelector('.fa-angles-right');
const moreImages = document.querySelectorAll('.more-images img');

let index = 0;

function updateSlider(){
    slider.style.transform = `translateX(${-index * 100}%)`;
    updateActiveMoreImages();
}

function updateActiveMoreImages(){
    moreImages.forEach((image, i) =>{
        if(i === index){
            image.classList.add('border');
        }else{
            image.classList.remove('border');
        }
    });
}

arrowRight.addEventListener('click', () => {
    index = (index +1) % moreImages.length;
    updateSlider();
});

arrowLeft.addEventListener('click', () => {
    index = (index -1 + moreImages.length) % moreImages.length;
    updateSlider();
});

moreImages.forEach((image, i) => {
    image.addEventListener('click', () => {
        index = i;
        updateSlider();
    });
});

updateActiveMoreImages();
$(document).ready(function () {
    $.ajax({
        url: '/DoAnWeb/get-banners',
        method: 'GET',
        dataType: 'json',
        success: function (data) {
            let html = '';
            data.banners.forEach(banner => {
                html += `
                    <div class="banner-slide">
                        <a href="${banner.link_url}" aria-label="${banner.title}">
                            <img src="${banner.image_url}" alt="${banner.title}" class="banner-image" />
                        </a>
                    </div>
                `;
            });

            $('#banner-carousel').html(html);

            if (!$('#banner-carousel').hasClass('slick-initialized')) {
                $('#banner-carousel').slick({
                    dots: true,
                    infinite: true,
                    speed: 500,
                    autoplay: true,
                    autoplaySpeed: 5000,
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    prevArrow: '<button class="slick-btn slick-prev slick-arrow" aria-label="Previous" type="button">&#10094;</button>',
                    nextArrow: '<button class="slick-btn slick-next slick-arrow" aria-label="Next" type="button">&#10095;</button>'
                });
            }
        },
        error: function () {
            $('#banner-carousel .slick-track').html('<p style="color:red;">Không thể tải banner.</p>');
        }
    });
});

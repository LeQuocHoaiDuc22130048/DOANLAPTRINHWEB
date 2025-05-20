function loadBestSellers(page = 1) {
    $.ajax({
        url: `/DoAnWeb/best-seller?page=${page}`,
        method: 'GET',
        success: function (data) {
            let html = '';
            data.products.forEach((product, index) => {
                if (index % 3 === 0) html += '<div class="row mb-4">';
                const isFavorite = data.favoriteIds && data.favoriteIds.includes(product.id);
                html += `
        <div class="item col-md-4" data-product-id="${product.id}">
            <div class="thumb">
                <div class="hover-content">
                    <ul>
                        <li><a href="/DoAnWeb/product-detail?id=${product.id}"><i class="fa fa-eye"></i></a></li>
                        <li><a href="#" role="button" class="rate-product"><i class="fa fa-star"></i></a></li>
                        <li>
                            <form class="addCartForm">
                                 <input type="hidden" name="id" value="${product.id}">
                                 <button type="submit" class="btn_gio_hang">
                                    <i class="fa fa-shopping-cart"></i>
                                 </button>
                            </form>
                        </li>
                    </ul>
                </div>
                <img class="img-thumbnail border-0 rounded-4" src="${product.path_image}" alt="${product.name}" />
            </div>
            <div class="down-content">
                <h4>${product.name}</h4>
                <span>${product.sellingPrice.toLocaleString()}đ</span>
                <ul class="stars">
                    ${[...Array(5)].map(() => `<li><i class="fa fa-star ${isFavorite ? 'active' : ''}"></i></li>`).join('')}
                </ul>
            </div>
        </div>
    `;

                if (index % 3 === 2 || index === data.products.length - 1) html += '</div>';
            });
            $('#bestSellerContainer').html(html);


            // Tạo phân trang động
            let pagHtml = '';
            for (let i = 1; i <= data.totalPages; i++) {
                pagHtml += `<li class="page-item ${i === page ? 'active' : ''}">
                                <a class="page-link" href="#" data-page="${i}">${i}</a>
                            </li>`;
            }
            $('#paginationContainer').html(`<ul class="pagination">${pagHtml}</ul>`);
        },
        error: function (xhr, status, error) {
            alert("AJAX lỗi!\nStatus: " + status + "\nError: " + error + "\nResponse: " + xhr.responseText);
        }
    });
}


let currentPage = 1;
$(document).ready(function () {
    loadBestSellers(currentPage);

    // Gắn lại sự kiện click sau mỗi lần load
    $(document).on('click', '.pagination a', function (e) {
        e.preventDefault();
        let page = $(this).data('page');
        currentPage = page;
        loadBestSellers(page);
    });
});

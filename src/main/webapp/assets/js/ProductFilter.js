const $dataContainerProduct = $('#data-containerProduct');
const $paginationContainer = $('#pagination-containerProduct');
const productGrid = $('#product-list'); // Khai báo và gán phần tử chứa sản phẩm
let currentPageProduct = 1;
let totalPages = 1;
const context = ""; //Giả sử context là rỗng

function fetchData(page, currentType, currentValue) {
    $.ajax({
        url: "http://localhost:8080/DoAnWeb/filter?page=" + page + "&type=" + currentType + "&value=" + currentValue,
        method: 'GET',
        dataType: 'json',
        success: function (data) {
            displayProducts(data.products);
            updatePagination(data.currentPage, data.totalPages, currentType, currentValue);
            currentPageProduct = data.currentPage;
            totalPages = data.totalPages;
            console.log(totalPages);

        },
        error: function (error) {
            console.error('Lỗi khi gọi API:', error);
            $dataContainerProduct.html('Có lỗi xảy ra khi tải dữ liệu.');
            $paginationContainer.empty();
        }
    });
}

function displayProducts(products) {
    let html = '';
    $.each(products, function (index, product) {
        html += `
       <div class="product-item shadow w-100  rounded-2" data-product-id="${product.id}">
    <img class="img-thumbnail border-0" src="${product.path}" alt="${product.name}" />
   <div class="d-flex justify-content-between align-items-center">
    <div class="down-content p-2">
        <h6>${product.name}</h6>
        <span>${product.cost_price}đ</span>
        <ul class="stars">
            ${generateStars(product.id)}
        </ul>
    </div>
    <form class="addCartForm">
        <input type="hidden" name="id" value="${product.id}">
        <button class="btn_gio_hang border-0 text-light bg-primary me-2 rounded-1">
            <i class="fa fa-shopping-cart"></i>
        </button>
    </form>
</div>
</div>
                    `;
    });
    console.log(html);
    productGrid.html(html);
}

function updatePagination(currentPageProduct, totalPages, currentType, currentValue) {
    let paginationHtml = '';
    $paginationContainer.empty(); // Xóa các nút phân trang cũ

    if (currentPageProduct > 1) {
        $('<button>', {
            class: 'pagination-button m-2 bg-primary text-light',
            text: 'Trang trước',
            click: function () {
                fetchData(currentPageProduct - 1, currentType, currentValue);
            }
        }).appendTo($paginationContainer);
    }

    for (let i = 1; i <= totalPages; i++) {
        let button;
        if (i === currentPageProduct) {
            button = $('<span>', {
                class: 'pagination-button current-page',
                text: i
            });
        } else {
            button = $('<button>', {
                class: 'pagination-button',
                text: i,
                click: function () {
                    fetchData(i, currentType, currentValue);
                }
            });
        }
        button.appendTo($paginationContainer);
    }

    if (currentPageProduct < totalPages) {
        $('<button>', {
            class: 'pagination-button',
            text: 'Trang sau',
            click: function () {
                fetchData(currentPageProduct + 1, currentType, currentValue);
            }
        }).appendTo($paginationContainer);
    }
}


function generateStars(productId) {
    let starsHtml = '';
    for (let i = 0; i < 5; i++) {
        starsHtml += '<i class="fa fa-star  text-warning"></i>'; // Sử dụng icon font-awesome
    }
    return starsHtml;
}

fetchData(1, "brand_id", "1");

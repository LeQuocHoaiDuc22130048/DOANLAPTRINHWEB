const $dataContainer = $('#data-container');
const $paginationContainer = $('#pagination-container');
const productGrid = $('#product-list'); // Khai báo và gán phần tử chứa sản phẩm
let currentPage = 1;
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
            currentPage = data.currentPage;
            totalPages = data.totalPages;
            console.log(totalPages);

        },
        error: function (error) {
            console.error('Lỗi khi gọi API:', error);
            $dataContainer.html('Có lỗi xảy ra khi tải dữ liệu.');
            $paginationContainer.empty();
        }
    });
}

function displayProducts(products) {
    let html = '';
    $.each(products, function (index, product) {
        html += `
        <div class="product-item border border-1 w-50" data-product-id="${product.id}">
            <img class="img-thumbnail border-0 rounded-4" src="${product.path}" alt="${product.name}"/>
            <div class="down-content">
                <h6>${product.name}</h6>
                <span>${product.cost_price}đ</span>
                <ul class="stars">
                    ${generateStars(product.id)}
                </ul>
            </div>
        </div>
                    `;
    });
    productGrid.html(html);
}

function updatePagination(currentPage, totalPages, currentType, currentValue) {
    let paginationHtml = '';
    $paginationContainer.empty(); // Xóa các nút phân trang cũ

    if (currentPage > 1) {
        $('<button>', {
            class: 'pagination-button m-2 btn-primary',
            text: 'Trang trước',
            click: function () {
                fetchData(currentPage - 1, currentType, currentValue);
            }
        }).appendTo($paginationContainer);
    }

    for (let i = 1; i <= totalPages; i++) {
        let button;
        if (i === currentPage) {
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

    if (currentPage < totalPages) {
        $('<button>', {
            class: 'pagination-button',
            text: 'Trang sau',
            click: function () {
                fetchData(currentPage + 1, currentType, currentValue);
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

const products = [
  { name: "Oakley Unisex Mã 0OX8096", price: "5.090.000đ", image: "assets/images/product1.jpg",href: "chi_tiet_san_pham.html" },
  { name: "Gucci Unisex Mã GG1144O", price: "11.900.000đ", image: "assets/images/product2.jpg",href: "chi_tiet_san_pham.html" },
  { name: "Cartier Nam Mã CT02910A", price: "15.500.000đ", image: "assets/images/product3.jpg",href: "chi_tiet_san_pham.html" },
  { name: "Chopard Nam Mã VCHG58", price: "23.600.000đ", image: "assets/images/product4.jpg",href: "chi_tiet_san_pham.html" },
  { name: "Gucci Unisex Mã GG1277OA", price: "10.950.000đ", image: "assets/images/product5.jpg",href: "chi_tiet_san_pham.html" },
  { name: "Prada Unisex Mã 0PR12LVD", price: "8.860.000đ", image: "assets/images/product6.jpg" ,href: "chi_tiet_san_pham.html"},
  { name: "Prada Nữ Mã 0PR12TVF", price: "9.260.000đ", image: "assets/images/product7.jpg",href: "chi_tiet_san_pham.html" },
  { name: "Prada Unisex Mã 0PR53V", price: "10.530.000đ", image: "assets/images/product8.jpg",href: "chi_tiet_san_pham.html" },
  { name: "Prada Unisex Mã 0PR51V", price: "10.530.000đ", image: "assets/images/product9.jpg" ,href: "chi_tiet_san_pham.html"},

  { name: "Prada Unisex Mã 0PR51V", price: "10.530.000đ", image: "assets/images/product9.jpg",href: "chi_tiet_san_pham.html" },
  { name: "Prada Unisex Mã 0PR52V", price: "10.530.000đ", image: "assets/images/product10.jpg",href: "chi_tiet_san_pham.html" },
  { name: "Prada Unisex Mã 0PRA10VF", price: "9.920.000đ", image: "assets/images/product11.jpg" ,href: "chi_tiet_san_pham.html"},
  { name: "Prada Unisex Mã 0PR52ZV", price: "10.530.000đ", image: "assets/images/product12.jpg" ,href: "chi_tiet_san_pham.html"},
  { name: "Eyes Cloud Trẻ Em Mã  EM201C04", price: "2.250.000đ", image: "assets/images/product13.jpg" ,href: "chi_tiet_san_pham.html"},
  { name: "Eyes Cloud Trẻ Em Mã EM202C04", price: "2.250.000đ", image: "assets/images/product14.jpg" ,href: "chi_tiet_san_pham.html"},
  { name: "Oakley Unisex Mã 0OY8004", price: "3.060.000đ", image: "assets/images/product15.jpg",href: "chi_tiet_san_pham.html" },
  { name: "Oakley Unisex Mã 0OY8029F", price: "2.630.000đ", image: "assets/images/product16.jpg",href: "chi_tiet_san_pham.html" },
  { name: "Versace Nữ Mã MOD.3335-F", price: "6.900.000đ", image: "assets/images/product17.jpg",href: "chi_tiet_san_pham.html" },
  { name: "Versace Nữ Mã MOD.3316-F", price: "5.500.000đ", image: "assets/images/product18.jpg" ,href: "chi_tiet_san_pham.html"},
  { name: "Versace Nữ Mã MOD.3313F", price: "6.100.000đ", image: "assets/images/product19.jpg",href: "chi_tiet_san_pham.html" },
  { name: "Parim Unisex Mã 84034_V1", price: "1.560.000đ", image: "assets/images/product20.jpg" ,href: "chi_tiet_san_pham.html"},
  { name: "Parim Unisex Mã PR82415", price: "1.590.000đ", image: "assets/images/product21.jpg",href: "chi_tiet_san_pham.html" },
  { name: "Parim Unisex Mã PG83511_B1", price: "1.680.000đ", image: "assets/images/product22.jpg" ,href: "chi_tiet_san_pham.html"},
  { name: "Exfash Unisex Mã EF71564_582", price: "800.000đ", image: "assets/images/product23.jpg",href: "chi_tiet_san_pham.html" },
  { name: "Exfash Nam Mã EF32287T", price: "1.380.000đ", image: "assets/images/product24.jpg" ,href: "chi_tiet_san_pham.html"},
  { name: "Exfash Nữ Mã EF12451_C1", price: "480.000đ", image: "assets/images/product25.jpg",href: "chi_tiet_san_pham.html" },
  { name: "Exfash Trẻ Em Mã EF42442_C6", price: "460.000đ", image: "assets/images/product26.jpg",href: "chi_tiet_san_pham.html" },
  { name: "Exfash Trẻ Em Mã EF60141_759", price: "680.000đ", image: "assets/images/product27.jpg",href: "chi_tiet_san_pham.html" },
  { name: "Parim Unisex Mã PG81502_G1", price: "1.750.000đ", image: "assets/images/product28.jpg" ,href: "chi_tiet_san_pham.html"},
  { name: "Dior Unisex Mã BLACKSUITON2U_F000", price: "10.500.000đ", image: "assets/images/product29.jpg" ,href: "chi_tiet_san_pham.html"},
];

const itemsPerPage = 9;
let currentPage = 1;

function displayProducts(page) {
  const start = (page - 1) * itemsPerPage;
  const end = start + itemsPerPage;
  const visibleProducts = products.slice(start, end);

  const productsContainer = document.getElementById("productContainer");
  productsContainer.innerHTML = visibleProducts.map(
    (product) => `
         <div class="col-lg-4">
                    <div class="item">
                      <div class="thumb">
                        <div class="hover-content">
                          <ul>
                            <li>
                              <a href="${product.href}"><i class="fa fa-eye"></i></a>
                            </li>
                            <li><a href=""><i class="fa fa-star"></i></a></li>
                            <li><a href="#" class = "btn_gio_hang"><i class="fa fa-shopping-cart"></i></a></li>
                          </ul>
                        </div>
                        <img src="${product.image}" alt="" style="width: 100%;">
                        <div class="down-content">
                          <h5>${product.name}</h5>
                          <span>${product.price}</span>
                          <ul class="star">
                            <li class="fa fa-star"></li>
                            <li class="fa fa-star"></li>
                            <li class="fa fa-star"></li>
                            <li class="fa fa-star"></li>
                            <li class="fa fa-star"></li>
                          </ul>
                        </div>
                      </div>
                    </div>
                  </div>

        `
  ).join("");
}

//tạo nút phân trang

function setupPagination(){
    const totalPages = Math.ceil(products.length / itemsPerPage);
    const pagination = document.querySelector(".pagination");

    pagination.innerHTML = "";
    
    for(let i = 1; i <= totalPages;i++){
        const pageButton = document.createElement(`div`);
        pageButton.className = `page-number`;
        pageButton.textContent = i;

        if(i === currentPage){
            pageButton.classList.add(`active-button`);
        }

        pageButton.addEventListener(`click`, () => {
            currentPage = i;
            displayProducts(currentPage);
            updatePagination();

            scrollToTopOfProducts();
        });

        pagination.appendChild(pageButton);
    }

    if(totalPages > 1){
        const nextButton = document.createElement(`div`);
        nextButton.classList = `page-next`;
        nextButton.textContent = `>`;

        nextButton.addEventListener(`click`, () => {
            if(currentPage < totalPages){
                currentPage++;
                displayProducts(currentPage);
                updatePagination();
                scrollToTopOfProducts();
            }
        });
        pagination.appendChild(nextButton);
    }
}

function updatePagination(){
    const pageNumbers = document.querySelectorAll(`.page-number`);
    const totalPages = Math.ceil(products.length / itemsPerPage);

    pageNumbers.forEach(button => button.classList.remove(`active-button`));
    if(currentPage <= totalPages){
        pageNumbers[currentPage - 1].classList.add(`active-button`);
    }

    const nextButton = document.querySelector(`page-next`);
    if(nextButton){
        nextButton.style.display = currentPage < totalPages ? `block` : `none`;
    }
}

function init(){
    displayProducts(currentPage);
    setupPagination();
}

function scrollToTopOfProducts(){
    const productsContainer = document.getElementById(`productContainer`);
    productsContainer.scrollIntoView({behavior: `smooth`,block: `start`});
}

init();
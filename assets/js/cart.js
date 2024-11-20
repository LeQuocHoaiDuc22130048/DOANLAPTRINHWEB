const products = [
  { name: "Oakley Unisex Mã 0OX8096", price: "5.090.000đ", image: "assets/images/product1.jpg" },
  { name: "Gucci Unisex Mã GG1144O", price: "11.900.000đ", image: "assets/images/product2.jpg" },
  { name: "Cartier Nam Mã CT02910A", price: "15.500.000đ", image: "assets/images/product3.jpg" },
  { name: "Chopard Nam Mã VCHG58", price: "23.600.000đ", image: "assets/images/product4.jpg" },
  { name: "Gucci Unisex Mã GG1277OA", price: "10.950.000đ", image: "assets/images/product5.jpg" },
  { name: "Prada Unisex Mã 0PR12LVD", price: "8.860.000đ", image: "assets/images/product6.jpg" },
  { name: "Prada Nữ Mã 0PR12TVF", price: "9.260.000đ", image: "assets/images/product7.jpg" },
  { name: "Prada Unisex Mã 0PR53V", price: "10.530.000đ", image: "assets/images/product8.jpg" },
  { name: "Prada Unisex Mã 0PR51V", price: "10.530.000đ", image: "assets/images/product9.jpg" },

  { name: "Prada Unisex Mã 0PR51V", price: "10.530.000đ", image: "assets/images/product9.jpg" },
  { name: "Prada Unisex Mã 0PR51V", price: "10.530.000đ", image: "assets/images/product9.jpg" },
  { name: "Prada Unisex Mã 0PR51V", price: "10.530.000đ", image: "assets/images/product9.jpg" },
  { name: "Prada Unisex Mã 0PR51V", price: "10.530.000đ", image: "assets/images/product9.jpg" },
  { name: "Prada Unisex Mã 0PR51V", price: "10.530.000đ", image: "assets/images/product9.jpg" },
  { name: "Prada Unisex Mã 0PR51V", price: "10.530.000đ", image: "assets/images/product9.jpg" },
  { name: "Prada Unisex Mã 0PR51V", price: "10.530.000đ", image: "assets/images/product9.jpg" },
  { name: "Prada Unisex Mã 0PR51V", price: "10.530.000đ", image: "assets/images/product9.jpg" },
  { name: "Prada Unisex Mã 0PR51V", price: "10.530.000đ", image: "assets/images/product9.jpg" },
  { name: "Prada Unisex Mã 0PR51V", price: "10.530.000đ", image: "assets/images/product9.jpg" },
  { name: "Prada Unisex Mã 0PR51V", price: "10.530.000đ", image: "assets/images/product9.jpg" },
  { name: "Prada Unisex Mã 0PR51V", price: "10.530.000đ", image: "assets/images/product9.jpg" },
  { name: "Prada Unisex Mã 0PR51V", price: "10.530.000đ", image: "assets/images/product9.jpg" },
  { name: "Prada Unisex Mã 0PR51V", price: "10.530.000đ", image: "assets/images/product9.jpg" },
  { name: "Prada Unisex Mã 0PR51V", price: "10.530.000đ", image: "assets/images/product9.jpg" },
  { name: "Prada Unisex Mã 0PR51V", price: "10.530.000đ", image: "assets/images/product9.jpg" },
  { name: "Prada Unisex Mã 0PR51V", price: "10.530.000đ", image: "assets/images/product9.jpg" },
  { name: "Prada Unisex Mã 0PR51V", price: "10.530.000đ", image: "assets/images/product9.jpg" },
  { name: "Prada Unisex Mã 0PR51V", price: "10.530.000đ", image: "assets/images/product9.jpg" },
  { name: "Prada Unisex Mã 0PR51V", price: "10.530.000đ", image: "assets/images/product9.jpg" },
  { name: "Prada Unisex Mã 0PR51V", price: "10.530.000đ", image: "assets/images/product9.jpg" },
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
                              <a href=""><i class="fa fa-eye"></i></a>
                            </li>
                            <li><a href=""><i class="fa fa-star"></i></a></li>
                            <li><a href=""><i class="fa fa-shopping-cart"></i></a></li>
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
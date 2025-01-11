


const itemsPerPage = 9;
let currentPage = 1;
const pageTitle = document.title;

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
                            <li><a href="#" class="rate-product"><i class="fa fa-star"></i></a></li>
                            <li><a href=""class="btn_gio_hang"><i class="fa fa-shopping-cart"></i></a></li>
                          </ul>
                        </div>
                        <img src="${product.image}" alt="" style="width: 100%;">
                        <div class="down-content">
                          <h4>${product.name}</h4>
                          <span>${product.price}</span>
                          <ul class="stars">
                           <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
                      <li><i class="fa fa-star"></i></li>
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
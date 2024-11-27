document.addEventListener("DOMContentLoaded", function () {
    
    const policyItems = document.querySelectorAll('.accordion-item');
  
    policyItems.forEach(item => {
      
      const label = item.querySelector('a');
      label.addEventListener('click', function (event) {
        event.preventDefault(); 
  
       
        const accordionInner = item.querySelector('.accordion-inner');
  
        
        accordionInner.classList.toggle('hidden');
  
        
        const icon = this.querySelector('i');
        icon.classList.toggle('open');
      });
    });
  });


  document.addEventListener("DOMContentLoaded", () => {
    // Lấy tất cả các phần tử chứa dropdown
    const filterContainers = document.querySelectorAll(".prodctfilter_filter");

    filterContainers.forEach(container => {
        const title = container.querySelector(".product_regular-title");
        const dropdown = container.querySelector(".productfilter-down");

        // Kiểm tra sự tồn tại của title và dropdown trước khi thêm sự kiện
        if (title && dropdown) {
            // Sự kiện click vào tiêu đề để mở/đóng dropdown
            title.addEventListener("click", (e) => {
                e.stopPropagation(); 

                // Đóng tất cả dropdown khác
                document.querySelectorAll(".productfilter-down").forEach(drop => {
                    if (drop !== dropdown) {
                        drop.classList.remove("show");
                        const otherTitle = drop.parentElement.querySelector(".product_regular-title");
                        if (otherTitle) {
                            otherTitle.classList.remove("openlist");
                        }
                    }
                });

                // Mở/Đóng dropdown hiện tại
                dropdown.classList.toggle("show");
                title.classList.toggle("openlist");
            });
        }
    });

    // Đóng tất cả dropdown khi click ra ngoài
    document.addEventListener("click", () => {
        filterContainers.forEach(container => {
            const dropdown = container.querySelector(".productfilter-down");
            const title = container.querySelector(".product_regular-title");
            
            // Kiểm tra sự tồn tại của dropdown và title trước khi thao tác
            if (dropdown && title) {
                dropdown.classList.remove("show");
                title.classList.remove("openlist");
            }
        });
    });
});


document.addEventListener("DOMContentLoaded", function () {
  // Lấy tất cả các tiêu đề và dropdown
  const titles = document.querySelectorAll(".product_regular-title");
  const dropdowns = document.querySelectorAll(".productfilter-down");

  // Thêm sự kiện click vào tiêu đề
  titles.forEach(title => {
    title.addEventListener("click", function (event) {
      event.stopPropagation(); // Ngăn chặn sự kiện click lan ra ngoài

      // Ẩn tất cả dropdown khác
      dropdowns.forEach(dropdown => {
        if (dropdown !== this.querySelector(".productfilter-down")) {
          dropdown.style.display = "none";
        }
      });

      // Toggle hiển thị dropdown của tiêu đề hiện tại
      const dropdown = this.querySelector(".productfilter-down");
      if (dropdown) {
        dropdown.style.display = dropdown.style.display === "block" ? "none" : "block";
      }
    });
  });

  // Ngăn dropdown tự đóng khi nhấp vào bên trong nó
  dropdowns.forEach(dropdown => {
    dropdown.addEventListener("click", function (event) {
      event.stopPropagation();
    });
  });

  // Thêm sự kiện cho checkbox trong dropdown
  document.querySelectorAll(".product-checkbox label").forEach(label => {
    label.addEventListener("click", function (event) {
      event.preventDefault(); // Ngăn hành động mặc định của nhãn

      // Tìm checkbox bên trong label
      const checkbox = this.querySelector("input[type='checkbox']");
      if (checkbox) {
        // Đổi trạng thái checked của checkbox
        checkbox.checked = !checkbox.checked;

        // Thêm hoặc gỡ bỏ lớp `checked` dựa trên trạng thái của checkbox
        if (checkbox.checked) {
          this.classList.add("checked");
        } else {
          this.classList.remove("checked");
        }
      }
    });
  });

  // Ẩn tất cả dropdown khi nhấp ra ngoài
  document.addEventListener("click", function () {
    dropdowns.forEach(dropdown => {
      dropdown.style.display = "none";
    });
  });
});


document.querySelectorAll(`.scroll-to-section a`).forEach(sub =>{
  sub.addEventListener(`mouseover`, () =>{
    const submenu = sub.querySelector(`.sub-menu.nav-dropdown`);
    if (submenu) { // Kiểm tra xem submenu có tồn tại không
      submenu.style.display = 'block';
      submenu.style.opacity = '0';
      submenu.style.transition = 'opacity 0.5s ease';
      setTimeout(() => (submenu.style.opacity = '1'), 10);
    }
  });

  sub.addEventListener(`mouseleave`, () =>{
    const submenu = sub.querySelector(`.sub-menu.nav-dropdown`);
    if (submenu) { // Kiểm tra xem submenu có tồn tại không
      submenu.style.opacity = '0';
      setTimeout(() => (submenu.style.display = 'none'), 300);
    }
  })
})





  
  
  
  
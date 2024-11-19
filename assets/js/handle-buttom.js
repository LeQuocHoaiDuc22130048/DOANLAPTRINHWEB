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
          e.stopPropagation(); // Ngăn sự kiện click lan truyền
  
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
    document.addEventListener("click", (e) => {
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
  
  
  
  
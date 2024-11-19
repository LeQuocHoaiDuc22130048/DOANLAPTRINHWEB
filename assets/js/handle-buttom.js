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
    const dropdownTitles = document.querySelectorAll(".product_regular-title");
  
    dropdownTitles.forEach(title => {
      title.addEventListener("click", () => {
       
        const dropdown = title.querySelector(".productfilter-down");
        const allDropdowns = document.querySelectorAll(".productfilter-down");
  
        
        allDropdowns.forEach(drop => {
          if (drop !== dropdown) {
            drop.classList.remove("show");
            drop.parentElement.querySelector(".product_regular-title").classList.remove("openlist");
          }
        });
  
        
        if (dropdown) {
          dropdown.classList.toggle("show");
          title.classList.toggle("openlist");
        }
      });
    });
  
    
    document.addEventListener("click", (e) => {
      if (!e.target.closest(".prodctfilter_filter")) {
        document.querySelectorAll(".productfilter-down").forEach(dropdown => {
          dropdown.classList.remove("show");
          dropdown.parentElement.querySelector(".product_regular-title").classList.remove("openlist");
        });
      }
    });
  });
  
  
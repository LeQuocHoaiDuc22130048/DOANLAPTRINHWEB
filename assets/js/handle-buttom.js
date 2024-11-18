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
  
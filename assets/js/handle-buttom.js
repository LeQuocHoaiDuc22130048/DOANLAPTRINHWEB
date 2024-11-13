// Bắt sự kiện khi nhấp vào bất kỳ bộ lọc nào
document.querySelector('.productfilter_filter_wrapper').addEventListener('click', function(event) {
    const target = event.target.closest('.product_regular-title');

    // Kiểm tra nếu nhấp vào một phần tử có lớp .product_regular-title
    if (target) {
        const dropdownId = target.getAttribute('data-dropdown');
        const dropdown = document.getElementById(dropdownId);

        // Ẩn tất cả các dropdown khác
        document.querySelectorAll('.productfilter-down').forEach(d => {
            if (d !== dropdown) d.classList.add('hidden');
        });

        // Sử dụng toggle để hiển thị hoặc ẩn dropdown được nhấp vào
        if (dropdown) {
            dropdown.classList.toggle('hidden');
        }
    }
});

// Ẩn dropdown khi nhấp ra ngoài
document.addEventListener('click', function(event) {
    const isClickInside = event.target.closest('.product_regular-title') || event.target.closest('.productfilter-down');
    if (!isClickInside) {
        document.querySelectorAll('.productfilter-down').forEach(d => d.classList.add('hidden'));
    }
});

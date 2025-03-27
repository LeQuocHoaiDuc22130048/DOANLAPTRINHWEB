document.addEventListener("DOMContentLoaded", function () {
    const itemsPerPage = 3;
    let currentPage = 0;
    const blogItems = document.querySelectorAll(".blog-item");
    const totalItems = blogItems.length;
    const totalPages = Math.ceil(totalItems / itemsPerPage);

    function showPage(page) {
        const start = page * itemsPerPage;
        const end = start + itemsPerPage;

        blogItems.forEach((item, index) => {
            item.style.display = (index >= start && index < end) ? "block" : "none";
        });
    }

    showPage(currentPage);

    document.querySelector(".right-button").addEventListener("click", function (e) {
        e.preventDefault();
        if (currentPage < totalPages - 1) {
            currentPage++;
            showPage(currentPage);
        }
    });

    document.querySelector(".left-button").addEventListener("click", function (e) {
        e.preventDefault();
        if (currentPage > 0) {
            currentPage--;
            showPage(currentPage);
        }
    });
});
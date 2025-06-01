//toggle trạng thai cho banner
function toggleStatus(id, isActive) {
    fetch('ToggleBannerStatus', {
        method: 'POST',
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: `id=${id}&status=${isActive ? 1 : 0}`
    }).then(res => {
        if (!res.ok) alert("Lỗi khi cập nhật trạng thái!");
    });
}

//them banner
function showAddBannerModal() {
    document.getElementById("addBannerModal").style.display = "flex";
}

function hideAddBannerModal() {
    document.getElementById("addBannerModal").style.display = "none";
}

document.getElementById("addBannerForm").addEventListener("submit", function (e) {
    e.preventDefault();
    const formData = new FormData(this);
    fetch('add-banner', {
        method: 'POST',
        body: formData
    }).then(res => {
        if (res.ok) {
            Swal.fire({
                icon: 'success',
                title: 'Thành công!',
                text: 'Thêm banner thành công!'
            }).then(() => location.reload());
        } else {
            Swal.fire({
                icon: 'error',
                title: 'Thất bại!',
                text: 'Lỗi khi thêm banner.'
            });
        }
    });
});

//edit banner
function editBanner(id) {
    const row = [...document.querySelectorAll("tbody tr")]
        .find(tr => tr.innerHTML.includes(`editBanner(${id})`));

    if (!row) return;
    const title = row.children[1].innerText.trim();
    const linkUrl = row.children[3].innerText.trim();
    const image = row.querySelector("img").getAttribute("src");

    // Đổ dữ liệu vào form
    document.getElementById("editId").value = id;
    document.getElementById("editTitle").value = title;
    document.getElementById("editLink").value = linkUrl;

    // Hiển thị ảnh hiện tại
    const preview = document.getElementById("currentImagePreview");
    if (preview) {
        preview.src = image;
        preview.style.display = 'block';
    }

    document.getElementById("editBannerModal").style.display = "flex";
}

function hideEditBannerModal() {
    document.getElementById("editBannerModal").style.display = "none";
}

document.getElementById("editBannerForm").addEventListener("submit", function (e) {
    e.preventDefault();
    const formData = new FormData(this);
    const id = formData.get("id");
    fetch('edit-banner', {
        method: 'POST',
        body: formData
    }).then(res => {
        if (res.ok) {
            // Cập nhật lại UI dòng tương ứng
            const row = [...document.querySelectorAll("tbody tr")].find(tr => tr.innerHTML.includes(`toggleStatus(${id},`));
            row.children[1].innerText = formData.get("title");
            row.children[3].innerText = formData.get("link_url");

            // Cập nhật nếu có ảnh mới
            if (formData.get("image") && formData.get("image").name) {
                const img = row.querySelector("img");
                const newImageUrl = `assets/images/slider/${formData.get("image").name}`;
                img.src = newImageUrl;
            }
            Swal.fire({
                icon: 'success',
                title: 'Thành công!',
                text: 'Cập nhật banner thành công!'
            });
            hideEditBannerModal();
        } else {
            Swal.fire({
                icon: 'error',
                title: 'Thất bại!',
                text: 'Lỗi khi cập nhật.'
            });
        }
    });
});



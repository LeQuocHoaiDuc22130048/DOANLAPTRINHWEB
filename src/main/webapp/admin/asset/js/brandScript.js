function editBrand(button) {
    const id = button.getAttribute('data-id');
    const name = button.getAttribute('data-name');
    const title = button.getAttribute('data-title');
    const img = button.getAttribute('data-img');
    const description = button.getAttribute('data-description');
    const icon = button.getAttribute('data-icon');

    // Đổ dữ liệu vào các input trong form
    document.getElementById('editId').value = id;
    document.getElementById('editBrand').value = name;
    document.getElementById('editBrandTitle').value = title;
    document.getElementById('editBrandDescription').value = description;
    document.getElementById('imageBrand').src = img;
    document.getElementById('iconBrand').src = icon;
}

// Xử lý submit form với SweetAlert2
document.getElementById('editBrandForm').addEventListener('submit', function(e) {
    e.preventDefault();

    const formData = new FormData(this);
    const modal = bootstrap.Modal.getInstance(document.getElementById('brandEdit'));

    Swal.fire({
        title: 'Xác nhận cập nhật?',
        text: "Bạn có chắc muốn cập nhật thông tin thương hiệu này?",
        icon: 'question',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Cập nhật',
        cancelButtonText: 'Hủy',
        showLoaderOnConfirm: true,
        preConfirm: () => {
            return fetch('EditBrand', {
                method: 'POST',
                body: formData
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error(response.statusText);
                    }
                    return response.text();
                })
                .catch(error => {
                    Swal.showValidationMessage(
                        `Request failed: ${error}`
                    );
                });
        },
        allowOutsideClick: () => !Swal.isLoading()
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire({
                title: 'Thành công!',
                text: 'Thông tin thương hiệu đã được cập nhật',
                icon: 'success',
                confirmButtonText: 'OK'
            }).then(() => {
                // Đóng modal và reload trang
                modal.hide();
                location.reload();
            });
        }
    });
});

document.querySelectorAll('.btn-danger').forEach(button => {
    button.addEventListener('click', function() {
        const brandId = this.closest('tr').querySelector('td:first-child').textContent;
        const brandName = this.closest('tr').querySelector('td:nth-child(2)').textContent;

        Swal.fire({
            title: 'Xác nhận xóa?',
            html: `Bạn có chắc muốn xóa thương hiệu <b>${brandName}</b> (ID: ${brandId})?`,
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#3085d6',
            confirmButtonText: 'Xóa',
            cancelButtonText: 'Hủy',
            showLoaderOnConfirm: true,
            preConfirm: () => {
                return fetch('DeleteBrand', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: `id=${brandId}`
                })
                    .then(response => {
                        if (!response.ok) {
                            throw new Error(response.statusText);
                        }
                        return response.json();
                    })
                    .catch(error => {
                        Swal.showValidationMessage(
                            `Request failed: ${error}`
                        );
                    });
            },
            allowOutsideClick: () => !Swal.isLoading()
        }).then((result) => {
            if (result.isConfirmed) {
                const response = result.value;
                if (response.status === "success") {
                    Swal.fire({
                        title: 'Thành công!',
                        text: response.message,
                        icon: 'success',
                        confirmButtonText: 'OK'
                    }).then(() => {
                        location.reload();
                    });
                } else {
                    Swal.fire('Lỗi!', response.message, 'error');
                }
            }
        });
    });
});
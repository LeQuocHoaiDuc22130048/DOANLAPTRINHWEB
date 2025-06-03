// Hiển thị modal thêm bài viết
function showAddPostModal() {
    document.getElementById('addPostModal').style.display = 'flex';
}

// Ẩn modal thêm bài viết
function hideAddPostModal() {
    document.getElementById('addPostModal').style.display = 'none';
}

// Hiển thị modal sửa bài viết
function showEditPostModal() {
    document.getElementById('editPostModal').style.display = 'flex';
}

// Ẩn modal sửa bài viết
function hideEditPostModal() {
    document.getElementById('editPostModal').style.display = 'none';
}

document.getElementById('addPostForm').addEventListener('submit', function (e) {
    e.preventDefault();
    const formData = new FormData(this);

    fetch('PostList?action=add', {
        method: 'POST',
        body: formData
    })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('Thêm bài viết thành công!');
                location.reload();
            } else {
                alert('Có lỗi xảy ra: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Có lỗi xảy ra khi thêm bài viết');
        });
});

// Xử lý sự kiện khi form sửa bài viết được submit
document.getElementById('editPostForm').addEventListener('submit', function (e) {
    e.preventDefault();
    const formData = new FormData(this);

    fetch('PostList?action=edit', {
        method: 'POST',
        body: formData
    })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('Cập nhật bài viết thành công!');
                location.reload();
            } else {
                alert('Có lỗi xảy ra: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Có lỗi xảy ra khi cập nhật bài viết');
        });
});

// Hàm sửa bài viết
function editPost(id) {
    fetch('PostList', {
        method: 'POST',
        // headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: `action=get&id=${id}`
    })
        .then(response => response.json())
        .then(post => {
            document.getElementById('editId').value = post.id;
            document.getElementById('editTitle').value = post.title;
            document.getElementById('editContent').value = post.content;
            document.getElementById('editUrl').value = post.url;

            // Hiển thị ảnh hiện tại
            const currentImage = document.getElementById('currentImagePreview');
            currentImage.src = '../' + post.thumbnail;
            currentImage.style.display = 'block';

            showEditPostModal();
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Có lỗi xảy ra khi lấy thông tin bài viết');
        });
}

// Hàm chuyển đổi trạng thái hiển thị
function toggleStatusDisplay(id, checked) {
    fetch('PostList', {
        method: 'POST',
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: `action=toggle&id=${id}&status=${checked ? 1 : 0}`
    }).then(res => res.json())
        .then(data => {
            if (!data.success) {
                alert("Lỗi khi cập nhật trạng thái!");
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Có lỗi xảy ra khi cập nhật trạng thái');
            location.reload();
        });
}
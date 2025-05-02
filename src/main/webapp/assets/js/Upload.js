const avatar = document.getElementById('avatar');
const fileInput = document.getElementById('fileInput');
// open file input
avatar.addEventListener('click', () => {
    fileInput.click();   // Mở hộp thoại upload
});
// Handle image update avatar
fileInput.addEventListener('change', () => {
    if (fileInput.files.length > 0) {
        const reader = new FileReader();
        reader.onload = (e) => {
            avatar.src = e.target.result;  // Cập nhật ảnh preview
        };
        reader.readAsDataURL(fileInput.files[0]);

    }
});

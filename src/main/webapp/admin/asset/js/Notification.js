// Khởi tạo modal
const notificationModal = new bootstrap.Modal(document.getElementById('notificationModal'));

// Dữ liệu thông báo mẫu
const notifications = {
    1: {
        title: "Đặt lịch hẹn mới",
        content: "Khách hàng Nguyễn Văn A đã đặt lịch hẹn vào ngày 15/06/2023 lúc 14:30 cho dịch vụ Tư vấn thiết kế.",
        type: "Đặt lịch",
        time: "10 phút trước",
        status: "Chưa xử lý"
    },
    2: {
        title: "Đánh giá dịch vụ",
        content: "Khách hàng Trần Thị B đã để lại đánh giá 5 sao với nội dung: 'Dịch vụ tuyệt vời, nhân viên nhiệt tình'.",
        type: "Đánh giá",
        time: "1 giờ trước",
        status: "Đã xem"
    },
    3: {
        title: "Yêu cầu hỗ trợ",
        content: "Khách hàng Lê Văn C báo cáo sự cố kỹ thuật với hệ thống. Mô tả: Không thể đăng nhập vào tài khoản.",
        type: "Hỗ trợ",
        time: "2 ngày trước",
        status: "Đang xử lý"
    },
    4: {
        title: "Xác nhận thanh toán",
        content: "Khách hàng Phạm Thị D đã thanh toán thành công số tiền 5.000.000đ cho hóa đơn #HD123456.",
        type: "Tài chính",
        time: "3 ngày trước",
        status: "Hoàn thành"
    }
};

// Xử lý click vào thông báo
document.querySelectorAll('.notification-item').forEach(item => {
    item.addEventListener('click', function (e) {


        const notificationId = this.getAttribute('data-notification-id');
        const notification = notifications[notificationId];

        // Đánh dấu đã đọc
        if (this.classList.contains('unread')) {
            this.classList.remove('unread');
            updateNotificationCount();
        }

        // Hiển thị modal chi tiết
        document.getElementById('notificationModalLabel').textContent = notification.title;
        document.getElementById('notificationModalBody').innerHTML = `
                <p><strong>Loại:</strong> ${notification.type}</p>
                <p><strong>Thời gian:</strong> ${notification.time}</p>
                <p><strong>Trạng thái:</strong> ${notification.status}</p>
                <div class="alert alert-info mt-3">${notification.content}</div>
            `;

        notificationModal.show();
    });
});

// Đánh dấu tất cả đã đọc
document.getElementById('markAllRead').addEventListener('click', function (e) {
    e.preventDefault();
    e.stopPropagation();

    document.querySelectorAll('.notification-item.unread').forEach(item => {
        item.classList.remove('unread');
    });
    updateNotificationCount();
});

// Cập nhật số thông báo chưa đọc
function updateNotificationCount() {
    const unreadCount = document.querySelectorAll('.notification-item.unread').length;
    const badge = document.querySelector('.notification-badge');
    badge.textContent = unreadCount;
    if (unreadCount === 0) {
        badge.style.display = 'none';
    } else {
        badge.style.display = 'inline-block';
    }
}

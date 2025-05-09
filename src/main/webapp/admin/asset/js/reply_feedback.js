function showReplyModal(button) {
    const id = button.getAttribute("data-id");
    const email = button.getAttribute("data-email");

    document.getElementById("feedbackId").value = id;
    document.getElementById("feedbackEmail").value = email;
    new bootstrap.Modal(document.getElementById('replyModal')).show();
}

function sendReply() {
    const id = document.getElementById("feedbackId").value;
    const email = document.getElementById("feedbackEmail").value;
    const replyContent = document.getElementById("replyContent").value;

    fetch('/DoAnWeb/admin/ReplyFeedback', {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: `id=${id}&email=${email}&content=${encodeURIComponent(replyContent)}`
    }).then(res => {
        if (res.ok) {
            Swal.fire({
                icon: 'success',
                text: 'Phản hồi đã được gửi.',
                confirmButtonText: 'Đóng'
            }).then(() => {
                location.reload();
            });
        } else {
            Swal.fire({
                icon: 'error',
                text: 'Gửi phản hồi thất bại. Vui lòng thử lại.',
                confirmButtonText: 'OK'
            });
        }
    });

}

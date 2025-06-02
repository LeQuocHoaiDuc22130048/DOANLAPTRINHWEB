function showMailModal(button) {
    const email = button.getAttribute("data-email");
    const name = button.getAttribute("data-name");

    document.getElementById("subscriberEmail").value = email;
    document.getElementById("subscriberName").textContent = name;
    new bootstrap.Modal(document.getElementById('mailModal')).show();
}

function showSendAllModal() {
    document.getElementById("subscriberEmail").value = "";
    document.getElementById("subscriberName").textContent = "Tất cả người đăng ký";

    document.getElementById("sendSingleBtn").classList.add("d-none");
    document.getElementById("sendAllBtn").classList.remove("d-none");

    new bootstrap.Modal(document.getElementById('mailModal')).show();
}


function sendNewsletterMail() {
    const email = document.getElementById("subscriberEmail").value;
    const content = document.getElementById("newsletterContent").value;

    fetch('/DoAnWeb/admin/SendNewsletter', {
        method: 'POST',
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: `email=${email}&content=${encodeURIComponent(content)}`
    }).then(res => {
        if (res.ok) {
            Swal.fire("Đã gửi!", "Email đã được gửi thành công", "success")
                .then(() => {
                    location.reload();
                });
        } else {
            Swal.fire("Lỗi", "Không gửi được email", "error");
        }
    });
}

function sendToAll() {
    const content = document.getElementById("newsletterContent").value;
    fetch('/DoAnWeb/admin/SendNewsletterAll', {
        method: 'POST',
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: `content=${encodeURIComponent(content)}`
    }).then(res => {
        if (res.ok) {
            Swal.fire("Thành công", "Đã gửi đến tất cả người đăng ký!", "success")
                .then(() => {
                    location.reload();
                });
        } else {
            Swal.fire("Thất bại", "Không gửi được cho tất cả người đăng ký.", "error");
        }
    });
}

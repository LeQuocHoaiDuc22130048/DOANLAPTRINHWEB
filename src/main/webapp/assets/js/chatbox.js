$(document).ready(function () {
  $("#chatForm").submit(function (e) {
    e.preventDefault();

    const $form = $(this);
    const name = $form.find("#name").val().trim();
    const email = $form.find("#email").val().trim();
    const message = $form.find("#message").val().trim();

    if (!name || !email || !message) {
      Swal.fire({
        icon: 'warning',
        text: 'Vui lòng điền đầy đủ thông tin!'
      });
      return;
    }

    $.ajax({
      url: "/DoAnWeb/send-feedback",
      method: "POST",
      data: {
        name: name,
        email: email,
        message: message
      },
      success: function (response) {
        Swal.fire({
          icon: response.status === 'ok' ? 'success' : 'warning',
          text: response.message
        });
        if (response.status === 'ok') {
          $("#chatForm")[0].reset();
        }
      },
      error: function (xhr) {
        let res;
        try {
          res = JSON.parse(xhr.responseText);
        } catch (e) {
          res = { message: 'Có lỗi xảy ra. Vui lòng thử lại sau.' };
        }

        Swal.fire({
          icon: 'error',
          text: res.message || 'Có lỗi xảy ra.'
        });
      }
    });
  });
});

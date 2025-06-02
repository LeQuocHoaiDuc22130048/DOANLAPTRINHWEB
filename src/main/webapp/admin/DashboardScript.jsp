<%--
  Created by IntelliJ IDEA.
  User: lequo
  Date: 3/30/2025
  Time: 1:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fomantic-ui/2.9.2/semantic.min.js"></script>

<!-- DataTables JS -->
<script src="https://cdn.datatables.net/2.2.2/js/dataTables.js"></script>
<script src="https://cdn.datatables.net/2.2.2/js/dataTables.semanticui.js"></script>

<!-- Local Bootstrap JS -->
<script src="${pageContext.request.contextPath}/admin/asset/js/bootstrap.bundle.min.js"></script>

<!-- Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!-- Reply Feedback -->
<script src="${pageContext.request.contextPath}/admin/asset/js/reply_feedback.js"></script>

<!-- Newsletter Subscriber -->
<script src="${pageContext.request.contextPath}/admin/asset/js/newsletter_subscriber.js"></script>

<!-- Banner Carousel -->
<script src="${pageContext.request.contextPath}/admin/asset/js/banner_carousel.js"></script>

<!-- Post -->
<script src="${pageContext.request.contextPath}/admin/asset/js/post.js"></script>

<%--sweet alert--%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<%--CKEDITOR--%>
<script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>

<%--js--%>
<script src="${pageContext.request.contextPath}/admin/asset/js/Notification.js"></script>
<script src="${pageContext.request.contextPath}/admin/asset/js/DisplayImage.js"></script>
<script src="${pageContext.request.contextPath}/admin/asset/js/appForAdmin.js"></script>

<script>
    $(document).ready(function () {
        $('#table_id').DataTable({
            "language": {
                lengthMenu: "Số lượng hàng trên mỗi trang  _MENU_ ",
                "sSearch": "Tìm kiếm",
                "sProcessing": "Đang xử lý",
                info: "Hiển thị _START_ đến _END_ của _TOTAL_ mục",
                "oPaginate": {
                    "sFirst": "Đầu",
                    "sPrevious": "Trước",
                    "sNext": "Tiếp",
                    "sLast": "Cuối"
                }
            }
        });
    });
</script>




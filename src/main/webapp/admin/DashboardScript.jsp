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


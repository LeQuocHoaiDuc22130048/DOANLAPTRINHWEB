<%--
  Created by IntelliJ IDEA.
  User: lequo
  Date: 3/30/2025
  Time: 1:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fomantic-ui/2.9.2/semantic.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/dayjs@1/dayjs.min.js"></script>

<!-- DataTables JS -->
<script src="https://cdn.datatables.net/2.2.2/js/dataTables.js"></script>
<script src="https://cdn.datatables.net/2.2.2/js/dataTables.semanticui.js"></script>

<!-- Local Bootstrap JS -->
<script src="${pageContext.request.contextPath}/admin/asset/js/bootstrap.bundle.min.js"></script>

<!-- Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="${pageContext.request.contextPath}/admin/asset/ckeditor5/ckeditor5/ckeditor5.js"></script>
<script>
    $("#table_id").DataTable({
        language: {
            processing: "Message khi đang tải dữ liệu",
            search: "",
            searchPlaceholder: "Tìm kiếm",
            lengthMenu: "Số lượng sản phẩm trên 1 trang _MENU_ ",
            info: "",
            infoEmpty:
                "Khi không có dữ liệu, Hiển thị 0 đơn hàng trong 0 tổng cộng 0 ",
            infoFiltered:
                "(Message bổ sung cho info khi không search đc record nào _MAX_)",
            // infoPostFix: "Alo Alo",
            loadingRecords: "",
            zeroRecords: "Khi tìm kiếm không match với record nào",
            emptyTable: "Không có dữ liệu",
            paginate: {
                first: "Trang đầu",
                previous: "Trang trước",
                next: "Trang sau",
                last: "Trang cuối",
            },
            aria: {
                sortAscending: ": Message khi đang sắp xếp theo column",
                sortDescending: ": Message khi đang sắp xếp theo column",
            },
        },
    });
</script>
<script type="importmap">
    {
        "imports": {
            "ckeditor5": "https://cdn.ckeditor.com/ckeditor5/43.3.1/ckeditor5.js",
            "ckeditor5/": "https://cdn.ckeditor.com/ckeditor5/43.3.1/"
        }
    }
</script>


<script type="module" src="asset/ckeditor5-builder-45.0.0/main.js"></script>
<script src="${pageContext.request.contextPath}/admin/asset/js/App.js"></script>
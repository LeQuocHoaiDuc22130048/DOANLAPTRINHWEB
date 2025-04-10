<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <jsp:include page="DashboardLink.jsp"/>
    <c:set var="titleName" value="Đơn hàng" scope="request"/>
    <title>${titleName}</title>
</head>
<body>
<div class="side-menu">
    <div class="brand-name">
        <img src="asset/image/logo.png" alt="eyestyle" width="100px"/>
    </div>
    <ul style="padding: 0">
        <li><a href="Dashboard"><i class="fa-solid fa-house"></i>Trang chủ</a></li>
        <li><a href="Order" class="active"><i class="fa-solid fa-scroll"></i>Đơn hàng</a></li>
        <li><a href="AdminProductList"><i class="fa-solid fa-weight-hanging"></i>Sản phẩm</a></li>
        <li><a href="Product-category"><i class="fa-solid fa-clipboard-list"></i>Danh mục sản phẩm</a></li>
        <li><a href="Promotion"><i class="fa-solid fa-percent"></i>Khuyến mãi</a></li>
        <li><a href="User"><i class="fa-solid fa-user"></i>Người dùng</a></li>
        <li><a href="Feedback"><i class="fa-solid fa-comment"></i>Phản hồi</a></li>

    </ul>
</div>

<div class="container">
    <jsp:include page="Header.jsp"/>
    <div class="content">

        <div class="data-table mx-3" style="margin-top: 100px;">
            <table id="table_id" class="ui celled table" style="width: 100%">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên khách hàng</th>
                    <th>SĐT</th>
                    <th>Email</th>
                    <th>Địa chỉ</th>
                    <th>Ghi chú</th>
                    <th>Ngày lập đơn hàng</th>
                    <th>Trạng thái đơn hàng</th>
                    <th>Hình thức thanh toán</th>
                    <th>Tùy biến đơn hàng</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>Lê Văn A</td>
                    <td>0123456789</td>
                    <td>abcxyz@gmai.com</td>
                    <td>154 Bắc Hải, Tân Bình, Hồ Chí Minh</td>
                    <td>Giao nhanh</td>
                    <td>28/11/2024</td>
                    <td><div class="btn btn-success">Đã giao</div></td>
                    <td><label class="btn btn-success">Trả trước</label></td>
                    <td>
                        <button class="btn btn-primary btn-sm" href="" type="button"
                                data-bs-toggle="modal"
                                data-bs-target="#order-detail">
                            <i class="fa-solid fa-eye"></i>
                        </button>
                        <button class="btn btn-danger btn-sm" href="" type="button"
                                data-bs-toggle="modal"
                                data-bs-target="#delete-receipt"
                        >
                            <i class="fa-solid fa-trash-can"></i>
                        </button>
                        <button
                                class="btn btn-warning btn-sm"
                                href=""
                                type="button"
                                data-bs-toggle="modal"
                                data-bs-target="#edit-receipt"
                        >
                            <i class="fa-solid fa-pen"></i>
                        </button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Xóa đơn hàng -->
<div class="modal" id="delete-receipt">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Xóa thành công đơn</h4>
                <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                ></button>
            </div>
        </div>
    </div>
</div>
</div>

<div class="modal" id="order-detail">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Chi tiết đơn hàng mã ()</h4>
                <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                ></button>
            </div>
            <div class="modal-body">
                <table width="100%" class="table table-bordered">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Ảnh</th>
                        <th>Thương hiệu</th>
                        <th>Mã sản phẩm</th>
                        <th>Giá</th>
                        <th>Số lượng</th>
                        <th>Thành tiền</th>
                        <th>Tùy biến</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>1</td>
                        <td><img width="70px" src="asset/imgs/product1.jpg" alt=""></td>
                        <td><img width="70px" src="asset/imgs/oakley.jpg" alt=""></td>
                        <td>95001_N1S</td>
                        <td>5.000.000đ</td>
                        <td>1</td>
                        <td>5.000.000đ</td>
                        <td>
                            <button class="btn btn-danger" href=""><i class="fa-solid fa-trash-can"></i></button>
                        </td>
                    </tr>

                    <tr>
                        <td>1</td>
                        <td><img width="70px" src="asset/imgs/product1.jpg" alt=""></td>
                        <td><img width="70px" src="asset/imgs/oakley.jpg" alt=""></td>
                        <td>95001_N1S</td>
                        <td>5.000.000đ</td>
                        <td>1</td>
                        <td>5.000.000đ</td>
                        <td>
                            <button class="btn btn-danger" href=""><i class="fa-solid fa-trash-can"></i></button>
                        </td>
                    </tr>

                    <tr>
                        <td>1</td>
                        <td><img width="70px" src="asset/imgs/product1.jpg" alt=""></td>
                        <td><img width="70px" src="asset/imgs/oakley.jpg" alt=""></td>
                        <td>95001_N1S</td>
                        <td>5.000.000đ</td>
                        <td>1</td>
                        <td>5.000.000đ</td>
                        <td>
                            <button class="btn btn-danger" href=""><i class="fa-solid fa-trash-can"></i></button>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold;" colspan="6">Tổng cộng</td>
                        <td style="font-weight: 700;">15.000.000đ</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</div>

<!-- Sửa đơn hàng -->
<div class="modal" id="edit-receipt">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Cập nhật trạng thái đơn hàng ( Mã đơn hàng: 1 )</h4>
                <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                ></button>
            </div>

            <div class="modal-body">
                <select class="form-select mb-3" aria-label="Default select example">
                    <option selected>-- Lựa chọn trạng thái đơn hàng --</option>
                    <option value="1">Chờ xác nhận</option>
                    <option value="2">Chờ lấy hàng</option>
                    <option value="3">Đang giao</option>
                    <option value="4">Đã giao</option>
                    <option value="5">Đã hũy</option>
                    <option value="6">Không nhận hàng</option>
                </select>

                <select class="form-select mb-3" aria-label="Default select example">
                    <option selected>-- Hình thức thanh toán --</option>
                    <option value="1">Trả trước</option>
                    <option value="2">Trả sau</option>

                </select>
            </div>

            <div class="modal-footer">
                <button
                        type="submit"
                        class="btn btn-secondary"
                        data-bs-dismiss="modal"
                >
                    Lưu
                </button>
            </div>
        </div>
    </div>
</div>
<script>
    $("#table_id").DataTable({
        language: {
            processing: "Message khi đang tải dữ liệu",
            search: "",
            searchPlaceholder: "Tìm kiếm",
            lengthMenu: "Số lượng đơn hàng trên 1 trang _MENU_ ",
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
<jsp:include page="DashboardScript.jsp"/>
</body>
</html>

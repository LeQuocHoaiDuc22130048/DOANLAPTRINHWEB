<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<h4>Thông tin đơn hàng #${orderDetail.id}</h4>
<table style="width:100%">
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
            <a class="btn btn-danger" href="">Xóa</a>
        </td>
    </tr>


    <tr>
        <td style="font-weight: bold;" colspan="6">Tổng cộng</td>
        <td style="font-weight: 700;">15.000.000đ</td>
    </tr>
    </tbody>
</table>

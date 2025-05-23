<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="odtTime" value="${fn:replace(order.created_at,'T' ,' ' )}"/>
<c:set var="odt" value="${fn:replace(odtTime,'-' ,'/' )}"/>
<div class="row g-2">
    <div class="col-9 h-100">
        <div class="card mb-2 text-start p-2 bg-light position-relative">
            <p>
                <strong class="text-secondary">Mã đơn:</strong>
                <span class="text-primary">${order.order_code}</span>
                <span class="vr me-2 ms-2"></span>
                <strong class="text-secondary">Số đơn:</strong>
                <span class="text-primary" name = "orderId">${order.id}</span>

            </p>
            <p class="text-secondary"><strong>Ngày đặt:</strong> ${odt} <span class="vr me-2 ms-2"></span> NV tư vấn: Lê Quốc Hoài Đức - lequochoaiduc04@gmail.com</p>
            <c:if test="${order.status_order == true}">
                <span class="btn btn-success btn-sm me-3 position-absolute top-50 end-0 translate-middle-y">ĐÃ GIAO HÀNG</span>
            </c:if>
            <c:if test="${order.status_order == false}">
                <span class="btn btn-warning btn-sm me-3 position-absolute top-50 end-0 translate-middle-y">CHƯA GIAO HÀNG</span>
            </c:if>
        </div>
        <div class="d-flex text-start mb-2">
            <div class="card w-25 me-4">
                <div class="card-header">
                    <h5 class="text-secondary">KHÁCH HÀNG</h5>
                </div>
                <div class="card-body">
                    <blockquote class=" mb-0">
                        <p class="fs-3 mb-0 text-secondary"><strong>${order.customer_name}</strong></p>
                        <p class="text-secondary fs-6 mb-0">${order.phone_number}</p>
                        <p class="text-secondary fs-6 mb-0">${order.customer_email}</p>
                    </blockquote>
                </div>
            </div>
            <div class="card w-75">
                <div class="card-header">
                    <h5 class="text-secondary">NGƯỜI NHẬN</h5>
                </div>
                <div class="card-body">
                    <blockquote class=" mb-0">
                        <p class="fs-3 mb-0 text-secondary"><strong>${order.customer_name}</strong></p>
                        <p class="text-secondary fs-6 mb-0">${order.phone_number}</p>
                        <p class="text-secondary fs-6 mb-0">${order.customer_email}</p>
                        <p class="text-secondary fs-6">${order.shipping_address}</p>
                    </blockquote>
                </div>
            </div>
        </div>
        <div class="card h-75">
            <table style="width:100%" class="p-0  overflow-y-auto">
                <thead class="bg-light card-header w-100">
                <tr>
                    <th>Sản phẩm</th>
                    <th>Mã sản phẩm</th>
                    <th>Thương hiệu</th>
                    <th>Giá bán</th>
                    <th>Số lượng</th>
                    <th>Thành tiền</th>
                </tr>
                </thead>
                <tbody>
                <c:set var="totalSum" value="0"/>
                <c:forEach var="od" items="${orderDetail}">
                    <tr>
                        <td><img src="../${od.productImage}" width="100px"></td>
                        <td>${od.productCode}</td>
                        <td><img src="../${od.brandImage}" width="100px"></td>
                        <td><fmt:formatNumber value="${od.sellingPrice}" type="currency" currencyCode="VND"/></td>
                        <td>${od.quantityInOrder}</td>
                        <td><fmt:formatNumber value="${od.totalPrice}" type="currency" currencyCode="VND"/></td>
                        <c:set var="totalSum" value="${totalSum + od.totalPrice}"/>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="col-3 h-100">
        <div class="card h-75">
            <div class="card-body">
                <div class="d-flex justify-content-between"><p class="card-text text-start">Phương thức thanh toán: </p>
                    <span class="text-primary"> ${order.payment_method}</span></div>
                <div class="d-flex justify-content-between"><p class="text-start">Tạm tính: </p><span
                        class="text-primary"><fmt:formatNumber value="${order.subtotal}" type="currency"
                                                               currencyCode="VND"/></span></div>
                <div class="d-flex justify-content-between"><p class="text-start">Giảm giá: </p><span
                        class="text-danger">-<fmt:formatNumber value="${order.total_discount}" type="currency"
                                                               currencyCode="VND"/></span></div>
                <div class="d-flex justify-content-between"><p class="text-start">Phí vận chuyển: </p><span
                        class="text-danger">-<fmt:formatNumber value="${order.shipping_fee}" type="currency"
                                                               currencyCode="VND"/></span></div>
                <div class="d-flex justify-content-between"><p class="text-start">Thành tiền: </p>
                    <span><fmt:formatNumber value="${order.total_price}" type="currency" currencyCode="VND"/></span>
                </div>
            </div>
        </div>

        <div class="mt-2 d-flex ">
            <a href="${pageContext.request.contextPath}/admin/InvoiceOrder?orderId=${order.id}&action=pdf" target="_blank" class="btn btn-outline-success w-100">In hóa đơn <i class="fa-solid fa-print"></i></a>
        </div>

    </div>
</div>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="context"/>
<html>
<head>
    <title>Không tìm thấy sản phẩm </title>
    <c:import url="Link.jsp"/>

</head>
<body>
<c:import url="Header.jsp"/>

<div class="position-relative">
  <div class="absolute-center object-fit-contain">
    <img alt="Error" class="w-100 h-100" src="assets/images/Website/ErrorPageImg.jpg"/>
  </div>
</div>
<a class="position-absolute top-0 left-0 mt-100 px-2 py-4 " href="${context}/DoAnWeb">Quay lại </a>
<c:import url="Footer.jsp"/>

</body>
</html>

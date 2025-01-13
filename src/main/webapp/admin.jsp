<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link
            href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="asset/css/style.css">
    <title>Trang quản lý</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<c:forEach var="b" items="${data}">
    <p>id : ${b.id}</p>
    <p>name : ${b.name}</p>
    <p>create at : ${b.createdAt}</p>
    <p>updat up : ${b.updatedAt}</p>
</c:forEach>

</body>
</html>

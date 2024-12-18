<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%="Chat Box" %>
</h1>
<br/>
<form action="hello" method="POST">
    <input type="text" id="name" name="name" placeholder="Nhập tên:....">
    <button type="submit">Search</button>
</form>
</body>
</html>
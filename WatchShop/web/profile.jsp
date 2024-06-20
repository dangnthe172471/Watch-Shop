<%-- 
    Document   : profile
    Created on : Jun 18, 2024, 1:41:49 PM
    Author     : dung2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hồ sơ</h1>

    <c:if test="${not empty param.message}">
        <p style="color: green;">${param.message}</p>
    </c:if>
    <c:if test="${not empty param.error}">
        <p style="color: red;">${param.error}</p>
    </c:if>

    <h2>Thông tin mới cập nhật:</h2>
    <ul>
        <li><strong>Email mới:</strong> ${sessionScope.email}</li>
        <li><strong>Số điện thoại mới:</strong> ${sessionScope.phone}</li>
    </ul>

</body>
</html>

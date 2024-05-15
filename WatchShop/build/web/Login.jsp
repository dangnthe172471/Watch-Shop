<%-- 
    Document   : Login
    Created on : Apr 15, 2024, 1:10:12 PM
    Author     : dung2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }

            .container {
                border: 1px solid #ccc;
                border-radius: 10px;
                padding: 20px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            }

            h1 {
                text-align: center;
            }

            input[type="text"],
            select {
                width: 100%;
                padding: 8px;
                margin-bottom: 10px;
                box-sizing: border-box;
            }

            input[type="text"] {
                margin-right: 10px;
            }

            select {
                margin-right: 10px;
            }
        </style>
    </head>
    <body>
       
        <form action="login" method="get">
            <div class="container">
                <legend>Đăng nhập </legend>
            <h3 style="color: red" "> ${requestScope.error}</h3>
            Account: <input type="text" name="user" value="${not empty sessionScope.user ? sessionScope.user : ''}" /><br>
            Password: <input type="text" name="pass" value="" /><br>
            <input type="submit" value="login" name="submit" />
            <div class="link">
                <a href="home">Về trang chủ</a> /
                <a href="Register.jsp" class="last">Đăng ký</a>
            </div>
            </div>
            
        </form>
    </body>
</html>

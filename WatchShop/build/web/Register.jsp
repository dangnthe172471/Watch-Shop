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

        <form action="register" method="post">
            <div class="container">
                <h2>Đăng ký thành viên</h2>
                <h3 style="color: red" ">${requestScope.error}</h3>

                Tên đăng nhập: <input type="text" name="username" required><br>
                Mật khẩu: <input type="password" name="password" required><br>
                Nhập lại Mật Khẩu:<input type="password" name="repassword" required><br>
                Email: <input type="email" name="email"><br>
                Số điện thoại: <input type="text" name="phone"><br>
                Địa chỉ: <input type="text" name="address"><br>
                <input type="submit" value="Đăng ký"><br>
                <a href="home">Về trang chủ</a> /
                <a href="login" class="last">Login</a>

            </div>

        </form>
    </body>
</html>

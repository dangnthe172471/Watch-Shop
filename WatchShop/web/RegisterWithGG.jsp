<%-- 
    Document   : RegisterWithGG
    Created on : Jun 4, 2024, 1:30:58 AM
    Author     : dung2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <!-- Custom styles-path -->
        <link rel="stylesheet" href="css/login.css">

        <!-- Font Awesome kit script -->
        <script src="https://kit.fontawesome.com/a81368914c.js"></script>

        <!-- Google Fonts Open Sans-->
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
    </head>

    <body style="background-image: url('img/watchlogin1.jpg')">

        <div class="container">
            <div class="img">
              
            </div>
            <div class="login-container">
                <form action="ggregister" method="post">
                    <h2>Tạo Tài Khoản Với Google</h2>
                     <img src="${avatar}" alt="Avatar" style="max-width: 80px; max-height: 80px; border-radius: 50%; border: 2px solid #ccc;">
                    <div class="input-div one">
                        <div class="i">
                            <i class="fas fa-user"></i>
                        </div>
                        <div>
                            
                            <input class="input" type="text" name="username" value="${username}" required>
                        </div>
                    </div>
                    <div class="input-div two">
                        <div class="i">
                            <i class="fas fa-envelope"></i>
                        </div>
                        <div>
                            
                            <input class="input" type="email" name="email" value="${email}" readonly>
                        </div>
                    </div>
                    <div class="input-div one">
                        <div class="i">
                            <i class="fas fa-phone"></i>
                        </div>
                        <div>
                            <h5>Số điện thoại</h5>
                            <input class="input" type="text" name="phone">
                        </div>
                    </div>
                    <div class="input-div one">
                        <div class="i">
                            <i class="fas fa-key"></i>
                        </div>
                        <div>
                            <h5>Mật khẩu</h5>
                            <input class="input" type="password" name="password" required>
                        </div>
                    </div>
                    <div class="input-div two">
                        <div class="i">
                            <i class="fas fa-key"></i>
                        </div>
                        <div>
                            <h5>Nhập lại mật khẩu</h5>
                            <input class="input" type="password" name="repassword" required>
                        </div>
                    </div>
                    <div class="input-div one">
                        <div class="i">
                            <i class="fas fa-location-arrow"></i>
                        </div>
                        <div>
                            <h5>Địa chỉ nhận hàng</h5>
                            <input class="input" type="text" name="address">
                        </div>
                    </div>
                    <br>
                    <h3 style="color: red">${requestScope.error}</h3>
                    <input type="hidden" name="avatar" value="${avatar}">
                    <input type="hidden" name="token" value="${token}">
                    <div class="btn-container">
                        <a class="col-sm-6" href="login"><button class="btn btn-primary btn-block" type="button" id="btn-signup"><i class="fas fa-sign-in-alt"></i> Trở về</button></a>
                        <input type="submit" class="btn"  value="Register">
                    </div>
                    <div class="account">
                        <p>Bạn đã có tài khoản?</p>
                        <a href="login">Đăng nhập.</a>
                    </div>
                </form>
            </div>
        </div>

        <script type="text/javascript" src="js/login.js"></script>
    </body>
</html>


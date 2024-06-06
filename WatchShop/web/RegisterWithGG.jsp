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
            <div class="img"></div>
            <div class="login-container">
                <form action="ggregister" method="post" onsubmit="onSubmitForm(event)">
                    <h2>ĐĂNG KÝ</h2>
                    <img src="${avatar}" alt="Avatar" style="max-width: 80px; max-height: 80px; border-radius: 50%; border: 2px solid #ccc;">
                    <div class="input-div one">
                        <div class="i">
                            <i class="fas fa-user"></i>
                        </div>
                        <div>
                            <input class="input" type="text" id="username" name="username" value="${username}" required oninput="validateUsername(),checkWhitespace()">
                            <div id="usernameMessage"></div>
                        </div>
                    </div>
                    <div class="input-div two">
                        <div class="i">
                            <i class="fas fa-envelope"></i>
                        </div>
                        <div>
                            <input class="input" type="email" id="email" name="email" value="${email}" readonly>
                            <div id="emailMessage"></div>
                        </div>
                    </div>
                    <div class="input-div one">
                        <div class="i">
                            <i class="fas fa-phone"></i>
                        </div>
                        <div>
                            <h5>Số Điện Thoại</h5>
                            <input class="input" type="text" id="phoneNumber" name="phone" oninput="validatePhoneNumber(),checkWhitespace()">
                            <div id="phoneMessage"></div>
                        </div>
                    </div>
                    <div class="input-div one">
                        <div class="i">
                            <i class="fas fa-key"></i>
                        </div>
                        <div>
                            <h5>Mật Khẩu</h5>
                            <input class="input" type="password" id="password" name="password" required oninput="validatePassword(),checkWhitespace()">
                                  
                            <div id="passwordMessage"></div>
                        </div>
                    </div>
                    <div class="input-div two">
                        <div class="i">
                            <i class="fas fa-key"></i>
                        </div>
                        <div>
                            <h5>Xác Nhận Mật Khẩu</h5>
                            <input class="input" type="password" id="re_pass" name="repassword" required oninput="validateRepeatPassword(),checkWhitespace()">                            
                            <div id="repeatPasswordMessage"></div>
                        </div>
                    </div>
                    <div class="input-div one">
                        <div class="i">
                            <i class="fas fa-location-arrow"></i>
                        </div>
                        <div>
                            <h5>Địa Chỉ</h5>
                            <input class="input" type="text" id="address" name="address" oninput="validateAddress(),checkWhitespace()">  
                            <div id="addressMessage"></div>
                        </div>
                    </div>
                    <br>
                    <h3 style="color: red">${requestScope.error}</h3>
                    <!-- Các trường ẩn để chuyển tiếp dữ liệu về server -->
                    <input type="hidden" name="avatar" value="${avatar}">
                    <input type="hidden" name="token" value="${token}">
                    <div class="btn-container">
                        <input type="submit" class="btn"  value="Đăng Ký">
                        <a class="col-sm-6" href="login"><button class="btn btn-primary btn-block" type="button" id="btn-signup"> Quay Lại</button></a>

                    </div>
                    <div class="account">
                        <p>Đã có tài khoản?</p>
                        <a href="login">Đăng Nhập.</a>
                    </div>
                </form>
            </div>
        </div>

                    <script type="text/javascript" src="js/validation.js"></script>
        <script type="text/javascript" src="js/login.js"></script>
    </body>
</html>

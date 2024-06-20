<%-- 
    Document   : Register
    Created on : May 23, 2024, 3:42:56 PM
    Author     : dung2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
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
                <form action="register" method="post" onsubmit="return onSubmitForm(event)">
                    <h2>REGISTER</h2>
                    <div id="whitespaceMessage"></div>
                    <div class="input-div one">
                        <div class="i">
                            <i class="fas fa-user"></i>
                        </div>
                        <div>
                            <h5>Tên đăng nhập <div id="usernameMessage"></div>
                            
                            </h5>
                            <input class="input" type="text" id="username" name="username" required oninput="validateUsername(),checkWhitespace()">
                           
                           
                        </div>
                    </div>
                    <div class="input-div two">
                        <div class="i">
                            <i class="fas fa-envelope"></i>
                        </div>
                        <div>
                            <h5>E-mail  <div id="emailMessage"></div></h5>
                            <input class="input" type="email" id="email" name="email" oninput="validateEmail(),checkWhitespace()">
                           
                            <div id="emailMessage"></div>
                        </div>
                    </div>
                    <div class="input-div one">
                        <div class="i">
                            <i class="fas fa-key"></i>
                        </div>
                        <div>
                            <h5>Số điện thoại <div id="phoneMessage"></div></h5>
                            <input class="input" type="text" id="phoneNumber" name="phone" oninput="validatePhoneNumber(),checkWhitespace()">
                           
                            
                        </div>
                    </div>
                    <div class="input-div one">
                        <div class="i">
                            <i class="fas fa-key"></i>
                        </div>
                        <div>
                            <h5>Mật khẩu <div id="passwordMessage"></div></h5>
                            <input class="input" type="password" id="password" name="password" required oninput="validatePassword(),checkWhitespace()">
                            
                        </div>
                    </div>

                    <div class="input-div two">
                        <div class="i">
                            <i class="fas fa-key"></i>
                        </div>
                        <div>
                            <h5>Nhập lại mật khẩu <div id="repeatPasswordMessage"></div></h5>
                            <input class="input" type="password" id="re_pass" name="repassword" required oninput="validateRepeatPassword(),checkWhitespace()">                            
                        </div>
                    </div>
                    <div class="input-div one">
                        <div class="i">
                            <i class="fas fa-key"></i>
                        </div>
                        <div>
                            <h5>Địa chỉ nhận hàng <div id="addressMessage"></div></h5>
                            <input class="input" type="text" id="address" name="address" oninput="validateAddress()">                            
                        </div>
                    </div><br>
                    <h3 style="color: red">${requestScope.error}</h3>
                    <div class="btn-container">
                        <input type="submit" class="btn" value="register">
                        <a class="col-sm-6" href="login"><button class="btn btn-primary btn-block" type="button" id="btn-signup"> Trở về</button></a>

                    </div>
                    <div class="account">
                        <p>Bạn đã có tài khoản?</p>
                        <a href="login">Đăng nhập.</a>
                    </div>

                </form>
            </div>
        </div>

                    <script type="text/javascript" src="js/validation.js"></script>
        <script type="text/javascript" src="js/login.js"></script>
    </body>
</html>

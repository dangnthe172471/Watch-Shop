<%-- 
    Document   : ChangePass
    Created on : May 23, 2024, 3:55:59 PM
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
                <form action="changepass" method="post">
                    <h2>Thay Đổi Mật Khẩu</h2>
                    <p>Bạn cần thay đổi mật khẩu của bạn</p>
                    <h3 style="color: red" ">${requestScope.error}</h3>
                    <h3 style="color: black" ">${requestScope.mess}</h3>
                    <div id="whitespaceMessage"></div>


                    <input class="input" type="hidden" name="user" value="${sessionScope.account.user}" readonly/>
                    <div class="input-div one">
                        <div class="i">
                            <i class="fas fa-key"></i>
                        </div>
                        <div>
                            <h5>Mật khẩu cũ  <div id="oldPasswordMessage"></div></h5>
                            <input class="input" type="password" name="opass" id="opass" oninput="validateOldPassword(),checkWhitespace()">

                        </div>
                    </div>
                    <div class="input-div one">
                        <div class="i">
                            <i class="fas fa-key"></i>
                        </div>
                        <div>
                            <h5>Mật khẩu mới<div id="passwordMessage"></div></h5>
                            <input class="input" type="password" name="pass" id="password" oninput="validatePassword(),checkWhitespace()">

                        </div>
                    </div>
                    <div class="input-div two">
                        <div class="i">
                            <i class="fas fa-key"></i>
                        </div>
                        <div>
                            <h5>Nhập lại mật khẩu mới <div id="repeatPasswordMessage"></div></h5>
                            <input class="input" type="password" name="rpass" id="re_pass" oninput="validateRepeatPassword(),checkWhitespace()">

                        </div>
                    </div>

                    <input type="submit" class="btn" value="Thay Đổi">
                    <a class="col-sm-6" href="home"><button class="btn btn-primary btn-block" type="button" id="btn-signup">Trang Chủ</button></a>
                    <div class="account">
                        <p>Trở về trang đăng nhập</p>
                        <a href="login">Đăng nhập.</a>
                    </div>
                </form>
            </div>
        </div>

        <script type="text/javascript" src="js/validation.js"></script>
        <script type="text/javascript" src="js/login.js"></script>
    </body>
</html>
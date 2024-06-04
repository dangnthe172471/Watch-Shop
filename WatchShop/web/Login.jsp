<%-- 
    Document   : Login
    Created on : May 23, 2024, 3:05:38 PM
    Author     : dung2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Watch Shop</title><meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Custom styles-path -->
        <link rel="stylesheet" href="css/login.css">
        <script type="text/javascript" src="js/validation.js"></script>

        <!-- Font Awesome kit script -->
        <script src="https://kit.fontawesome.com/a81368914c.js"></script>

        <!-- Google Fonts Open Sans-->
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">

    </head>
    <body style="background-image: url('img/watchlogin1.jpg')">
        <div class="container">
            <div class="img">
            </div>
            <div class="login-container" >
                <form action="login" method="post">
                    <h2>Đăng Nhập</h2>
                    <p>Chào Mừng Trở Lại !</p>
                    <h3 style="color: red" ">${requestScope.error}</h3>
                    <div class="input-div one">
                        <div class="i">
                            <i class="fas fa-user"></i>
                        </div>
                        <div>
                            <h5>Tên đăng nhập</h5>
                            <input class="input" type="text" name="user"  value="${cookie.cuser.value}"  oninput="validateForm()">
                        </div>
                    </div>
                    <div class="input-div two">
                        <div class="i">
                            <i class="fas fa-key"></i>
                        </div>
                        <div>
                            <h5>Mật khẩu</h5>
                            <input class="input" type="password" name="pass" value="${cookie.cpass.value}"  oninput="validateForm()">
                        </div>
                    </div>
                    <div class="form-group form-check">
                        <input type="checkbox" ${cookie.crem.value eq 'on'?'checked':''} name="rem" value="on" style="margin-right: 10px" /> Ghi nhớ tài khoản

                    </div>
                    <input type="submit" class="btn" name="submit" value="Đăng Nhập">
                    <a class="col-sm-6" href="home"><button class="btn btn-primary btn-block" type="button" id="btn-signup">Trang Chủ</button></a>
                    <a class="forgot" href="forgotpass">Bạn quên mật khẩu?</a>
                    <div class="others">
                        <hr>
                        <p>OR</p>
                        <hr>
                    </div>
                    <div class="social">
                        <div class="social-icons google">
                            <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:9999/watchshop/logingg&response_type=code&client_id=202967964381-vdr2p7u64iqfnuaursog7ilrdm7rnh54.apps.googleusercontent.com&approval_prompt=force" >

                                Đăng nhập với Google
                                <img src="img/google.png"> </a>
                        </div>
                    </div>
                    <div class="account">
                        <p>Tạo tài khoản mới.</p>
                        <a href="register">Đăng ký</a>
                    </div>
                </form>
            </div>
        </div>

        
        <script type="text/javascript" src="js/login.js"></script>
    </body>
</html>

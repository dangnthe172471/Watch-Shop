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
        <title>Cadastro</title>
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
                <form action="register" method="post">
                    <h2>REGISTER</h2>
                    <p>With to:</p>
                    
                    <div class="input-div one">
                        <div class="i">
                            <i class="fas fa-user"></i>
                        </div>
                        <div>
                            <h5>Tên đăng nhập</h5>
                            <input class="input" type="text" name="username" required>
                        </div>
                    </div>
                    <div class="input-div two">
                        <div class="i">
                            <i class="fas fa-envelope"></i>
                        </div>
                        <div>
                            <h5>E-mail</h5>
                            <input class="input" type="email" name="email">
                        </div>
                    </div>
                    <div class="input-div one">
                        <div class="i">
                            <i class="fas fa-key"></i>
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
                            <h5>Nhập lại mật khẩu </h5>
                            <input class="input" type="password" name="repassword" required>
                        </div>
                    </div>
                    <div class="input-div one">
                        <div class="i">
                            <i class="fas fa-key"></i>
                        </div>
                        <div>
                            <h5>Địa chỉ giao hàng</h5>
                            <input class="input" type="text" name="address">
                        </div>
                    </div><br>
                    <h3 style="color: red" ">${requestScope.error}</h3>
                    <div class="btn-container">
                        
                        <input type="submit" class="btn"  value="Đăng ký">
                        <a class="col-sm-6" href="login"><button class="btn btn-primary btn-block" type="button" id="btn-signup">Trở về</button></a>
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
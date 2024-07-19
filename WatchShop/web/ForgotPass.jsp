<%-- 
    Document   : FogotPass
    Created on : May 23, 2024, 4:09:39 PM
    Author     : dung2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WatchShop</title>
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
                <form action="forgotpass" method="post">
                    <h2>Bạn quên mật khẩu</h2>
                    <p>Hãy điền thông tin của bạn!</p>
                    <h5 style="color: red;font-size: 18px">${requestScope.mess}</h5>
                    <div class="input-div one">
                        <div class="i">
                            <i class="fas fa-user"></i>
                        </div>
                        <div>
                            <h5>Tên đăng nhập</h5>
                            <input class="input" type="text"  name="user" value="${user}">
                        </div>
                    </div>
                    <div class="input-div one">
                        <div class="i">
                            <i class="fas fa-envelope"></i>
                        </div>
                        <div>
                            <h5>E-mail đăng ký</h5>
                            <input class="input" type="email" name="email" value="${email}">
                        </div>
                    </div>
                    <div class="row">
                        <button class="btn btn-success btn-block col-sm-5" type="submit"> Gửi</button> 
                        <a class="col-sm-6" href="login"><button class="btn btn-primary btn-block" type="button" id="btn-signup"> Trở về</button></a>
                    </div>

                    <div class="account">
                        <p>Bạn có nhớ mật khẩu của mình không?</p>
                        <a href="login">Đăng nhập.</a>
                    </div>
                </form>
            </div>
        </div>

        <script type="text/javascript" src="js/login.js"></script>
    </body>

</html>
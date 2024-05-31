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
                    <h2>LOGIN</h2>
                    <p>Welcome back !</p>
                    <h3 style="color: red" ">${requestScope.error}</h3>
                    <div class="input-div one">
                        <div class="i">
                            <i class="fas fa-user"></i>
                        </div>
                        <div>
                            <h5>Username</h5>
                            <input class="input" type="text" name="user"  value="${cookie.cuser.value}">
                        </div>
                    </div>
                    <div class="input-div two">
                        <div class="i">
                            <i class="fas fa-key"></i>
                        </div>
                        <div>
                            <h5>Password</h5>
                            <input class="input" type="password" name="pass" value="${cookie.cpass.value}">
                        </div>
                    </div>
                        <div class="form-group form-check">
                    <input type="checkbox" ${cookie.crem.value eq 'on'?'checked':''} name="rem" value="on" style="margin-right: 10px" /> Remember me

                </div>
                        <input type="submit" class="btn" name="submit" value="login">
                        <a class="col-sm-6" href="home"><button class="btn btn-primary btn-block" type="button" id="btn-signup">Trang Chủ</button></a>
                    <a class="forgot" href="forgotpass">Forgot password ?</a>
                    <div class="others">
                        <hr>
                        <p>OR</p>
                        <hr>
                    </div>
                    <div class="social">
                        
                        <div class="social-icons google">
                            <a href="https://accounts.google.com/o/oauth2/auth?scope=profile&redirect_uri=http://localhost:9999/watchshop/login&response_type=code&client_id=&approval_prompt=force" >
                            
                           Login with Google
                       <img src="img/google.png"> </a>

                          
                        </div>
                    </div>
                    <div class="account">
                        <p>Register new account.</p>
                        <a href="register">Register</a>
                    </div>
                </form>
            </div>
        </div>

        <script type="text/javascript" src="js/login.js"></script>
    </body>
</html>

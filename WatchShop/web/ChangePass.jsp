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
                <h2>Change Password</h2>
                <p>You need to change your password</p>
                <h3 style="color: red" ">${requestScope.error}</h3>
                <div class="input-div one">
                        <div class="i">
                           
                        </div>
                        <div>
                            
                            <input class="input" type="text" name="user" value="${sessionScope.account.user}" readonly/>
                        </div>
                    </div>
                <div class="input-div one">
                        <div class="i">
                            <i class="fas fa-key"></i>
                        </div>
                        <div>
                            <h5>Old Password</h5>
                            <input class="input" type="password" name="opass">
                        </div>
                    </div>
                <div class="input-div one">
                        <div class="i">
                            <i class="fas fa-key"></i>
                        </div>
                        <div>
                            <h5>Password</h5>
                            <input class="input" type="password" name="pass">
                        </div>
                    </div>
                    <div class="input-div two">
                        <div class="i">
                            <i class="fas fa-key"></i>
                        </div>
                        <div>
                            <h5>Confirm Password</h5>
                            <input class="input" type="password" name="rpass">
                        </div>
                    </div>
                        <a class="col-sm-6" href="home"><button class="btn btn-primary btn-block" type="button" id="btn-signup">Trang Chủ</button></a>
                <input type="submit" class="btn" value="Change">
                <div class="account">
                    <p>Do you remember your password?</p>
                    <a href="index.html">Login.</a>
                </div>
            </form>
        </div>
    </div>

    <script type="text/javascript" src="js/login.js"></script>
</body>

</html>
<%-- 
    Document   : leftprofile
    Created on : Jun 11, 2024, 3:08:24 AM
    Author     : dung2
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Watch Shop</title>
        <!-- Boxicons -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- My CSS -->
        <link rel="stylesheet" href="css/manage.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/home.css">        
        <link rel="stylesheet" href="css/nav.css">
        <link rel="stylesheet" href="css/update-brand.css">
        <script type="text/javascript" src="js/main.js"></script>
        <link rel="stylesheet" type="text/css" href="slick/slick.css" />
        <link rel="stylesheet" type="text/css" href="slick/slick-theme.css" />
        <script type="text/javascript" src="slick/slick.min.js"></script>  
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <style>
            .bg-blue {
                background-color: #2196F3;
                color: white;
            }
        </style>
    </head>
    <body>
        <section id="sidebar">
            <a href="home" class="brand" style="margin-left: 60px;">
                <span class="text">Watch Shop</span>
            </a>
            <ul class="side-menu top">
                <div class="user-info" style="margin-left: 10px;" >
                    <img src="${account.avatar}" alt="Avatar" id="avatarImg" style="width: 40px; height: 40px; border-radius: 50%; border: 2px solid #ccc;" data-toggle="modal" data-target="#avatarModal">
                    <p>${account.user}</p>
                </div><br>
                <hr>


                <li class="${tab==1?'active':''}">
                    <a href="profile">
                        <i class='bx bx-user'></i>
                        <span class="text">Hồ sơ</span>
                    </a>
                </li>
                <li class="${tab==2?'active':''}">
                    <a href="changepass">
                        <i class="bx bx-lock"></i>
                        <span class="text">Thay đổi mật khẩu</span>
                    </a>
                </li>
                <li class="${tab==3?'active':''}">
                    <a href="sendOTP">
                        <i class='bx bxs-doughnut-chart' ></i>
                        <span class="text">Thay đổi thông tin</span>
                    </a>
                </li>
                <li class="${tab==4?'active':''}">
                    <a href="blog">
                        <i class='bx bxs-message-dots' ></i>
                        <span class="text">Tin tức</span>
                    </a>
                </li>
                <li class="${(tab==5||tab==null)?'active':''}">
                    <a href="orderHistory">
                        <i class="bx bx-cart"></i>
                        <span class="text">Sản phẩm đã mua</span>
                    </a>
                </li>



            </ul>
        </section>
        <section id="content">
            <nav class="navbar navbar-expand-md bg-white navbar-light">
                <i class='bx bx-menu' ></i>  
                <ul class="navbar-nav" style="margin-left: 850px;">
                    <div class="dropdown row" style="position: absolute; top: 10px;right: 50px;">
                        <li class="nav-item account"><a class="nav-link text-dark text-uppercase" href="profile" style="display:inline-block"> <img src="${account.avatar}" alt="Avatar" id="avatarImg" style="max-width: 25px; max-height: 25px; border-radius: 50%; border: 1px solid #ccc;" > ${sessionScope.account.user}</a></li> 
                        <li class="nav-item account"><a class="nav-link text-dark text-uppercase" href="login?type=logout" style="display:inline-block">Đăng Xuất</a></li> 
                    </div>
                </ul>
            </nav>
        </section>
    </body>
</html>

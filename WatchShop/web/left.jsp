<%-- 
    Document   : left
    Created on : May 31, 2024, 12:47:12 AM
    Author     : admin
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
    </head>
    <body>
        <section id="sidebar">
            <a href="home" class="brand" style="margin-left: 60px;">
                <span class="text">Watch Shop</span>
            </a>
            <ul class="side-menu top">
                <li class="${tab==null?'active':''}">
                    <a href="AdminManage.jsp">
                        <i class='bx bxs-dashboard' ></i>
                        <span class="text">Thống kê</span>
                    </a>
                </li>
                <li class="${tab==2?'active':''}">
                    <a href="brand">
                        <i class='bx bxs-shopping-bag-alt' ></i>
                        <span class="text">Thương hiệu</span>
                    </a>
                </li>
                <li class="${tab==3?'active':''}">
                    <a href="category">
                        <i class='bx bxs-doughnut-chart' ></i>
                        <span class="text">Loại</span>
                    </a>
                </li>
                <li class="${tab==4?'active':''}">
                    <a href="manageblog">
                        <i class='bx bxs-message-dots' ></i>
                        <span class="text">Tin tức</span>
                    </a>
                </li>
                <li class="${tab==5?'active':''}">
                    <a href="#">
                        <i class='bx bxs-group' ></i>
                        <span class="text">Sản phẩm</span>
                    </a>
                </li>
            </ul>
        </section>
        <section id="content">
            <nav class="navbar navbar-expand-md bg-white navbar-light">
                <i class='bx bx-menu' ></i>  
                <ul class="navbar-nav" style="margin-left: 600px;">
                    <div class="dropdown row" style="margin-left: 10px">
                            <li class="nav-item account"><a class="nav-link text-dark text-uppercase" href="AdminManage.jsp" style="display:inline-block"> <i class="fa fa-user"></i>Hello ${sessionScope.account.user}</a></li> 
                            <li class="nav-item account"><a class="nav-link text-dark text-uppercase" href="changepass" style="display:inline-block">Change Password</a></li> 
                            <li class="nav-item account"><a class="nav-link text-dark text-uppercase" href="login?type=logout" style="display:inline-block">logout</a></li> 
                    </div>
                    <c:set var="size" value="${sessionScope.size}"/>
                    <div style="margin-left: 10px">
                        <li class="nav-item giohang">
                            <a href="Cart.jsp" class="btn btn-secondary rounded-circle">
                                <i class="fa fa-shopping-cart"></i>
                                <c:if test="${size>0}">
                                    <div class="cart-amount">${size}</div>
                                </c:if>
                            </a>
                            <a href="Cart.jsp" class="nav-link text-dark text-uppercase" style="display:inline-block">Giỏ hàng</a>
                        </li>
                    </div>
                </ul>
            </nav>
        </section>
    </body>
</html>

<%-- 
    Document   : nav
    Created on : May 8, 2024, 11:57:17 AM
    Author     : admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-md bg-white navbar-light">
            <div class="container">
                <!-- logo  -->
                <a class="navbar-brand" href="home" style="color: rgb(0, 0, 187);"><b>Watch Shop</b></a>

                <!-- navbar-toggler  -->
                <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse"
                        data-target="#collapsibleNavId" aria-controls="collapsibleNavId" aria-expanded="false"
                        aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>

                <div class="collapse navbar-collapse" id="collapsibleNavId">
                    <!-- form tìm kiếm  -->
                    <form action="search" class="form-inline ml-auto my-2 my-lg-0 mr-3">
                        <div class="input-group" style="width: 520px;">
                            <input type="text" class="form-control" aria-label="Small"
                                   placeholder="Nhập tên sản phẩm cần tìm kiếm...">
                            <div class="input-group-append">
                                <button type="submit" class="btn" style="background-color: rgb(0, 0, 196); color: white;">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </form>


                    <ul class="navbar-nav mb-1 ml-auto">
                        <div class="dropdown">
                            <li class="nav-item account">
                                <c:if test="${sessionScope.account == null}" >
                                    <a href="login" class="btn btn-secondary rounded-circle">
                                        <i class="fa fa-user"></i>
                                    </a>
                                    <a class="nav-link text-dark text-uppercase" href="login" style="display:inline-block">Tài khoản</a>
                                </c:if>
                                <c:if test="${sessionScope.account != null}" >
                                    <a class="nav-link text-dark text-uppercase" href="login" style="display:inline-block">Hello ${account.user}</a>
                                    <a class="nav-link text-dark text-uppercase" href="login?type=logout" style="display:inline-block">logout</a>
                                </c:if>
                            </li>                            
                        </div>
                        <div>
                            <li class="nav-item giohang">
                                <a class="btn btn-secondary rounded-circle">
                                    <i class="fa fa-shopping-cart"></i>
                                    <div class="cart-amount">0</div>
                                </a>
                                <a class="nav-link text-dark text-uppercase" style="display:inline-block">Giỏ hàng</a>
                            </li>
                        </div>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="nav-bg">
            <nav class="container">
                <ul class="main-menu">
                    <li><a href="home">Trang chủ</a></li>
                    <li><a href="search">Sản phẩm</a></li>                   
                    <li><a href="#">Thương hiệu <i class="fa fa-caret-down fa-css"></i></a>
                        <ul class="sub-menu">
                            <c:forEach var="o" items="${listC}">                               
                                <li><a href="search?cid=${o.cid}">${o.cname}</a></li>
                                </c:forEach>
                        </ul>
                    </li>  
                    <li><a href="#">Liên hệ</a></li>                   
                </ul>
            </nav>
        </div>
    </body>
</html>

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
            <a href="AdminManage.jsp" class="brand" style="margin-left: 60px;">
                <span class="text">Watch Shop</span>
            </a>
            <ul class="side-menu top">
                <div class="user-info" >
                    <img src="${account.avatar}" alt="Avatar" style="max-width: 60px; max-height: 60px; border-radius: 50%; border: 2px solid #ccc;">
                    <p>${account.user}</p>
                </div><br>
                <hr>
                <c:if test="${sessionScope.account.roleID==1}">
                    <li class="${tab==1?'active':''}">
                        <a href="statistical">
                            <i class='bx bxs-dollar-circle' ></i>
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
                        <a href="manageproduct">
                            <i class='bx bxs-dashboard'></i>
                            <span class="text">Sản phẩm</span>
                        </a>
                    </li>
                    <li class="${tab==6?'active':''}">
                        <a href="staff">
                            <i class='bx bxs-group' ></i>
                            <span class="text">Quản lý nhân viên</span>
                        </a>
                    </li>
                    <li class="${tab==7?'active':''}">
                        <a href="shipper">
                            <i class='bx bxs-group' ></i>
                            <span class="text">Quản lý nhân viên vận chuyển</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.account.roleID==2}">
                    <li class="${tab==null?'active':''}">
                        <a href="AdminManage.jsp">
                            <i class='bx bxs-dashboard' ></i>
                            <span class="text">Thống kê</span>
                        </a>
                    </li>
                    <li class="${tab==4?'active':''}">
                        <a href="manageblog">
                            <i class='bx bxs-message-dots' ></i>
                            <span class="text">Tin tức</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.account.roleID==3}">
                    <li class="${tab==null?'active':''}">
                        <a href="listorder">
                            <i class='bx bxs-message-dots' ></i>
                            <span class="text">Danh sách đơn</span>
                        </a>
                    </li>
                </c:if>
            </ul>
        </section>
        <section id="content">
            <nav class="navbar navbar-expand-md bg-white navbar-light">
                <i class='bx bx-menu' ></i>  
                <ul class="navbar-nav" style="margin-left: 850px;">
                    <div class="dropdown row" style="position: absolute; top: 10px;right: 50px;">
                        <li class="nav-item account"><a class="nav-link text-dark text-uppercase" href="AdminManage.jsp" style="display:inline-block"> <i class="fa fa-user"></i>Hello ${sessionScope.account.user}</a></li> 
                        <li class="nav-item account"><a class="nav-link text-dark text-uppercase" href="login?type=logout" style="display:inline-block">logout</a></li> 
                    </div>
                </ul>
            </nav>
        </section>
    </body>
</html>

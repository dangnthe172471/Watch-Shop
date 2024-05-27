<%-- 
    Document   : AdminManage
    Created on : May 18, 2024, 7:21:38 PM
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
        <script type="text/javascript" src="js/main.js"></script>
        <link rel="stylesheet" type="text/css" href="slick/slick.css" />
        <link rel="stylesheet" type="text/css" href="slick/slick-theme.css" />
        <script type="text/javascript" src="slick/slick.min.js"></script>  
    </head>
    <body>
        <!-- SIDEBAR -->
        <section id="sidebar">
            <a href="home" class="brand" style="margin-left: 60px;">
                <span class="text">Watch Shop</span>
            </a>
            <ul class="side-menu top">
                <li >
                    <a href="AdminManage.jsp">
                        <i class='bx bxs-dashboard' ></i>
                        <span class="text">Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class='bx bxs-shopping-bag-alt' ></i>
                        <span class="text">Category</span>
                    </a>
                </li>
                <li >
                    <a href="#">
                        <i class='bx bxs-doughnut-chart' ></i>
                        <span class="text"></span>
                    </a>
                </li>
                <li class="active">
                    <a href="manageblog">
                        <i class='bx bxs-message-dots' ></i>
                        <span class="text">Blog</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class='bx bxs-group' ></i>
                        <span class="text">Team</span>
                    </a>
                </li>
            </ul>
        </section>
        <!-- SIDEBAR -->

        <!-- CONTENT -->
        <section id="content">
            <!-- NAVBAR -->
            <nav class="navbar navbar-expand-md bg-white navbar-light">
                <i class='bx bx-menu' ></i>  
                <ul class="navbar-nav" style="margin-left: 600px;">
                    <div class="dropdown row" style="margin-left: 10px">
                        <c:if test="${sessionScope.account == null}" >
                            <li class="nav-item account">  <a href="login" class="btn btn-secondary rounded-circle">
                                    <i class="fa fa-user"></i>
                                </a>
                                <a class="nav-link text-dark text-uppercase" href="login" style="display:inline-block">Tài khoản</a> </li>   
                            </c:if>
                            <c:if test="${sessionScope.account != null}" >
                            <li class="nav-item account"><a class="nav-link text-dark text-uppercase" href="#" style="display:inline-block"> <i class="fa fa-user"></i>Hello ${account}</a></li> 
                            <li class="nav-item account"><a class="nav-link text-dark text-uppercase" href="#" style="display:inline-block">Change Password</a></li> 
                            <li class="nav-item account"><a class="nav-link text-dark text-uppercase" href="login?type=logout" style="display:inline-block">logout</a></li> 
                            </c:if>
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

            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>Blog</h1>                      
                    </div>
                    <a href="#" class="btn-download">
                        <span class="text">Add or remove Blog</span>
                    </a>
                </div>
                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <h3>Manage</h3>
                            <i class='bx bx-search' ></i>
                            <i class='bx bx-filter' ></i>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th>Blog ID</th>
                                    <th>Blog Title</th>
                                    <th>Blog Image</th>
                                    <th>Blog date</th>
                                    <th>Blog Description</th>
                                </tr>
                                <c:forEach items="${requestScope.listBl}" var="c">
                                    <tr>
                                        <td>${c.id}</td>
                                        <td>${c.title}</td>
                                        <td><img src="${c.image}"/></td>
                                        <td>${c.date}</td>
                                        <td><span style="display: -webkit-box;-webkit-line-clamp: 5;-webkit-box-orient: vertical; overflow: hidden;" title="${c.description}">${c.description}</span></td>
                                    </tr>
                                </c:forEach>
                                    
                            </thead>
                        </table>
                    </div>                  
                </div>
            </main>
        </section>
        <script src="js/script.js"></script>
    </body>
</html>

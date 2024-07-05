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
                <div class="user-info" >
                    <img src="${account.avatar}" alt="Avatar" id="avatarImg" style="max-width: 60px; max-height: 60px; border-radius: 50%; border: 2px solid #ccc;" data-toggle="modal" data-target="#avatarModal">
                    <p>${account.user}</p>
                </div><br>
                <hr>


                <li class="${tab==null?'active':''}">
                    <a href="ProfileUser.jsp">
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
                    <a href="confirm.jsp">
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
                <li class="${tab==5?'active':''}">
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
                <ul class="navbar-nav" style="margin-left: 600px;">
                    <div class="dropdown row" style="margin-left: 10px">
                        <li class="nav-item account"><a class="nav-link text-dark text-uppercase" href="ProfileUser.jsp" style="display:inline-block">  <img src="${account.avatar}" alt="Avatar" id="avatarImg" style="max-width: 25px; max-height: 25px; border-radius: 50%; border: 1px solid #ccc;" > ${sessionScope.account.user}</a></li> 
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

        <div class="modal fade" id="avatarModal" tabindex="-1" role="dialog" aria-labelledby="avatarModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-blue">
                        <h5 class="modal-title" id="avatarModalLabel">Avatar</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body text-center">
                        <img src="${account.avatar}" alt="Avatar" class="img-fluid">
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

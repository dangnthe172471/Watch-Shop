<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Watch Shop</title>
        <style>
            td, th {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }
        </style>
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
                        <div class="input-group" style="width: 500px;">
                            <input type="text" class="form-control" aria-label="Small" value="${key != null ? key : ''}" name="key" placeholder="Nhập tên sản phẩm cần tìm kiếm...">
                            <div class="input-group-append">
                                <button type="submit" class="btn" style="background-color: rgb(0, 0, 196); color: white;">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </form>

                    <ul class="navbar-nav mb-0 ml-auto" style="width: 1000px">
                        <div class="dropdown row" style="margin-left: 10px">

                            <c:if test="${sessionScope.account == null}" >
                                <li class="nav-item account">  <a href="login" class="btn btn-secondary rounded-circle">
                                        <i class="fa fa-user"></i>
                                    </a>
                                    <a class="nav-link text-dark text-uppercase" href="login" style="display:inline-block">Tài khoản</a> </li>   
                                </c:if>

                            <c:if test="${sessionScope.account != null}" >
                                <c:if test="${sessionScope.account.roleID == 1}">
                                    <li class="nav-item account"><a class="nav-link text-dark text-uppercase" href="AdminManage.jsp" style="display:inline-block"> <i class="fa fa-user"></i>Hello ${account.user}</a></li> 
                                    </c:if>
                                    <c:if test="${sessionScope.account.roleID != 1}">
                                    <li class="nav-item account"><a class="nav-link text-dark text-uppercase" href="profile" style="display:inline-block"> <i class="fa fa-user"></i>Hello ${account.user}</a></li> 
                                    </c:if>
                                <li class="nav-item account"><a class="nav-link text-dark text-uppercase" href="changepass" style="display:inline-block">Change Password</a></li> 
                                <li class="nav-item account"><a class="nav-link text-dark text-uppercase" href="login?type=logout" style="display:inline-block">logout</a></li> 
                                </c:if>
                        </div>
                        <c:set var="size" value="${sessionScope.size}"/>
                        <div style="margin-left: 10px">
                            <li class="nav-item giohang">
                                <a onclick="showCart()" class="btn btn-secondary rounded-circle">
                                    <i class="fa fa-shopping-cart"></i>
                                    <c:if test="${size>0}">
                                        <div class="cart-amount">${size}</div>
                                    </c:if>
                                </a>
                                <a onclick="showCart()" class="nav-link text-dark text-uppercase" style="display:inline-block">Giỏ hàng</a>
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
                    <li style="margin-left: 30px;"><a href="search">Sản phẩm</a></li>                   
                    <li style="margin-left: 30px;"><a href="search">Thương hiệu <i class="fa fa-caret-down fa-css"></i></a>
                        <ul class="sub-menu">
                            <c:forEach var="o" items="${listB}">                               
                                <li><a href="search?bid=${o.bid}">${o.bname}</a></li>
                                </c:forEach>
                        </ul>
                    </li>   
                    <li style="margin-left: 30px;"><a href="blog">Tin Tức</a></li>                   
                    <li style="margin-left: 30px;"><a href="gioithieu.jsp">Giới thiệu</a></li>                   
                </ul>
            </nav>
        </div>

        <div id="showcart" style="margin-right: 120px;margin-top: -5px;width: 325px;">
            <c:set var="o" value="${sessionScope.cart}"/>
            <c:if test="${sessionScope.cart == null}">
                Chưa có sản phẩm nào trong giỏ hàng!
                <br>
                <hr>
            </c:if>
            <c:if test="${sessionScope.cart != null}">
                <a style="margin-left: 280px;font-size: 24px;color: red" onclick="showCart()"><i class="fa fa-close"></i></a>
                <div>
                    <table style="border-collapse: collapse;width: 100%">
                        <tbody>
                            <c:forEach items="${o.items}" var="i">
                                <tr> 
                                    <td class="img-style"><a href="detail?pid=${i.product.id}"><img src="${i.product.pimage.img1}" width="80px" height="60px"></a></td>
                                    <td style="margin: 0; padding: 3px;">
                                        <a href="detail?pid=${i.product.id}"><p style="color: red; margin: 0;"><fmt:formatNumber value="${i.price}"/> vnđ X ${i.quantity} </p>
                                            <p style="font-size: 14px; margin: 0; padding-top:3px;display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;overflow: hidden;" title="${i.product.name}">
                                                ${i.product.name}
                                            </p>
                                        </a>
                                    </td>
                                    <td>
                                        <a href="process?type=remove&id=${i.product.id}"><i class="fa fa-times text-danger"></i></a>
                                    </td>
                                </tr>  
                            </c:forEach>           
                        </tbody>
                    </table>
                </div>

                <br>
                <hr>
                <div style="padding-bottom:20px; color:red;">
                    Tổng giá: <b style="font-size: 20px;"><fmt:formatNumber value="${totalMoney}"/> vnđ</b>
                </div>
            </c:if>
            <div class="select-button">
                <a class="dropdown-item nutdangky text-center mb-2" href="Cart.jsp">View cart</a>
            </div>
        </div>

        <script type="text/javascript">
            function showCart() {
                var x = document.getElementById("showcart");
                if (x.style.display === "block") {
                    x.style.display = "none";
                } else {
                    x.style.display = "block";
                }
            }
        </script>
    </body>
</html>

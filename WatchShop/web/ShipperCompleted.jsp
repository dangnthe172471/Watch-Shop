<%-- 
    Document   : ShipperCompleted
    Created on : Jun 19, 2024, 8:00:29 PM
    Author     : quyld
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
        <link rel="stylesheet" href="css/shipper.css">
        <link rel="stylesheet" href="css/search-ship.css">
        <link rel="stylesheet" href="css/update-brand.css">
        <script type="text/javascript" src="js/main.js"></script>
        <script type="text/javascript" src="js/sort-order.js"></script>
        <script type="text/javascript" src="js/search-ship.js"></script>
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
        <jsp:include page="left.jsp" />
        <section id="content">
            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>Đơn Hoàn Thành</h1>                      
                    </div>
                </div>

                <div class="table-data">
                    <div class="order">
                        <div class="nav-bgg">
                            <nav class="containerr" style="padding-left: 0px" >
                                <ul class="main-menuu">
                                    <li><a style="padding-right: 0px" href="listorderaccept">Danh sách đơn</a></li>
                                    <li style="margin-left: 30px;"><a href="listorderdelivering">Đơn Đang giao</a></li>               
                                    <li style="margin-left: 30px;"><a href="listordercompleted">Đơn Hoàn Thành</a></li>         
                                </ul>
                            </nav>
                        </div>
                        <div class="search-container">
                            <form action="">
                                <input type="text" id="search-customer" placeholder="Tìm kiếm theo khách hàng">
                            </form>
                            <form action="">
                                <input type="text" id="search-sdt" placeholder="Tìm kiếm theo số điện thoại">
                            </form>
                            <form action="">
                                <input type="text" id="search-address" placeholder="Tìm kiếm theo địa chỉ">
                            </form>
                        </div>
                        <form action="listordercompleted">
                            <table id="orderTable">
                                <thead>
                                    <tr>
                                        <th style="display: none"></th>
                                        <th style="width: 110px">Khách hàng<span style="padding-left: 3px" class="sort-icon"></span></th>
                                        <th style="width: 110px">Số điện thoại<span style="padding-left: 3px" class="sort-icon"></span></th>
                                        <th style="width: 155px; padding-left:50px">Email<span style="padding-left: 3px" class="sort-icon"></span></th>
                                        <th style="width: 120px">Địa chỉ<span style="padding-left: 3px" class="sort-icon" onclick="sortTable(3, 'str')">⇅</span></th>
                                        <th style="width: 150px">Tổng tiền<span style="padding-left: 3px" class="sort-icon"></span></th>
                                        <th style="width: 150px">Ngày đặt<span style="padding-left: 3px" class="sort-icon" onclick="sortTable(5, 'str')">⇅</span></th>
                                        <th style="width: 150px">Ngày muốn giao<span style="padding-left: 3px" class="sort-icon" onclick="sortTable(6, 'str')">⇅</span></th>
                                        <th style="width: 100px">Thời gian muốn giao<span style="padding-left: 3px" class="sort-icon" onclick="sortTable(7, 'str')">⇅</span></th>
                                        <th style="width: 100px">Ngày nhận<span style="padding-left: 3px" class="sort-icon" onclick="sortTable(7, 'str')">⇅</span></th>
                                        <th style="width: 180px; padding-left:40px">Ghi chú</th>
                                        <th>Trạng thái</th>
                                    </tr>                                   
                                </thead>
                                <tbody>
                                    <c:forEach items="${order}" var="o">
                                        <tr>
                                            <td>${o.account.user}</td> 
                                            <td>${o.phone}</td>
                                            <td>${o.email}</td>
                                            <td>${o.address}</td>
                                            <td><fmt:formatNumber value="${o.totalMoney}" /></td>
                                            <td>${o.date}</td>
                                            <td>${o.dateShip}</td>
                                            <td>${o.timeShip}</td>
                                            <td>${o.receivedDate}</td>
                                            <td>${o.note}</td>  
                                            <td>
                                                <c:choose>
                                                    <c:when test="${o.type == 0}">
                                                        Đã thanh toán
                                                    </c:when>
                                                    <c:when test="${o.type == 1}">
                                                        Chưa thanh toán
                                                    </c:when>
                                                    <c:otherwise>
                                                        Không xác định
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>  
                                        </tr> 
                                    </c:forEach>
                                </tbody>
                            </table>
                        </form>

                    </div>                  
                </div>
            </main>
            <script type="text/javascript">
                function doCAccept(oid) {
                    if (confirm('Xác nhận đơn hàng giao thành công')) {
                        window.location = 'accept?oid=' + oid;
                    }
                }
            </script>
            <script type="text/javascript">
                function doCanceled(oid) {
                    if (confirm('Xác nhận hủy đơn hàng')) {
                        window.location = 'canceled?oid=' + oid;
                    }
                }
            </script>
            <script src="js/script.js"></script>
    </body>
</html>

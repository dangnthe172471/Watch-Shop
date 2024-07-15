<%-- 
    Document   : ShipperDelivering
    Created on : Jul 6, 2024, 8:43:11 PM
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
        <style>
        .custom-button {
            background-color: #2196F3;
            height: 35px; /* Tăng chiều cao để chữ rõ hơn */
            width: 100px; /* Điều chỉnh lại width cho phù hợp */
            border: none;
            border-radius: 10px; /* Bo tròn góc */
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: background-color 0.3s ease;
            overflow: hidden; /* Ẩn phần chữ vượt quá */
            white-space: nowrap; /* Không ngắt dòng */
        }

        .custom-button a {
            color: white;
            text-decoration: none;
            font-size: 14px; /* Tăng kích thước chữ */
            font-weight: bold;
            display: block;
            width: 100%;
            text-align: center;
            line-height: 35px; /* Căn giữa theo chiều dọc */
            overflow: hidden; /* Ẩn phần chữ vượt quá */
            white-space: nowrap; /* Không ngắt dòng */
        }

        .custom-button:hover {
            background-color: lightgreen; /* Thêm hiệu ứng khi rê chuột */
        }
    </style>
    </head>
    <body>
        <jsp:include page="left.jsp" />
        <section id="content">
            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>Đơn Đang Vận Chuyển</h1>
                    </div>
                </div>

                <div class="table-data">
                    <div class="order">
                        <div class="nav-bgg">
                            <nav class="containerr" style="padding-left: 0px">
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
                        <form action="listorderdelivering">
                            <table id="orderTable">
                                <thead>
                                    <tr>
                                        <th style="display: none"></th>
                                        <th style="width: 110px">Khách hàng<span style="padding-left: 3px" class="sort-icon" onclick="sortTable(0, 'str')">⇅</span></th>
                                        <th style="width: 110px">Số điện thoại<span style="padding-left: 3px" class="sort-icon" onclick="sortTable(1, 'str')">⇅</span></th>
                                        <th style="width: 155px; padding-left:50px">Email<span style="padding-left: 3px" class="sort-icon" onclick="sortTable(2, 'str')">⇅</span></th>
                                        <th style="width: 120px">Địa chỉ<span style="padding-left: 3px" class="sort-icon" onclick="sortTable(3, 'str')">⇅</span></th>
                                        <th style="width: 150px">Tổng tiền<span style="padding-left: 3px" class="sort-icon" onclick="sortTable(4, 'num')">⇅</span></th>
                                        <th style="width: 150px">Ngày đặt<span style="padding-left: 3px" class="sort-icon" onclick="sortTable(5, 'str')">⇅</span></th>
                                        <th style="width: 150px">Ngày muốn giao<span style="padding-left: 3px" class="sort-icon" onclick="sortTable(6, 'str')">⇅</span></th>
                                        <th style="width: 100px">Thời gian muốn giao<span style="padding-left: 3px" class="sort-icon" onclick="sortTable(7, 'str')">⇅</span></th>
                                        <th style="width: 180px; padding-left:40px">Ghi chú</th>
                                        <th style="width: 60px;"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${order1}" var="o">
                                        <tr>
                                            <td style="display: none">${o.oid}</td>
                                            <td>${o.account.user}</td>
                                            <td>${o.phone}</td>
                                            <td>${o.email}</td>
                                            <td>${o.address}</td>
                                            <td><fmt:formatNumber value="${o.totalMoney}" /></td>
                                            <td>${o.date}</td>
                                            <td>${o.dateShip}</td>
                                            <td>${o.timeShip}</td>
                                            <td></td>
                                            <td>
                                                <button class="custom-button" onclick="doOrder1('${o.oid}')">
                                                    <a style="font-size: 11px">Đang Vận chuyển</a>
                                                </button>                                                     
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <c:forEach items="${order}" var="o">
                                        <tr>
                                            <td style="display: none">${o.oid}</td>
                                            <td>${o.account.user}</td>
                                            <td>${o.phone}</td>
                                            <td>${o.email}</td>
                                            <td>${o.address}</td>
                                            <td><fmt:formatNumber value="${o.totalMoney}" /></td>
                                            <td>${o.date}</td>
                                            <td>${o.dateShip}</td>
                                            <td>${o.timeShip}</td>
                                            <td>${o.note}</td> 
                                            <td>
                                                <button class="custom-button" onclick="doOrder('${o.oid}')">
                                                    <a>Lấy Đơn</a>
                                                </button>
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
                function doOrder(id) {
                    if (confirm('Xác nhận vận chuyển đơn hàng')) {
                        window.location = 'delivery?oid=' + id;
                    }
                }
            </script>
            <script type="text/javascript">
                function doOrder1(id) {
                    if (confirm('Xác nhận giao hàng thành công')) {
                        window.location = 'accept?oid=' + id;
                    }
                }
            </script>
            <script src="js/script.js"></script>
        </section>
    </body>

</html>

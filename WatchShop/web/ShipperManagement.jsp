<%-- 
    Document   : ShipperManagement
    Created on : Jun 11, 2024, 12:57:12 PM
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
                    <h1>Danh sách đơn</h1>
                </div>
            </div>
            <div class="table-data">
                <div class="order">
                    <div class="nav-bgg">
                        <nav class="containerr" style="padding-left: 0px">
                            <ul class="main-menuu">
                                <li><a style="padding-right: 0px" href="listorder">Danh sách đơn</a></li>
                                <li style="margin-left: 30px;"><a href="listorderaccept">Đơn đã xác nhận</a></li>
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
                    <form action="listorder">
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
                                <c:forEach items="${order}" var="o">
                                    <tr>
                                        <td style="display: none">${o.oid}</td>
                                        <td>${o.account.user}</td>
                                        <td>${o.phone}</td>
                                        <td>${o.email}</td>
                                        <td>${o.address}</td>
                                        <td><fmt:formatNumber value="${o.totalMoney}"/></td>
                                        <td>${o.date}</td>
                                        <td>${o.dateShip}</td>
                                        <td>${o.timeShip}</td>
                                        <td>${o.note}</td>
                                        <td>
                                            <a class="btn btn-primary editbtn" data-id="${o.oid}" data-address="${o.address}">
                                                <i class="material-icons" style="font-size:15px">edit</i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </main>

        <form action="assignShipper" method="post" id="editBrandForm">
            <div class="modal fade" id="editmodal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Chỉnh sửa</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;"></button>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" name="oid" id="update_id">
                            <label>Địa chỉ</label>
                            <input type="text" name="address" id="update_address" class="form-control">
                            <label>Chọn người vận chuyển</label>
                            <select name="shipper" id="update_shipper" class="form-control">
                                <option value="">Chọn người vận chuyển</option>
                                <c:forEach var="shipper" items="${shippers}">
                                    <option value="${shipper.id}">${shipper.user}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Thoát</button>
                            <button type="submit" name="update" class="btn btn-primary">Cập nhật</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function() {
                $('.editbtn').on('click', function() {
                    $('#editmodal').modal('show');
                    $tr = $(this).closest('tr');
                    var data = $tr.children("td").map(function() {
                        return $(this).text();
                    }).get();
                    console.log(data);
                    $('#update_id').val(data[0].trim());
                    $('#update_address').val(data[4].trim());

                    // Load danh sách người vận chuyển từ server
                    $.ajax({
                        url: 'getShippers',
                        method: 'GET',
                        success: function(data) {
                            var shipperSelect = $('#update_shipper');
                            shipperSelect.empty();
                            shipperSelect.append('<option value="">Chọn người vận chuyển</option>');
                            $.each(data, function(index, value) {
                                shipperSelect.append('<option value="' + value.id + '">' + value.user + '</option>');
                            });
                        }
                    });
                });
            });
        </script>
    </section>
</body>
</html>


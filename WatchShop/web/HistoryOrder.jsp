<%-- 
    Document   : HistoryOrder
    Created on : Jul 4, 2024, 3:29:52 PM
    Author     : dung2
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/style.css">
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- My CSS -->
        <link rel="stylesheet" href="css/manage.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/home.css">        
        <link rel="stylesheet" href="css/nav.css">
        <link rel="stylesheet" href="css/profile.css">
        <script type="text/javascript" src="js/main.js"></script>
        <link rel="stylesheet" type="text/css" href="slick/slick.css" />
        <link rel="stylesheet" type="text/css" href="slick/slick-theme.css" />
        <script type="text/javascript" src="slick/slick.min.js"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background: #eee;
            }
            .panel-order .row {
                border-bottom: 1px solid #ccc;
            }
            .panel-order .row:last-child {
                border: 0px;
            }
            .panel-order .row .col-md-1 {
                text-align: center;
                padding-top: 15px;
            }
            .panel-order .row .col-md-1 img {
                width: 50px;
                max-height: 50px;
            }
            .panel-order .row .row {
                border-bottom: 0;
            }
            .panel-order .row .col-md-11 {
                border-left: 1px solid #ccc;
            }
            .panel-order .row .row .col-md-12 {
                padding-top: 7px;
                padding-bottom: 7px;
            }
            .panel-order .row .row .col-md-12:last-child {
                font-size: 11px;
                color: #555;
                background: #efefef;
            }
            .panel-order .btn-group {
                margin: 0px;
                padding: 0px;
            }
            .panel-order .panel-body {
                padding-top: 0px;
                padding-bottom: 0px;
            }
            .panel-order .panel-deading {
                margin-bottom: 0;
            }
        </style>
    </head>
    <body>
        <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" />
        <jsp:include page="leftprofile.jsp" />
        <section id="content">  
            <div class="panel panel-default panel-order">
                <div class="panel-heading">
                    <strong>Đơn Hàng Đã Đặt</strong>
                    <div class="btn-group pull-right">
                        <div class="btn-group">
                            <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">Trạng Thái <i class="fa fa-filter"></i></button>
                            <ul class="dropdown-menu dropdown-menu-right">
                                <li><a href="orderHistory?status=Chờ giao hàng">Chờ giao hàng</a></li>
                                <li><a href="orderHistory?status=Đã nhận đơn">Đã nhận đơn</a></li>
                                <li><a href="orderHistory?status=Đang giao hàng">Đang giao hàng</a></li>
                                <li><a href="orderHistory?status=Hoàn thành">Hoàn thành</a></li>
                                <li><a href="orderHistory?status=Đã hủy">Đã hủy</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <c:forEach var="order" items="${orders}">
                        <div class="row">
                            <div class="col-md-1"><img src="${order.productImage}" class="media-object img-thumbnail" /></div>
                            <div class="col-md-11">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="pull-right"><label class="label label-danger">${order.orderStatus}</label></div>
                                        <span><strong>${order.productName}</strong></span><br/>
                                        Số lượng: ${order.quantity}, Giá tiền:  ${order.formattedTotalPrice} <br/>
                                        <a data-toggle="modal" data-target="#orderModal" data-orderid="${order.orderId}" class="btn btn-success btn-xs" href="#" title="View"><i class="fa fa-eye"></i></a>
                                        <a data-orderid="${order.orderId}" data-orderstatus="${order.orderStatus}" class="btn btn-danger btn-xs glyphicon glyphicon-trash delete-order" href="#" title="Delete"></a>
                                    </div>
                                    <div class="col-md-12">Đơn hàng được thực hiện vào: ${order.orderDate}</div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="orderModal" tabindex="-1" role="dialog" aria-labelledby="orderModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="orderModalLabel">Theo dõi đơn hàng của bạn</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div id="orderTrackingContent"></div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <script>
            $(document).ready(function () {
                $('#orderModal').on('show.bs.modal', function (event) {
                    var button = $(event.relatedTarget);
                    var orderId = button.data('orderid');
                    $.get('ordertracking', {orderId: orderId}, function (data) {
                        $('#orderTrackingContent').html(data);
                    });
                });
            });
        </script>
        <script>
            $(document).ready(function () {
                $('.delete-order').click(function (e) {
                    e.preventDefault();
                    var orderId = $(this).data('orderid');
                    var orderStatus = $(this).data('orderstatus');

                    if (orderStatus === 'Chờ giao hàng') {
                        if (confirm('Bạn có chắc chắn muốn hủy đơn hàng này không?')) {
                            $.ajax({
                                url: 'CancelOrderServlet',
                                type: 'POST',
                                data: {orderId: orderId},
                                success: function (response) {
                                    if (response === 'success') {
                                        alert('Đơn hàng đã được hủy.');
                                        location.reload();
                                    } else {
                                        alert('Không thể hủy đơn hàng.');
                                    }
                                },
                                error: function () {
                                    alert('Lỗi khi hủy đơn hàng.');
                                }
                            });
                        }
                    } else if (orderStatus === 'Đã hủy') {
                        if (confirm('Bạn có chắc chắn muốn xóa đơn hàng này không?')) {
                            $.ajax({
                                url: 'DeleteOrderServlet',
                                type: 'POST',
                                data: {orderId: orderId},
                                success: function (response) {
                                    if (response === 'success') {
                                        alert('Đơn hàng đã được xóa.');
                                        location.reload();
                                    } else {
                                        alert('Không thể xóa đơn hàng.');
                                    }
                                },
                                error: function () {
                                    alert('Lỗi khi xóa đơn hàng.');
                                }
                            });
                        }
                    } else {
                        alert('Không thể hủy hoặc xóa đơn hàng ở trạng thái hiện tại.');
                    }
                });
            });
        </script>



        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="js/script.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>

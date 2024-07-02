<%-- 
    Document   : statistical3
    Created on : Jul 2, 2024, 5:29:28 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

        <script src="https://cdn.sheetjs.com/xlsx-0.20.2/package/dist/xlsx.full.min.js"></script>
    </head>
    <body>
        <jsp:include page="left.jsp" />
        <section id="content">     
            <main>
                <div class="head-title">
                    <div class="left">
                        <a href="statistical2" class="btn btn-primary" style="color: white; margin-top: -50px">Quay lại</a>
                        <h1>Doanh thu</h1>                      
                    </div>
                    <div class="action btn btn-primary" style="margin-right: 80px;">
                        <button style="border: none;" class="btn btn-primary"><i class='bx bxs-cloud-download'></i>
                            Xuất file Xlsx
                        </button>    
                    </div>
                </div>
                <form action="statistical3">
                    <select name="year" onchange="this.form.submit()" style="font-size: 20px; margin-left: 38px;">
                        <c:forEach begin="${minYear}" end="${maxYear}" var="i">
                            <option ${year==i?'selected':''} value="${i}">${i}</option>
                        </c:forEach>
                    </select>
                </form>
                <div class="container">
                    <canvas id="myChart"></canvas>
                </div>
            </main>
            <!-- MAIN -->
            <table id="tableExcel" style="display:none">
                <thead>
                    <tr>
                        <th>Mã đơn hàng</th>
                        <th>Sản phẩm</th>
                        <th>Thương hiệu</th>
                        <th>Số lượng</th>
                        <th>Người mua</th>
                        <th>Ngày mua</th>
                        <th>Tổng tiền</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listOD}" var="o">
                        <tr>
                            <td>${o.order.oid}</td>
                            <td>                        
                                ${o.product.name}   
                            </td>
                            <td>
                                <c:forEach items="${listB}" var="b">
                                    ${o.product.brandID==b.bid?b.bname:''}   
                                </c:forEach>
                            </td>
                            <td>
                                ${o.quantity}
                            </td>
                            <td>${o.order.account.user}</td>
                            <td>${o.order.date}</td>
                            <td><fmt:formatNumber value="${o.order.totalMoney}"/></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </section>
        <!-- CONTENT -->
    </body>
    <script>
        // Lấy dữ liệu JSON từ servlet và parse nó
        var monthData = JSON.parse('${totalsByMonths}');
        var yValues = [];

        for (let i = 0; i < 12; i++) {
            yValues.push(monthData[i]);
        }

        var xValues = ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"];
        var barColors = ["red", "blue", "green", "yellow", "orange", "purple", "pink", "cyan", "magenta", "teal", "brown", "grey"];

        new Chart("myChart", {
            type: "bar",
            data: {
                labels: xValues,
                datasets: [{
                        backgroundColor: barColors,
                        data: yValues
                    }]
            },
            options: {
                legend: {display: false},
                title: {
                    display: true,
                    text: "Thống kê chi tiết từng năm"
                },
                scales: {
                    yAxes: [{
                            ticks: {
                                callback: function (value) {
                                    return value.toLocaleString('vi-VN'); // Định dạng số trên trục y
                                }
                            }
                        }]
                }
            }
        });
    </script>
    <script src="js/script.js"></script>
    <script src="js/table.js"></script>
</html>


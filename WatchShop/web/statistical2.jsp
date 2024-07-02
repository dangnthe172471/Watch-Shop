<%-- 
    Document   : statistical
    Created on : Jun 30, 2024, 1:32:30 AM
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

        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

        <script src="https://cdn.sheetjs.com/xlsx-0.20.2/package/dist/xlsx.full.min.js"></script>
    </head>
    <body>
        <jsp:include page="left.jsp" />
        <section id="content">     
            <main>
                <div class="head-title">
                    <div class="left">
                        <a href="statistical" class="btn btn-primary" style="color: white; margin-top: -50px">Quay lại</a>
                        <h1>Doanh thu</h1>                      
                    </div>
                    <div class="action btn btn-primary" style="margin-right: 80px;">
                        <button style="border: none;" class="btn btn-primary"><i class='bx bxs-cloud-download'></i>
                            Xuất file Xlsx
                        </button>    
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-7">
                        <div
                            id="myChart" style="width:100%;max-width:680px;">
                        </div>
                        <canvas id="myChart1" style="width:100%;max-width:680px"></canvas>
                    </div>
                    <div class="col-md-4" style="text-align: center;border: 1px solid;padding: 10px;box-shadow: 5px 5px 3px 3px #AAA;">                           
                        <h3>Top khách hàng tiềm năng </h3>
                        <div class="row" style="height: 255px;">
                            <div class="col-md-6">
                                Tên<br><br><hr>
                                <c:forEach items="${listA}" var="a">
                                    <div style="display: flex; align-items: center;margin-left: 55px;;">
                                        <img src="${a.avatar}" style="width: 45px;height: 45px;border-radius: 50%" />
                                        <h6 style="margin-left: 10px;font-size:20px; padding-top: 10px; ">${a.user}</h6>
                                    </div><br><br><hr>
                                </c:forEach>
                            </div>
                            <div class="col-md-6">
                                Số sản phẩm đã mua<br><br><hr>
                                <c:forEach items="${listA}" var="a">
                                    <h6 style="font-size: 22px;padding-top: 8px;height: 36px;"> ${a.bought}</h6><br><br><hr>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>

                <a class="btn btn-primary" href="statistical3?year=${maxYear}" style="margin: 20px 320px;">Chi tiết</a>
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
                    <c:forEach items="${listO}" var="o">
                        <tr>
                            <td>${o.oid}</td>
                            <td>                        
                                <c:forEach items="${listOD}" var="od">
                                    ${o.oid==od.order.oid?od.product.name:''}   
                                </c:forEach>
                            </td>
                            <td>
                                <c:forEach items="${listOD}" var="od">
                                    <c:forEach items="${listB}" var="b">
                                        ${o.oid==od.order.oid?(od.product.brandID==b.bid?b.bname:''):''}   
                                    </c:forEach>
                                </c:forEach>
                            </td>
                            <td>
                                <c:forEach items="${listOD}" var="od">
                                    ${o.oid==od.order.oid?od.quantity:''}
                                </c:forEach>
                            </td>
                            <td>${o.account.user}</td>
                            <td>${o.date}</td>
                            <td><fmt:formatNumber value="${o.totalMoney}"/></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </section>
        <!-- CONTENT -->
    </body>
    <script src="js/script.js"></script>
    <script src="js/table.js"></script>

    <script>
        google.charts.load('current', {'packages': ['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            const listB = ${listBname};
            const datatable = ${data};
            const charData = [['Watch', 'Mh1']];
            for (let i = 0; i < listB.length; i++) {
                const brand = listB[i];
                const sum = datatable[i];
                if (sum === 0) {
                    charData.push([brand.bname, 1]);
                } else {
                    charData.push([brand.bname, sum]);
                }
            }
            const data = google.visualization.arrayToDataTable(charData);

            const options = {
                title: 'Tỷ lệ đồng hồ bán được',
                is3D: true
            };

            const chart = new google.visualization.PieChart(document.getElementById('myChart'));
            chart.draw(data, options);
        }
    </script>
    <script>
        const minYear = ${requestScope.minYear};
        const maxYear = ${requestScope.maxYear};
        const yearData = ${years};

        const labels = [];
        const data = [];

        for (let i = minYear; i <= maxYear; i++) {
            labels.push(i);
            data.push(yearData[i - minYear]);
        }

        new Chart("myChart1", {
            type: "line",
            data: {
                labels: labels,
                datasets: [{
                        label: "Doanh thu",
                        data: data,
                        backgroundColor: "rgba(0,156,255,0.5)"
                    }]
            },
            options: {
                responsive: true,
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
</html>

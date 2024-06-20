<%-- 
    Document   : ShipperAccept
    Created on : Jun 19, 2024, 7:59:11 PM
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
       <jsp:include page="left.jsp" />
        <section id="content">
            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>Đơn hoàn thành</h1>                      
                    </div>
                </div>
                
                <div class="table-data">
                    
                    <div class="order">
                        <div class="nav-bgg">
                            <nav class="containerr" style="padding-left: 0px">
                                <ul class="main-menuu">
                                    <li><a style="padding-right: 0px" href="listorder">Danh sách đơn</a></li>
                                    <li style="margin-left: 30px;"><a href="listordercompleted">Đơn nhận</a></li>               
                                    <li style="margin-left: 30px;"><a href="listorderaccept">Đơn Hoàn Thành</a></li>               
                                    <li style="margin-left: 30px;"><a href="blockc">Đơn Hủy</a></li>               
                                </ul>
                            </nav>
                        </div>
<!--                        <div class="head">
                            <h3>Danh sách</h3>
                            <i class='bx bx-search' ></i>
                            <a href="#"><i class='bx bx-filter' ></i></a> 
                        </div>-->
                        
                        <form action="listorderaccept">
                            <table>
                                <thead>
                                    <tr>
                                        <th style="width: 7px"></th>
                                        <th>Khách hàng</th>
                                        <th>Sđt</th>
                                        <th>Email</th>
                                        <th>Address</th>
                                        <th>TotalMoney</th>
                                        <th>Note</th>
                                        
                                        <th style="width: 100px;"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${order}" var="o">
                                        <tr>
                                            <td><p style="display: none ">${o.oid}</p></td>
                                            <td>${o.account}</td> 
                                            <td>${o.phone}</td>
                                            <td>${o.email}</td>
                                            <td>${o.address}</td>
                                            <td><fmt:formatNumber value="${o.totalMoney}"/></td>
                                            <td></td> 
                                            <td>
                                                <a href="#" onclick="doDelete('${b.bid}')"><i class="fa fa-trash"></i></a>
                                            </td>
                                        </tr> 
                                    </c:forEach>
                                </tbody>
                            </table>
                        </form>

                    </div>                  
                </div>
            </main>

        <script src="js/script.js"></script>
    </body>
</html>
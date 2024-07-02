<%-- 
    Document   : AdminManage
    Created on : May 18, 2024, 7:21:38 PM
    Author     : admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    </head>
    <body>
        <jsp:include page="left.jsp" />
        <section id="content">     
            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>Thống kê</h1>                      
                    </div>
                </div>

                <ul class="box-info">
                    <li>
                        <a href="#" style="display: flex; text-align: left">
                            <i class='bx bxs-calendar-check'></i>
                            <span class="text" style="margin-left: 30px;">
                                <h3>${countOrder}</h3>
                                <p>Tổng đặt hàng hoàn thành</p>
                            </span>
                        </a>
                    </li>
                    <li>
                        <a href="#" style="display: flex; text-align: left">
                            <i class='bx bxs-group'></i>
                            <span class="text" style="margin-left: 30px;">
                                <h3>${countAccount}</h3>
                                <p>Số khách hàng</p>
                            </span>
                        </a>
                    </li>
                    <li>
                        <a href="statistical2" style="display: flex; text-align: left">
                            <i class='bx bxs-dollar-circle'></i>
                            <span class="text" style="margin-left: 30px;">
                                <h3><fmt:formatNumber value="${totalM}"/> vnđ</h3>
                                <p>Tổng số tiền đã bán</p>
                            </span> 
                        </a>
                    </li>
                </ul>

                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <h3>Sản phẩm bán chạy</h3>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th style="text-align: center;width: 150px;">Mã Sản phẩm</th>
                                    <th style="text-align: center;width: 350px;">Sản phẩm</th>
                                    <th style="text-align: center;width: 300px;">Thương hiệu</th>
                                    <th style="text-align: center;width: 200px;">Thể loại</th>
                                    <th style="text-align: center;width: 200px;">Giá</th>
                                    <th style="text-align: center;width: 200px;">Đã bán</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td style="text-align: center;display: table-cell;vertical-align: middle;">${p.code}</td>
                                    <td style="text-align: center">
                                        <p style="display: -webkit-box;-webkit-line-clamp: 1;-webkit-box-orient: vertical;overflow: hidden">${p.name}</p>
                                        <img src="${p.pimage.img1}" style="width: 150px;height: 150px">
                                    </td>
                                    <td style="text-align: center">
                                        <c:forEach items="${listB}" var="b">
                                            ${b.bid == p.brandID ?b.bname:''}
                                        </c:forEach>
                                    </td >
                                    <td style="text-align: center;text-align: center;padding: 0 10px">
                                        <c:forEach items="${listC}" var="c">
                                            <c:if test="${c.cid == p.cateID1}">
                                                ${c.cname}<br>
                                            </c:if>
                                            <c:if test="${c.cid == p.cateID2}">
                                                Độ chống nước: ${c.cname}<br>
                                            </c:if>
                                            <c:if test="${c.cid == p.cateID3}">
                                                Đường kính mặt số: ${c.cname}<br>
                                            </c:if>
                                        </c:forEach>
                                    </td>
                                    <td style="text-align: center"><fmt:formatNumber value="${p.price}"/></td>
                                    <td style="text-align: center">${p.sold}</td>
                                </tr>                                
                            </tbody>
                        </table>
                    </div>                  
                </div>
                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <h3>Sản phẩm bán chậm</h3>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th style="text-align: center;width: 150px;">Mã Sản phẩm</th>
                                    <th style="text-align: center;width: 350px;">Sản phẩm</th>
                                    <th style="text-align: center;width: 300px;">Thương hiệu</th>
                                    <th style="text-align: center;width: 200px;">Thể loại</th>
                                    <th style="text-align: center;width: 200px;">Giá</th>
                                    <th style="text-align: center;width: 200px;">Đã bán</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td style="text-align: center;display: table-cell;vertical-align: middle;">${p1.code}</td>
                                    <td style="text-align: center">
                                        <p style="display: -webkit-box;-webkit-line-clamp: 1;-webkit-box-orient: vertical;overflow: hidden">${p1.name}</p>
                                        <img src="${p1.pimage.img1}" style="width: 150px;height: 150px">
                                    </td>
                                    <td style="text-align: center">
                                        <c:forEach items="${listB}" var="b">
                                            ${b.bid == p1.brandID ?b.bname:''}
                                        </c:forEach>
                                    </td >
                                    <td style="text-align: center;text-align: center;padding: 0 10px">
                                        <c:forEach items="${listC}" var="c">
                                            <c:if test="${c.cid == p1.cateID1}">
                                                ${c.cname}<br>
                                            </c:if>
                                            <c:if test="${c.cid == p1.cateID2}">
                                                Độ chống nước: ${c.cname}<br>
                                            </c:if>
                                            <c:if test="${c.cid == p1.cateID3}">
                                                Đường kính mặt số: ${c.cname}<br>
                                            </c:if>
                                        </c:forEach>
                                    </td>
                                    <td style="text-align: center"><fmt:formatNumber value="${p1.price}"/></td>
                                    <td style="text-align: center">${p1.sold}</td>
                                </tr>                                
                            </tbody>
                        </table>
                    </div>                  
                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- CONTENT -->
        <script src="js/script.js"></script>
    </body>
</html>

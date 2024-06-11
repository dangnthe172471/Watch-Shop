<%-- 
    Document   : BlockBrand
    Created on : Jun 11, 2024, 8:54:18 PM
    Author     : quyld
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
    </head>
    <body>
        <jsp:include page="left.jsp" />
        <section id="content">
            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>Thương Hiệu </h1>                      
                    </div>
                </div>
                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <h3>Quản Lý</h3>
                            <!--<i class='bx bx-search' ></i>-->
                            <a href="#"><i class='bx bx-filter' ></i></a> 
                        </div>
                        <div class="nav-bg">
                            <nav class="container" style="padding:0px ">
                                <ul class="main-menu">
                                    <li><a style="padding-right: 0px" href="brand">Danh sách</a></li>
                                    <li style="margin-left: 30px;"><a href="blockb">Danh sách Tạm Ẩn</a></li>               
                                </ul>
                            </nav>
                        </div>
                        <form action="blockb">
                            <table>
                                <thead>
                                    <tr>
                                        <th style="width: 200px; padding-left: 5px">Thương hiệu</th>
                                        <th style="width: 200px;">Hình ảnh</th>
                                        <th style="width: 100px;"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listb}" var="b">
                                        <tr>
                                            <td><p style="display: none ">${b.bid}</p></td>
                                            <td>${b.bname}</td> 
                                            <td><p style="display: none ">${b.image}</p>
                                                <img src="${b.image}" style="width: 150px;height: 150px;border-radius: 0" />
                                            </td>
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
        </section>
    </body>
</html>

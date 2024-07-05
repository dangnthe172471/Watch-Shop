<%-- 
    Document   : BlockCustomer
    Created on : Jul 5, 2024, 7:40:22 PM
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
        <link rel="stylesheet" href="css/shipper.css">
        <link rel="stylesheet" href="css/search-mana.css">
        <link rel="stylesheet" href="css/update-brand.css">
        <script type="text/javascript" src="js/main.js"></script>
        <script type="text/javascript" src="js/brand.js"></script>
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
                        <h1>Thương Hiệu</h1>                      
                    </div>
                </div>
                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <h3>Quản Lý</h3>
                            <form action="" id="search-box">
                                <input type="text" id="search-text" placeholder="Tìm kiếm ">
                                <button id="search-btn"><i class='bx bx-search'></i></button>
                            </form> 
                        </div>
                        <div class="nav-bgg">
                            <nav class="containerr" style="padding:0px ; width: 30%">
                                <ul class="main-menuu">
                                    <li><a style="padding-left: 7px" href="managercustomer">Danh sách</a></li>
                                    <li style="margin-left: 30px;"><a href="customerblockk">Danh sách Xóa</a></li>                  
                                </ul>
                            </nav>
                        </div>
                        <form action="customerblockk">
                            <table>
                                <thead>
                                    <tr>
                                        <th ></th>
                                        <th style="width: 200px;">Tên </th>
                                        <th style="width: 200px;">Ảnh</th>
                                        <th>Email</th>
                                        <th>Sđt</th>
                                        <th>Địa chỉ</th>
                                        <th style="width: 100px;"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${lista}" var="a">
                                        <tr>
                                            <td><p style="display: none ">${a.id}</p></td>
                                            <td>${a.user}</td> 
                                            <td><p style="display: none ">${a.avatar}</p>
                                                <img src="${a.avatar}" style="width: 150px;height: 150px;border-radius: 0" />
                                            </td>
                                            <td>
                                                ${a.email}
                                            </td> 
                                            <td>
                                                ${a.phone}
                                            </td> 
                                            <td>
                                                ${a.address}
                                            </td> 
                                            <td>
                                                <a href="#" onclick="doDelete('${a.id}')"><i class="fa fa-trash"></i></a>
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
            function doDelete(id) {
                if (confirm('Bạn có muốn bỏ chặn khách hàng này không này ?')) {
                    window.location = 'restorecustomer?id=' + id;
                }
            }
        </script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
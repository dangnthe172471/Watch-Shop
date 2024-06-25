<%-- 
    Document   : ManagerStaff
    Created on : Jun 26, 2024, 2:32:05 AM
    Author     : dung2
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <style>
            /* Custom CSS for modal and other elements */
            .modal-header {
                background-color: #007bff;
                color: white;
            }

            .modal-title {
                margin: 0 auto;
            }

            .table {
                margin-top: 20px;
            }

            .table th, .table td {
                text-align: center;
                vertical-align: middle;
            }

            .form-control {
                margin-bottom: 15px;
            }

            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
            }

            .btn-danger {
                background-color: #dc3545;
                border-color: #dc3545;
            }
        </style>
    </head>
    <body>
        <jsp:include page="left.jsp" />
        <section id="content">
            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>Quản Lý Nhân Viên</h1>    

                    </div>
                </div>
                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <h3>Nhân Viên</h3>
                            <form action="searchstaff" id="search-box">
                                <input type="text" id="search-text" placeholder="Tìm kiếm nhân viên" onkeyup="searchStaff()">
                                <button id="search-btn"><i class='bx bx-search'></i></button>
                            </form>
                            <a href="#" class="btn btn-primary addbtn">Thêm Nhân Viên</a>
                        </div>
                        <div class="nav-bgg">
                            <nav class="containerr" style="padding:0px ; width: 30%">
                                <ul class="main-menuu">
                                    <li><a style="padding-left: 7px" href="staff">Danh sách</a></li>
                                    <li style="margin-left: 30px;"><a href="showstaffblock">Danh sách Xóa</a></li>                  
                                </ul>
                            </nav>
                        </div>
                        <form action="staff">
                            <table>
                                <thead>
                                    <tr>

                                        <th>Avatar</th>
                                        <th>Tên đăng nhập</th>
                                        <th>Email</th>
                                        <th>Số điện thoại</th>
                                        <th>Địa chỉ</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listacc}" var="account">
                                        <tr>

                                            <td><img src="${account.avatar}" alt="Avatar" width="50" height="50"/></td>
                                            <td>${account.user}</td>
                                            <td>${account.email}</td>
                                            <td>${account.phone}</td>
                                            <td>${account.address}</td>
                                            <td>

                                                <a href="#" onclick="doDelete('${account.id}')"><i class="fa fa-trash"></i></a>
                                            </td>

                                        </tr> 
                                    </c:forEach>
                                </tbody>
                            </table>
                        </form>
                    </div>                  
                </div>
            </main>
            <!-- The Modal Add -->
            <form action="addstaff" method="post" id="addStaffForm">
                <div class="modal fade" id="addmodal">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header text-center">
                                <h4 class="modal-title w-100">Thêm Nhân Viên</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="username">Tên đăng nhập:</label>
                                     <div id="whitespaceMessage"></div>
                                    <div id="usernameMessage" ></div>
                                    <input type="text" class="form-control" name="user" id="username" required oninput="validateUsername()">
                                </div>
                                <div class="form-group">
                                    <label for="pass">Password:</label>
                                    <div id="passwordMessage" ></div>
                                    <input type="password" class="form-control" name="pass" id="password" required oninput="validatePassword()">
                                </div>
                                <div class="form-group">
                                    <label for="email">Email:</label>
                                    <div id="emailMessage" ></div>
                                    <input type="email" class="form-control" name="email" id="email" required oninput="validateEmail()">
                                </div>
                                <div class="form-group">
                                    <label for="phone">Phone:</label>
                                    <div id="phoneMessage" ></div>
                                    <input type="text" class="form-control" name="phone" id="phoneNumber" required oninput="validatePhoneNumber()">
                                </div>
                                <div class="form-group">
                                    <label for="address">Address:</label>
                                    <div id="naddressMessage" "></div>
                                    <input type="text" class="form-control" name="address" id="newaddress" required oninput="validateAddressStaff()">
                                </div>
                                <div class="form-group" hidden>
                                    <label for="avatar">Avatar:</label>
                                    <input type="text" class="form-control" name="avatar" id="avatar" placeholder="img/avata.jpg" value="img/avata.jpg" required>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Thoát</button>
                                <button type="submit" class="btn btn-primary">Thêm</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </section>

        <script type="text/javascript">
            
            $(document).ready(function () {
                $('.addbtn').on('click', function () {
                    $('#addmodal').modal('show');
                });
            });
            function doDelete(id) {
                if (confirm('Bạn có muốn xóa Nhân Viên này ?')) {
                    window.location = 'deletestaff?id=' + id;
                }
            }
            function searchStaff() {
                var searchText = document.getElementById("search-text").value;
                if (searchText.trim() === "") {
                    return;
                }

                $.ajax({
                    url: 'searchstaff',
                    type: 'GET',
                    data: {searchText: searchText},
                    success: function (data) {
                        $('#staff-table-body').html($(data).find('#staff-table-body').html());
                    }
                });
            }
        </script>
        <script type="text/javascript" src="js/validation.js"></script>
        <script src="js/script.js"></script>
    </body>
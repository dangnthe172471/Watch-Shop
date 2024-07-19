<%-- 
    Document   : ManagerShipper
    Created on : Jul 3, 2024, 12:55:59 AM
    Author     : dung2
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản Lý Nhân Viên Shipper</title>
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
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
        <style>
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
                        <h1>Quản Lý Nhân Viên Shipper</h1>    
                    </div>
                </div>
                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <h3>Nhân Viên Shipper</h3>
                            <form action="searchshipper" id="search-box">
                                <input type="text" id="search-text" placeholder="Tìm kiếm nhân viên shipper" onkeyup="searchShipper()">
                                <button id="search-btn"><i class='bx bx-search'></i></button>
                            </form>
                            <a href="#" class="btn btn-primary addbtn">Thêm Nhân Viên Shipper</a>
                        </div>
                        <div class="nav-bgg">
                            <nav class="containerr" style="padding:0px ; width: 30%">
                                <ul class="main-menuu">
                                    <li><a style="padding-left: 7px" href="shipper">Danh sách</a></li>
                                    <li style="margin-left: 30px;"><a href="showshipperblock">Danh sách Xóa</a></li>                  
                                </ul>
                            </nav>
                        </div>
                        <form action="shipper">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Avatar</th>
                                        <th>
                                            Tên đăng nhập
                                            <button type="submit" name="sortField" value="user" class="sortable ${sortField == 'user' ? sortOrder : ''}" style="border: none; background: none;">
                                                <i class="fa fa-sort${sortField == 'user' ? (sortOrder == 'asc' ? '-asc' : '-desc') : ''}"></i>
                                                <input type="hidden" name="sortOrder" value="${sortField == 'user' && sortOrder == 'asc' ? 'desc' : 'asc'}">
                                                <input type="hidden" name="page" value="${currentPage}">
                                            </button>
                                        </th>
                                        <th>Email</th>
                                        <th>Số điện thoại</th>
                                        <th>Địa chỉ</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listShipper}" var="account">
                                        <tr>
                                            <td><img src="${account.avatar}" alt="Avatar" width="50" height="50"/></td>
                                            <td>${account.user}</td>
                                            <td>${account.email}</td>
                                            <td>${account.phone}</td>
                                            <td>${account.address}</td>
                                            <td>
                                                <a href="#" class="editbtn" data-id="${account.id}" data-user="${account.user}" data-email="${account.email}" data-phone="${account.phone}" data-address="${account.address}" data-avatar="${account.avatar}"><i class="fa fa-edit"></i></a>
                                                <a href="#" onclick="doDelete('${account.id}')"><i class="fa fa-trash"></i></a>
                                            </td>
                                        </tr> 
                                    </c:forEach>
                                </tbody>
                            </table>
                        </form>
                    </div>                  
                </div>
                <c:if test="${totalPages > 1}">
                    <form action="shipper" method="get">
                        <div class="clearfix row" style="margin: 10px -24px">
                            <div class="hint-text" style="margin-left: 40px;">Hiển thị <b>${listShipper.size()}</b> trong tổng  <b>${totalShipper}</b> thành viên</div>
                            <ul class="pagination" style="margin-left: 200px;">
                                <c:set var="prevPage" value="${currentPage - 1}" />
                                <button name="page" value="${prevPage}" type="${currentPage > 1 ? 'submit' : 'button'}" style="width: 65px;height: 30px;border: 1px solid #007BFF;background-color: ${currentPage > 1 ? 'white' : '#9698ab'}">
                                    Trước
                                </button>
                                <c:forEach begin="1" end="${totalPages}" var="i">
                                    <li>
                                        <button name="page" value="${i}" type="submit" style="width: 30px;height: 30px;margin: 0 2px;border: 1px solid #007BFF;background-color:${currentPage == i ? '#007BFF' : 'white'}">
                                            ${i}
                                        </button>
                                    </li>
                                </c:forEach>
                                <c:set var="nextPage" value="${currentPage + 1}" />
                                <button name="page" value="${nextPage}" type="${currentPage < totalPages ? 'submit' : 'button'}" style="width:65px;height: 30px;border: 1px solid #007BFF;background-color: ${currentPage < totalPages ? 'white' : '#9698ab'}">
                                    Kế tiếp
                                </button>
                                <input type="hidden" name="sortField" value="${sortField}">
                                <input type="hidden" name="sortOrder" value="${sortOrder}">
                            </ul>
                        </div>
                    </form>
                </c:if>
            </main>
            <!-- The Modal Add -->
            <form action="addshipper" method="post" id="addShipperForm">
                <div class="modal fade" id="addmodal">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header text-center">
                                <h4 class="modal-title w-100">Thêm Nhân Viên Shipper</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div id="errorBanner" class="alert alert-danger" style="display:none;"></div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="username">Tên đăng nhập:</label>
                                    <div id="whitespaceMessage"></div>
                                    <div id="usernameMessage"></div>
                                    <input type="text" class="form-control" name="user" id="username" required oninput="validateUsername()">
                                </div>
                                <div class="form-group">
                                    <label for="pass">Password:</label>
                                    <div id="passwordMessage"></div>
                                    <input type="password" class="form-control" name="pass" id="password" required oninput="validatePassword()">
                                </div>
                                <div class="form-group">
                                    <label for="email">Email:</label>
                                    <div id="emailMessage"></div>
                                    <input type="email" class="form-control" name="email" id="email" required oninput="validateEmail()">
                                </div>
                                <div class="form-group">
                                    <label for="phone">Phone:</label>
                                    <div id="phoneMessage"></div>
                                    <input type="text" class="form-control" name="phone" id="phoneNumber" required oninput="validatePhoneNumber()">
                                </div>
                                <div class="form-group">
                                    <label for="address">Address:</label>
                                    <div id="addressMessage"></div>
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

            <!-- The Modal Update -->
            <form action="UpdateShipperServlet" method="post" id="updateShipperForm" enctype="multipart/form-data">
                <div class="modal fade" id="updatemodal">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header text-center">
                                <h4 class="modal-title w-100">Cập nhật Nhân Viên Shipper</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <input type="hidden" name="id" id="update-id">
                                <div class="form-group">
                                    <label for="username">Tên đăng nhập:</label>
                                    <input type="text" class="form-control" name="user" id="update-username" required>
                                </div>
                                <div class="form-group">
                                    <label for="email">Email:</label>
                                    <input type="email" class="form-control" name="email" id="update-email" required>
                                </div>
                                <div class="form-group">
                                    <label for="phone">Phone:</label>
                                    <input type="text" class="form-control" name="phone" id="update-phone" required>
                                </div>
                                <div class="form-group">
                                    <label for="address">Address:</label>
                                    <input type="text" class="form-control" name="address" id="update-address" required>
                                </div>
                                <div class="form-group">
                                    <label for="avatar">Avatar:</label>
                                    <input type="file" class="form-control" name="avatar" id="update-avatar">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Thoát</button>
                                <button type="submit" class="btn btn-primary">Cập nhật</button>
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

                <c:if test="${not empty errorMessage}">
                    $('#addmodal').modal('show');
                    $('#errorBanner').text('${errorMessage}').show();
                </c:if>
            });

            $(document).ready(function () {
                $('.editbtn').on('click', function () {
                    var id = $(this).data('id');
                    var user = $(this).data('user');
                    var email = $(this).data('email');
                    var phone = $(this).data('phone');
                    var address = $(this).data('address');
                    var avatar = $(this).data('avatar');

                    $('#update-id').val(id);
                    $('#update-username').val(user);
                    $('#update-email').val(email);
                    $('#update-phone').val(phone);
                    $('#update-address').val(address);

                    $('#updatemodal').modal('show');
                });
            });

            function doDelete(id) {
                if (confirm('Bạn có muốn xóa Nhân Viên này ?')) {
                    window.location = 'deleteshipper?id=' + id;
                }
            }

            function searchShipper() {
                var searchText = document.getElementById("search-text").value;
                if (searchText.trim() === "") {
                    return;
                }

                $.ajax({
                    url: 'searchshipper',
                    type: 'GET',
                    data: {searchText: searchText},
                    success: function (data) {
                        $('#shipper-table-body').html($(data).find('#shipper-table-body').html());
                    }
                });
            }
        </script>
        <script type="text/javascript" src="js/validation.js"></script>
        <script src="js/script.js"></script>
    </body>
</html>

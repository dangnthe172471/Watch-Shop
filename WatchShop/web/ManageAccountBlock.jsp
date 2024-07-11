<%-- 
    Document   : ManageAccountBlock
    Created on : Jul 11, 2024, 3:56:35 PM
    Author     : dung2
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý tài khoản bị khóa</title>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
                        <h1>Quản Lý Nhân Viên Bị Khóa</h1>
                    </div>
                </div>
                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <h3>Nhân Viên Bị Khóa</h3>
                            <form action="searchBlockedStaff" id="search-box">
                                <input type="text" id="search-text" placeholder="Tìm kiếm nhân viên bị khóa" onkeyup="searchStaff()">
                                <button id="search-btn"><i class='bx bx-search'></i></button>
                            </form>
                        </div>
                        <div class="nav-bgg">
                            <nav class="containerr" style="padding:0px ; width: 30%">
                                <ul class="main-menuu">
                                    <li><a style="padding-left: 7px" href="manageAccounts">Danh sách</a></li>
                                    <li style="margin-left: 30px;"><a href="showAccountblock">Danh sách Xóa</a></li>                  
                                </ul>
                            </nav>
                        </div>
                        <form action="showAccountblock" method="get">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Avatar</th>
                                        <th>
                                            Tên đăng nhập
                                            <form style="display:inline;" action="showAccountblock" method="get">
                                                <button type="submit" name="sortField" value="user" class="sortable ${sortField == 'user' ? sortOrder : ''}" style="border: none; background: none;">
                                                    <i class="fa fa-sort${sortField == 'user' ? (sortOrder == 'asc' ? '-asc' : '-desc') : ''}"></i>
                                                    <input type="hidden" name="sortOrder" value="${sortField == 'user' && sortOrder == 'asc' ? 'desc' : 'asc'}">
                                                    <input type="hidden" name="page" value="${currentPage}">
                                                </button>
                                            </form>
                                        </th>
                                        <th>Email</th>
                                        <th>Số điện thoại</th>
                                        <th>Địa chỉ</th>
                                        <th>Hành động</th>
                                    </tr>
                                </thead>
                                <tbody id="staff-table-body">
                                    <c:forEach items="${accounts}" var="account">
                                        <tr>
                                            <td><img src="${account.avatar}" alt="Avatar" width="50" height="50"/></td>
                                            <td>${account.user}</td>
                                            <td>${account.email}</td>
                                            <td>${account.phone}</td>
                                            <td>${account.address}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${account.status == 1}">
                                                        <form action="manageAccounts" method="post" style="display:inline;">
                                                            <input type="hidden" name="action" value="restore">
                                                            <input type="hidden" name="accountId" value="${account.id}">
                                                            <button type="submit" class="btn btn-primary">Khôi phục</button>
                                                        </form>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <!-- Add other actions if needed -->
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </form>

                    </div>                  
                </div>
                <c:if test="${totalPages > 1}">
                    <form action="showAccountblock" method="get">
                        <div class="clearfix row" style="margin: 10px -24px">
                            <div class="hint-text" style="margin-left: 40px;">Hiển thị <b>${accounts.size()}</b> trong tổng <b>${totalAccounts}</b> tài khoản</div>
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
        </section>

        <script type="text/javascript">
            $(document).ready(function () {
                $('.addbtn').on('click', function () {
                    $('#addmodal').modal('show');
                });

                // Tự động mở modal nếu có lỗi
            <c:if test="${not empty errorMessage}">
                $('#addmodal').modal('show');
                $('#errorBanner').text('${errorMessage}').show();
            </c:if>
            });

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
                    url: 'searchBlockedStaff',
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
</html>

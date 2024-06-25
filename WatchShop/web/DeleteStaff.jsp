<%-- 
    Document   : DeleteStaff
    Created on : Jun 26, 2024, 3:09:00 AM
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
                        <h1>Danh Sách Nhân Viên Đã Xóa</h1>
                    </div>
                </div>
                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <h3>Nhân Viên Đã Xóa</h3>
                            <form action="searchblockedstaff" id="search-box">
                                <input type="text" id="search-text" placeholder="Tìm kiếm nhân viên đã xóa" onkeyup="searchBlockedStaff()">
                                <button id="search-btn"><i class='bx bx-search'></i></button>
                            </form>
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
                                    <c:forEach items="${blockedAccounts}" var="account">
                                        <tr>
                                            <td><img src="${account.avatar}" alt="Avatar" width="50" height="50"/></td>
                                            <td>${account.user}</td>
                                            <td>${account.email}</td>
                                            <td>${account.phone}</td>
                                            <td>${account.address}</td>
                                            <td>
                                                <a href="#" onclick="restoreStaff('${account.id}')"><i class="fa fa-undo"></i></a>&nbsp;&nbsp;
                                                <a href="#" onclick="deletePermanently('${account.id}')"><i class="fa fa-trash"></i></a>
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
        <script type="text/javascript">
            function searchBlockedStaff() {
                var searchText = document.getElementById("search-text").value;
                if (searchText.trim() === "") {
                    return;
                }

                $.ajax({
                    url: 'searchblockedstaff',
                    type: 'GET',
                    data: { searchText: searchText },
                    success: function(data) {
                        $('#blocked-staff-table-body').html($(data).find('#blocked-staff-table-body').html());
                    }
                });
            }
             function restoreStaff(id) {
                if (confirm('Bạn có muốn khôi phục nhân viên này?')) {
                    window.location = 'restorestaff?id=' + id;
                }
            }

            function deletePermanently(id) {
                if (confirm('Bạn có chắc chắn muốn xóa vĩnh viễn nhân viên này?')) {
                    window.location = 'deletepermanentlystaff?id=' + id;
                }
            }
        </script>
        <script src="js/script.js"></script>
    </body>
</html>

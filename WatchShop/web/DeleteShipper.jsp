<%-- 
    Document   : DeleteShipper
    Created on : Jul 3, 2024, 12:58:17 AM
    Author     : dung2
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>Danh Sách Nhân Viên Shipper Đã Xóa</title>
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
    </head>
    <body>
       <jsp:include page="left.jsp" />
        <section id="content">
            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>Danh Sách Nhân Viên Shipper Đã Xóa</h1>
                    </div>
                </div>
                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <h3>Nhân Viên Shipper Đã Xóa</h3>
                            <form action="searchblockedshipper" id="search-box">
                                <input type="text" id="search-text" placeholder="Tìm kiếm nhân viên đã xóa" onkeyup="searchBlockedShipper()">
                                <button id="search-btn"><i class='bx bx-search'></i></button>
                            </form>
                        </div>
                        <div class="nav-bgg">
                            <nav class="containerr" style="padding:0px ; width: 30%">
                                <ul class="main-menuu">
                                    <li><a style="padding-left: 7px" href="shipper">Danh sách</a></li>
                                    <li style="margin-left: 30px;"><a href="showshipperblock">Danh sách Xóa</a></li>                  
                                </ul>
                            </nav>
                        </div>
                        <form action="showshipperblock">
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
                                    <c:forEach items="${blockedShippers}" var="account">
                                        <tr>
                                            <td><img src="${account.avatar}" alt="Avatar" width="50" height="50"/></td>
                                            <td>${account.user}</td>
                                            <td>${account.email}</td>
                                            <td>${account.phone}</td>
                                            <td>${account.address}</td>
                                            <td>
                                                <a href="#" onclick="restoreShipper('${account.id}')"><i class="fa fa-undo"></i></a>&nbsp;&nbsp;
                                                <a href="#" onclick="deletePermanently('${account.id}')"><i class="fa fa-trash"></i></a>
                                            </td>
                                        </tr> 
                                    </c:forEach>
                                </tbody>
                            </table>
                        </form>
                    </div>                  
                </div>
                <c:if test="${totalPages > 1}">
                    <form action="showshipperblock" method="get">
                        <div class="clearfix row" style="margin: 10px -24px">
                            <div class="hint-text" style="margin-left: 40px;">Hiển thị <b>${blockedShippers.size()}</b> trong tổng <b>${totalStaff}</b> thành viên</div>
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
            function searchBlockedShipper() {
                var searchText = document.getElementById("search-text").value;
                if (searchText.trim() === "") {
                    return;
                }

                $.ajax({
                    url: 'searchblockedshipper',
                    type: 'GET',
                    data: {searchText: searchText},
                    success: function (data) {
                        $('#blocked-shipper-table-body').html($(data).find('#blocked-shipper-table-body').html());
                    }
                });
            }

            function restoreShipper(id) {
                if (confirm('Bạn có muốn khôi phục nhân viên này?')) {
                    window.location = 'restoreshipper?id=' + id;
                }
            }

            function deletePermanently(id) {
                if (confirm('Bạn có chắc chắn muốn xóa vĩnh viễn nhân viên này?')) {
                    window.location = 'deletepermanentlyshipper?id=' + id;
                }
            }
        </script>
        <script src="js/script.js"></script>
    </body>
</html>

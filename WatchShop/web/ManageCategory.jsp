<%-- 
    Document   : ManageCategory
    Created on : May 25, 2024, 3:26:38 PM
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
        <script type="text/javascript" src="js/category.js"></script>
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
                        <h1>Thể Loại</h1>                      
                    </div>
                    <a class="btn-download, btn btn-primary addbtn">
                        <span class="text">Thêm thể loại</span>
                    </a>
                </div>
                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <h3>Quản Lý</h3>
                            <form action="" id="search-box">
                                <input type="text" id="search-text" placeholder="Tìm kiếm theo thể loại ">
                                <button id="search-btn"><i class='bx bx-search'></i></button>
                            </form> 
                        </div>
                        <div class="nav-bgg" >
                            <nav class="containerr" style="padding:0px ; width: 30%">
                                <ul class="main-menuu">
                                    <li><a style="padding-right: 0px" href="category">Danh sách</a></li>
                                    <li style="margin-left: 30px;"><a href="blockc">Danh sách Xóa</a></li>               
                                </ul>
                            </nav>
                        </div>
                        <form action="category">
                            <table>
                                <thead>
                                    <tr>
                                        <th style="padding-left: 7px">Id</th>
                                        <th style="width: 200px">Thể loại</th>
                                        <th>Dòng sản phẩm</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listc}" var="c">
                                        <tr>
                                            <td>${c.cid}</td>
                                            <td>
                                                ${c.type==1?'Giới tính':''}
                                                ${c.type==2?'Độ chống nước':''}
                                                ${c.type==3?'Đường kính mặt số':''}
                                            </td>
                                            <td>${c.cname}</td> 
                                            <td><a  class="btn btn-primary editbtn"><i class="fa fa-pencil-square-o"></i></a>&nbsp;&nbsp;
                                                <a href="#" onclick="doDelete('${c.cid}')"><i class="fa fa-trash"></i></a>
                                            </td>
                                            <td><P style="display: none">${c.type}</p></td>
                                        </tr> 
                                    </c:forEach>
                                </tbody>
                            </table>
                        </form>

                    </div>                  
                </div>
            </main>

            <!-- The Modal Add -->
            <form action="addcategory" method="post" id="addCategoryForm">
                <div class="modal fade" id="addmodal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Thêm thể loại</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <label>Loại</label>
                                <select name="type">
                                    <option value="1">Giới tính</option>
                                    <option value="2">Độ chống nước</option>
                                    <option value="3">Đường kính mặt số</option>
                                </select><br>
                                <label>Dòng sản phẩm</label>
                                <input type="text" name="cname" id="cname" oninput="checkWhitespace()">
                                <span id="categoryNameError" class="text-danger"></span>
                                <span id="whitespaceMessage" class="text-danger"></span>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Thoát</button>
                                <button type="button" name="add" class="btn btn-primary" onclick="submitAddCategoryForm()">Thêm</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

            <!-- The Modal Update -->
            <form action="updatecate" method="post" id="editCategoryForm">
                <div class="modal fade" id="editmodal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Chỉnh sửa thể loại</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <label>ID</label>
                                <input type="text" name="cid" id="update_id" readonly style="background: gray">
                                <label>Dòng sản phẩm</label>
                                <input type="text" name="cname" id="update_name">
                                <span id="editCategoryNameError" class="text-danger"></span>
                            </div>
                            <div class="modal-body">
                                <label>Loại</label>
                                <select name="type" id="update_type">
                                    <option value="1">Giới tính</option>
                                    <option value="2">Độ chống nước</option>
                                    <option value="3">Đường kính mặt số</option>
                                </select><br>
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

        <script>
            $(document).ready(function () {
                $('.addbtn').on('click', function () {
                    $('#addmodal').modal('show');
                    $tr = $(this).closest('tr');
                });
            });
        </script>
        <script>
            $(document).ready(function () {
                $('.editbtn').on('click', function () {
                    $('#editmodal').modal('show');
                    $tr = $(this).closest('tr');
                    var data = $tr.children("td").map(function () {
                        return $(this).text();
                    }).get();
                    console.log(data);
                    $('#update_id').val(data[0].trim());
                    $('#update_name').val(data[2].trim());
                    $('#update_type').val(data[4].trim());
                });
            });
        </script>

        <script type="text/javascript">
            function doDelete(cid) {
                if (confirm('Bạn muốn xóa thể loại này ?')) {
                    window.location = 'addcategory?cid=' + cid;
                }
            }
        </script>
        <script src="js/script.js"></script>
    </body>
</html>

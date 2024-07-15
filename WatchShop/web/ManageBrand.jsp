<%-- 
    Document   : AdminManage
    Created on : May 18, 2024, 7:21:38 PM
    Author     : admin
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
                        <h1>Thương Hiệu </h1>                      
                    </div>
                    <a class="btn-download, btn btn-primary addbtn">
                        <span class="text">Thêm Thương Hiệu</span>
                    </a>
                </div>
                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <h3>Quản Lý</h3>
                            <form action="" id="search-box">
                                <input type="text" id="search-text" placeholder="Tìm kiếm theo thương hiệu ">
                                <button id="search-btn"><i class='bx bx-search'></i></button>
                            </form> 
                        </div>
                        <div class="nav-bgg">
                            <nav class="containerr" style="padding:0px ; width: 30%">
                                <ul class="main-menuu">
                                    <li><a style="padding-left: 7px" href="brand">Danh sách</a></li>
                                    <li style="margin-left: 30px;"><a href="blockb">Danh sách Xóa</a></li>                  
                                </ul>
                            </nav>
                        </div>
                        <form action="brand">
                            <table>
                                <thead>
                                    <tr>
                                        <th ></th>
                                        <th style="width: 200px;">Thương hiệu</th>
                                        <th style="width: 200px;">Hình ảnh</th>
                                        <th>Mô tả</th>
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
                                                ${b.description}
                                            </td> 
                                            <td><a  class="btn btn-primary editbtn"><i class="material-icons" style="font-size:15px">edit</i></a>&nbsp;&nbsp;
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

            <!-- The Modal Add -->
            <form action="addbrand" method="post" id="addBrandForm">
                <div class="modal fade" id="addmodal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Thêm Thương Hiệu</h4>
                                
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <span id="whitespaceMessage" class="text-danger"></span><br/>
                                <label>Thương Hiệu</label>
                                <span id="brandNameError" class="text-danger"></span>
                                
                                <input type="text" name="bname" id="bname" oninput="checkWhitespace()"> 

                                <label>Ảnh:</label>
                                <span id="brandImageError" class="text-danger"></span>
                                <input type="file" name="image" id="bimage" oninput="checkWhitespace()"><br/>

                                <label>Miêu Tả </label><span id="brandDescriptionError" class="text-danger"></span><br/>
                                <textarea style="width: 450px" type="text" name="description" id="bdescription" oninput="checkWhitespace()"></textarea>
                                
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Thoát</button>
                                <button type="button" onclick="submitAddBrandForm()" class="btn btn-primary">Thêm</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

            <!-- The Modal Update -->
            <form action="updatebrand" method="post" id="editBrandForm">
                <div class="modal fade" id="editmodal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Chỉnh sửa</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <input type="hidden" name="bid" id="update_id">
                                <label>Thương Hiệu</label>
                                <input type="text" name="bname" id="update_name">
                                <label>Ảnh</label>
                                <input type="text" name="image" id="update_image">
                                <label>Miêu Tả</label>
                                <textarea class="form-control" id="update_description" name="description"></textarea>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Thoát</button>
                                <button type="submit" name="update" class="btn btn-primary">Cập nhật</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </section>


        <script src="js/script.js"></script>
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
                    $('#update_name').val(data[1].trim());
                    $('#update_image').val(data[2].trim());
                    $('#update_description').val(data[3].trim());
                });
            });
        </script>

        <script type="text/javascript">
            function doDelete(bid) {
                if (confirm('Bạn có muốn xóa Thương Hiệu này ?')) {
                    window.location = 'deletebrand?bid=' + bid;
                }
            }
        </script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>


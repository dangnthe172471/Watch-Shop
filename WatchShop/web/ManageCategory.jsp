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
        <section id="sidebar">
            <a href="home" class="brand" style="margin-left: 60px;">
                <span class="text">Watch Shop</span>
            </a>
            <ul class="side-menu top">
                <li>
                    <a href="AdminManage.jsp">
                        <i class='bx bxs-dashboard' ></i>
                        <span class="text">Dashboard</span>
                    </a>
                </li>
                <li class="${page==2?'active':''}">
                    <a href="brand">
                        <i class='bx bxs-shopping-bag-alt' ></i>
                        <span class="text">Brand</span>
                    </a>
                </li>
                <li class="${page==3?'active':''}">
                    <a href="category">
                        <i class='bx bxs-doughnut-chart' ></i>
                        <span class="text">Category</span>
                    </a>
                </li>
                <li>
                    <a href="manageblog">
                        <i class='bx bxs-message-dots' ></i>
                        <span class="text">Blog</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class='bx bxs-group' ></i>
                        <span class="text">Team</span>
                    </a>
                </li>
            </ul>
        </section>

        <section id="content">
            <!-- NAVBAR -->
            <nav class="navbar navbar-expand-md bg-white navbar-light">
                <i class='bx bx-menu' ></i>  
                <ul class="navbar-nav" style="margin-left: 600px;">
                    <div class="dropdown row" style="margin-left: 10px">
                        <c:if test="${sessionScope.account == null}" >
                            <li class="nav-item account">  <a href="login" class="btn btn-secondary rounded-circle">
                                    <i class="fa fa-user"></i>
                                </a>
                                <a class="nav-link text-dark text-uppercase" href="login" style="display:inline-block">Tài khoản</a> </li>   
                            </c:if>
                            <c:if test="${sessionScope.account != null}" >
                            <li class="nav-item account"><a class="nav-link text-dark text-uppercase" href="#" style="display:inline-block"> <i class="fa fa-user"></i>Hello ${sessionScope.account.user}</a></li> 
                            <li class="nav-item account"><a class="nav-link text-dark text-uppercase" href="#" style="display:inline-block">Change Password</a></li> 
                            <li class="nav-item account"><a class="nav-link text-dark text-uppercase" href="login?type=logout" style="display:inline-block">logout</a></li> 
                            </c:if>
                    </div>
                    <c:set var="size" value="${sessionScope.size}"/>
                    <div style="margin-left: 10px">
                        <li class="nav-item giohang">
                            <a href="Cart.jsp" class="btn btn-secondary rounded-circle">
                                <i class="fa fa-shopping-cart"></i>
                                <c:if test="${size>0}">
                                    <div class="cart-amount">${size}</div>
                                </c:if>
                            </a>
                            <a href="Cart.jsp" class="nav-link text-dark text-uppercase" style="display:inline-block">Giỏ hàng</a>
                        </li>
                    </div>
                </ul>
            </nav>

            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>Category</h1>                      
                    </div>
                    <a class="btn-download, btn btn-primary addbtn">
                        <span class="text">Add new category</span>
                    </a>
                </div>
                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <h3>Manage</h3>
                            <i class='bx bx-search' ></i>
                            <i class='bx bx-filter' ></i>
                        </div>
                        <form action="category">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Category</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listc}" var="c">
                                        <tr>
                                            <td>${c.cid}</td>
                                            <td>${c.cname}</td> 
                                            <td><a  class="btn btn-primary editbtn"><i class="fa fa-pencil-square-o"></i></a>&nbsp;&nbsp;
                                                <a href="#" onclick="doDelete('${c.cid}')"><i class="fa fa-trash"></i></a>
                                            </td>
                                        </tr> 
                                    </c:forEach>
                                </tbody>
                            </table>
                        </form>

                    </div>                  
                </div>
            </main>

            <!-- The Modal -->
            <form action="addcategory" method="post">
                <div class="modal fade" id="addmodal">
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <div class="modal-header">
                                <h4 class="modal-title">Add Category</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <label>Name</label>
                                <input type="text" name="cname">
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                <button type="submit" name="add" class="btn btn-primary">Add Brand</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

            <!-- The Modal -->
            <form action="updatecate" method="post">
                <div class="modal fade" id="editmodal">
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <div class="modal-header">
                                <h4 class="modal-title">Edit Category</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <div class="modal-body">
                                <label>ID</label>
                                <input type="text" name="cid" id="update_id" readonly style="background: gray">
                                <label>Name</label>
                                <input type="text" name="cname" id="update_name"> 
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                <button type="submit" name="update" class="btn btn-primary">Update</button>
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
                    $('#update_id').val(data[0]);
                    $('#update_name').val(data[1]);
                });
            });
        </script>

        <script type="text/javascript">
            function doDelete(cid) {
                if (confirm('Are You Sure Delete Category has ID: ' + cid + '?')) {
                    window.location = 'addcategory?cid=' + cid;
                }
            }
        </script>
    </body>
</html>

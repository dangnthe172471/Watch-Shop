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
        <link rel="stylesheet" href="css/home.css">        
        <link rel="stylesheet" href="css/nav.css">
        <link rel="stylesheet" href="css/manage-blog.css">        
        <link rel="stylesheet" type="text/css" href="slick/slick.css" />
        <link rel="stylesheet" type="text/css" href="slick/slick-theme.css" />
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <body>
        <jsp:include page="left.jsp" />
        <section id="content">
            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>Tin tức</h1>                      
                    </div>
                    <button class="btn btn-primary" onclick="window.location.href = 'editblog'">Chỉnh sửa</button>
                </div>
                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <h3>Danh sách</h3>
                            <div class="dropdown">
                                <button class="btn btn-secondary dropdown-toggle" type="button" id="filterDropdown" data-toggle="dropdown" aria-haspopup="true" aria-eutton" id="filterDropdown" data-toggle="dropdown" aria-haspopup="txpanded="false">
                                    <i class='bx bx-filter' ></i> Trạng thái
                                </button>
                                <div class="dropdown-menu" aria-labelledby="filterDropdown">
                                    <a class="dropdown-item" href="#" onclick="filterBlogs()">Tất cả</a> 
                                    <a class="dropdown-item" href="#" onclick="filterBlogs(0)">Chờ duyệt</a>
                                    <a class="dropdown-item" href="#" onclick="filterBlogs(1)">Đã đăng</a>
                                    <a class="dropdown-item" href="#" onclick="filterBlogs(2)">Đã xóa</a>
                                </div>
                            </div>                
                        </div>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th style="width: 50px;">ID</th>
                                    <th style="width: 150px;">Tên</th>
                                    <th style="width: 200px;">Ảnh</th>
                                    <th style="width: 100px;">Thời gian</th> 
                                    <th>Nội Dung</th>
                                    <th style="width: 150px;">Người đăng</th>
                                    <th style="width: 100px;">Trạng thái</th>
                                </tr>
                            </thead>
                            <tbody id="blogList">
                                <c:forEach items="${requestScope.listBl}" var="c">
                                    <tr data-status="${c.status}">
                                        <td>${c.id}</td>
                                        <td>
                                            <span style="display: -webkit-box;
                                                  -webkit-line-clamp: 2;
                                                  -webkit-box-orient: vertical;
                                                  overflow: hidden;" title="${c.title}">
                                                ${c.title}
                                            </span>
                                        </td>
                                        <td style="text-align: center;">
                                            <img src="${c.image}" class="blog-image" style="border-radius: 0;
                                                 width: 150px;
                                                 height: 150px;">
                                        </td>   
                                        <td>${c.date}</td>
                                        <td>
                                            <span class="container" style="display: -webkit-box;
                                                  -webkit-line-clamp: 4;
                                                  -webkit-box-orient: vertical;
                                                  overflow: hidden;" title="${c.description}">
                                                ${c.description}
                                            </span>
                                        </td>
                                        <c:forEach var="a" items="${listA}">
                                            <td  style="display:${c.created_by==a.id?'':'none'}  ;text-align: center; padding-right: 70px;">${a.user}</td>
                                        </c:forEach>
                                        <td>
                                            <c:choose>
                                                <c:when test="${c.status == 0}">
                                                    Chờ duyệt
                                                </c:when>
                                                <c:when test="${c.status == 1}">
                                                    Đã đăng
                                                </c:when>
                                                <c:when test="${c.status == 2}">
                                                    Đã xóa
                                                </c:when>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>                  
                </div>
            </main>
        </section>
        <script>
            function filterBlogs(status) {
                console.log('Filtering blogs with status:', status);
                var rows = document.querySelectorAll("#blogList tr");
                rows.forEach(row => {
                    var rowStatus = parseInt(row.getAttribute("data-status"));
                    console.log('Row status:', rowStatus);
                    if (status === rowStatus || status === undefined) {
                        row.style.display = "";
                    } else {
                        row.style.display = "none";
                    }
                });
            }
        </script>
    </body>
</html>

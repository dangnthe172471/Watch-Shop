<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Danh sách Blog đã xóa</title>
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- My CSS -->
        <link rel="stylesheet" href="css/manage.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <body>
        <jsp:include page="left.jsp" />
        <section id="content">
            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>Danh sách Blog đã xóa</h1>
                    </div>
                </div>
                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <h3>Danh sách</h3>
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
                                    <th style="width: 100px;">Hành động</th>
                                </tr>
                            </thead>
                            <tbody id="deletedBlogList">
                                <c:forEach items="${listDeletedBlogs}" var="c">
                                    <tr>
                                        <td>${c.id}</td>
                                        <td>${c.title}</td>
                                        <td style="text-align: center;">
                                            <img src="${c.image}" class="blog-image" style="border-radius: 0; width: 150px; height: 150px;">
                                        </td>
                                        <td>${c.date}</td>
                                        <td>${c.description}</td>
                                        <c:forEach var="a" items="${listA}">
                                            <td style="display:${c.created_by == a.id ? '' : 'none'}; text-align: center;">${a.user}</td>
                                        </c:forEach>
                                        <td>
                                            <form action="showdeletedblog" method="post" style="display:inline;">
                                                <input type="hidden" name="id" value="${c.id}">
                                                <input type="hidden" name="action" value="restore">
                                                <button type="submit" class="btn btn-success btn-sm">Khôi phục</button>
                                            </form>
                                            <form action="showdeletedblog" method="post" style="display:inline;">
                                                <input type="hidden" name="id" value="${c.id}">
                                                <input type="hidden" name="action" value="delete">
                                                <button type="submit" class="btn btn-danger btn-sm">Xóa hẳn</button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </main>
        </section>
    </body>
</html>

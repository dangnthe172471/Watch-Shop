<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Edit Blog</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/blog-validation.js"></script>
    </head>
    <body>
        <div class="container">
            <h2>Sửa tin tức</h2>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addBlogModal">
                Thêm tin tức
            </button>
            <a href="manageblog" class="btn btn-primary" style="position: absolute; top: 45px; right: 200px;">Quay lại</a>
            <hr/>
            <h2>Danh sách</h2>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th style="width: 150px;">Tên</th>
                        <th style="width: 200px">Ảnh</th>
                        <th style="width: 150px;">Thời gian</th>
                        <th>Nội dung</th>
                        <th style="width: 150px;">Trạng thái</th>
                        <th style="width: 150px;">Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="blogItem" items="${listBl}">
                        <tr>
                            <td>${blogItem.id}</td>
                            <td><span style="display: -webkit-box;-webkit-line-clamp: 3;-webkit-box-orient: vertical;overflow: hidden;" title="${blogItem.title}">${blogItem.title}</span></td>
                            <td><img src="${blogItem.image}" style="width: 150px; height: 130px; " ></td>
                            <td>${blogItem.date}</td>
                            <td><span style="display: -webkit-box;-webkit-line-clamp: 3;-webkit-box-orient: vertical;overflow: hidden;" title="${blogItem.description}">${blogItem.description}</span></td>
                            <td>
                                <c:choose>
                                    <c:when test="${blogItem.status == 0}">
                                        Chờ duyệt
                                    </c:when>
                                    <c:when test="${blogItem.status == 2}">
                                        Đã xóa
                                    </c:when>
                                    <c:otherwise>
                                        Đã đăng
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <a href="editblog?action=edit&id=${blogItem.id}" class="btn btn-warning" data-toggle="modal" data-target="#editBlogModal${blogItem.id}">Sửa</a>
                                <c:if test="${blogItem.status != 2}">
                                    <button class="btn btn-danger" onclick="removeBlog('${blogItem.id}')">Xóa</button>
                                </c:if>
                            </td>
                        </tr>
                        <!-- Edit Blog Modal -->
                    <div class="modal fade" id="editBlogModal${blogItem.id}" tabindex="-1" role="dialog" aria-labelledby="editBlogModalLabel${blogItem.id}" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="editBlogModalLabel${blogItem.id}">Edit Blog</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form action="editblog?action=edit" method="post" id="editBlogForm${blogItem.id}">
                                        <input type="hidden" name="id" value="${blogItem.id}" />
                                        <div class="form-group">
                                            <label for="title">Tên:</label>
                                            <input type="text" class="form-control" id="title${blogItem.id}" name="title" value="${blogItem.title}" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="image">URL Ảnh:</label>
                                            <input type="text" class="form-control" id="image${blogItem.id}" name="image" value="${blogItem.image}" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="date">Thời gian:</label>
                                            <input type="date" class="form-control" id="date${blogItem.id}" name="date" value="${blogItem.date}" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="description">Nội dung:</label>
                                            <textarea class="form-control" id="description${blogItem.id}" name="description" required>${blogItem.description}</textarea>
                                        </div>
                                        <div class="form-group">
                                            <label for="status">Trạng thái:</label>
                                            <select class="form-control" id="statusSelect${blogItem.id}" required>
                                                <c:choose>
                                                    <c:when test="${blogItem.status == 0}">
                                                        <option value="0" selected>Chờ duyệt</option>
                                                        <option value="1">Đã đăng</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="0">Chờ duyệt</option>
                                                        <option value="1" selected>Đã đăng</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </select>
                                            <!-- Hidden input field to store the selected status value -->
                                            <input type="hidden" id="status${blogItem.id}" name="status" value="${blogItem.status}" />
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                    <button type="button" class="btn btn-primary" onclick="submitEditBlogForm('${blogItem.id}')">Lưu</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </c:forEach>
                </tbody>
            </table>

            <div class="modal fade" id="addBlogModal" tabindex="-1" role="dialog" aria-labelledby="addBlogModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addBlogModalLabel">Thêm tin tức</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="editblog" method="post" id="addBlogForm">
                                <input type="hidden" name="id" value="${param.id}" />
                                <div class="form-group">
                                    <label for="title">Tên:</label>
                                    <input type="text" class="form-control" id="title" name="title" required>
                                    <span id="titleError" class="error-message" style="color: red;"></span> <!-- Error message for title -->
                                </div>
                                <div class="form-group">
                                    <label for="image">URL Ảnh:</label>
                                    <input type="text" class="form-control" id="image" name="image" required>
                                    <span id="imageError" class="error-message" style="color: red;"></span> <!-- Error message for image -->
                                </div>
                                <div class="form-group">
                                    <label for="date">Thời gian:</label>
                                    <input type="date" class="form-control" id="date" name="date" required>
                                    <span id="dateError" class="error-message" style="color: red;"></span> <!-- Error message for date -->
                                </div>
                                <div class="form-group">
                                    <label for="description">Nội dung:</label>
                                    <textarea class="form-control" id="description" name="description" required></textarea>
                                    <span id="descriptionError" class="error-message" style="color: red;"></span> <!-- Error message for description -->
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                            <button type="button" class="btn btn-primary" onclick="submitAddBlogForm()">Lưu</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="confirmDeleteModal" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="confirmDeleteModalLabel">Xác nhận xóa</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Bạn có chắc chắn muốn xóa tin này không?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                            <button type="button" class="btn btn-danger" id="confirmDeleteButton">Xóa</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Edit Blog</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container">
            <h2>Manage Blogs</h2>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addBlogModal">
                Add Blog
                <a href="manageblog" class="btn btn-primary" style="position: absolute; top: 45px; right: 200px;">Back</a>
            </button>

            <hr/>

            <h2>Blog List</h2>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th style="width: 150px;">Title</th>
                        <th style="width: 200px">Image</th>
                        <th style="width: 150px;">Date</th>
                        <th>Description</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="blogItem" items="${listBl}">
                        <tr>
                            <td>${blogItem.id}</td>
                          <td>
                                <span style="display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;overflow: hidden;" title="${blogItem.title}"  >
                                    ${blogItem.title}
                                </span>
                            </td>
                            <td><img src="${blogItem.image}" alt="${blogItem.title}" style="width: 150px;height: 150px;"></td>
                            <td>${blogItem.date}</td>
                            <td>
                                <span style="display: -webkit-box;-webkit-line-clamp: 5;-webkit-box-orient: vertical;overflow: hidden;" title="${blogItem.description}"  >
                                    ${blogItem.description}
                                </span>
                            </td>
                            <td>
                                <a href="editblog?action=edit&id=${blogItem.id}" class="btn btn-warning">Edit</a>
                                <button class="btn btn-danger" onclick="removeBlog('${blogItem.id}')">Delete</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <div class="modal fade" id="addBlogModal" tabindex="-1" role="dialog" aria-labelledby="addBlogModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addBlogModalLabel">Add Blog</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="editblog" method="post" id="addBlogForm">
                                <input type="hidden" name="id" value="${param.id}" />
                                <div class="form-group">
                                    <label for="title">Title:</label>
                                    <input type="text" class="form-control" id="title" name="title" required>
                                </div>
                                <div class="form-group">
                                    <label for="image">Image URL:</label>
                                    <input type="text" class="form-control" id="image" name="image" required>
                                </div>
                                <div class="form-group">
                                    <label for="date">Date:</label>
                                    <input type="date" class="form-control" id="date" name="date" required>
                                </div>
                                <div class="form-group">
                                    <label for="description">Description:</label>
                                    <textarea class="form-control" id="description" name="description" required></textarea>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" onclick="submitAddBlogForm()">Save</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="confirmDeleteModal" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="confirmDeleteModalLabel">Confirm Delete</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Are you sure you want to delete this blog?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                            <button type="button" class="btn btn-danger" id="confirmDeleteButton">Delete</button>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                function submitAddBlogForm() {
                    document.getElementById("addBlogForm").submit();
                }

                function removeBlog(id) {
                    $('#confirmDeleteModal').modal('show');

                    $('#confirmDeleteButton').on('click', function() {
                        window.location.href = 'editblog?action=delete&id=' + id;
                    });
                }
            </script>
        </div>
    </body>
</html>
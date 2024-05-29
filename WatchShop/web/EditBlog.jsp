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
                        <th>Title</th>
                        <th>Image</th>
                        <th>Date</th>
                        <th>Description</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="blogItem" items="${listBl}">
                        <tr>
                            <td>${blogItem.id}</td>
                            <td>${blogItem.title}</td>
                            <td><img src="${blogItem.image}" alt="${blogItem.title}" width="100"></td>
                            <td>${blogItem.date}</td>
                            <td>${blogItem.description}</td>
                            <td>
                                <a href="editblog?action=edit&id=${blogItem.id}" class="btn btn-warning">Edit</a>
                                <button class="btn btn-danger" onclick="removeBlog(${blogItem.id})">Delete</button>
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
                                <input type="hidden" name="id" value="${blog.id}" />
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" onclick="submitAddBlogForm()">Save</button>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                function submitAddBlogForm() {
                    document.getElementById("addBlogForm").submit();
                }

                function removeBlog(id) {
                    if (confirm("Are you sure you want to delete this blog?")) {
                        window.location.href = 'editblog?action=delete&id=' + id;
                    }
                }
            </script>
        </div>
    </body>
</html>

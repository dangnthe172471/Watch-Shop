<%@ page import="dal.BlogDAO, model.Blog" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="css/nav.css">
<script type="text/javascript" src="js/main.js"></script>
<link rel="stylesheet" type="text/css" href="slick/slick.css" />
<link rel="stylesheet" type="text/css" href="slick/slick-theme.css" />
<script type="text/javascript" src="slick/slick.min.js"></script>
<%
    String idParam = request.getParameter("id");
    int blogId = Integer.parseInt(idParam);

    BlogDAO blogDAO = new BlogDAO();
    Blog blog = blogDAO.getBlogById(blogId);
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <jsp:include page="nav.jsp"/>
    <div class="container">
        <c:forEach items="${listBl}" var="o">
            <div class="row mb-5 mt-3">
                <div class="col-md-4">
                    <h4 style="display: -webkit-box;-webkit-line-clamp: 1;-webkit-box-orient: vertical; overflow: hidden;" title="${o.title}">${o.title}</h4>
                    <img src="${o.image}" style="width: 350px;height: 150px"/>
                </div>
                <div class="col-md-8 mt-5">
                    <span class="container" style="display: -webkit-box;-webkit-line-clamp: 3;-webkit-box-orient: vertical;overflow: hidden;" title="${o.description}">
                        ${o.description}
                    </span>
                    <a href="ViewBlog.jsp?id=${o.id}">Read More</a>
                </div>
            </div>
        </c:forEach>
    </div>
    <title><%= blog.getTitle() %></title>
    <style>

        h1, h2 {
            color: #333;
        }
        img {
            max-width: 50%;
            width: 50%;
            display: block;
            height: auto;
            border-radius: 5px;
            margin-bottom: 50px;
            margin: 0 auto;
        }
        p {
            color: #555;
            line-height: 1.6;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 style="margin-top: 20px;"><b><%= blog.getTitle() %></b></h1>
        <p><fmt:formatDate value="${blog.getDate()}" type="date" pattern="MMMM dd, yyyy"/></p>
        <img src="<%= blog.getImage() %>" alt="<c:out value="${blog.getTitle()}"/>" style="max-width: 100%;">
        <p style="margin-top: 20px;"><%= blog.getDescription() %></p>
    </div>
    <jsp:include page="nav2.jsp"/>
</body>
</html>

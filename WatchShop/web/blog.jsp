<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Watch Shop</title>
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
        <style>
            a {
                color: black;
                text-decoration: none;
            }
            a:hover {
                color: black;
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <jsp:include page="nav.jsp"/>
        <div class="container">
            <c:forEach items="${listBl}" var="o">
                <div class="row mb-5 mt-3">
                    <div class="col-md-4">
                        <h4 style="display: -webkit-box;-webkit-line-clamp: 1;-webkit-box-orient: vertical; overflow: hidden;" title="${o.title}">
                            <a href="ViewBlog.jsp?id=${o.id}">${o.title}</a>
                        </h4>
                        <a href="ViewBlog.jsp?id=${o.id}"> <!-- Wrap image within anchor tag -->
                            <img src="${o.image}" style="width: 350px;height: 150px; margin: auto; display: block;" alt="${o.title}" />
                        </a>
                    </div>
                    <div class="col-md-8 mt-5">
                        <a href="ViewBlog.jsp?id=${o.id}"><span class="container" style="display: -webkit-box;-webkit-line-clamp: 3;-webkit-box-orient: vertical;overflow: hidden;" title="${o.description}">
                                ${o.description}
                            </span>
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
        <jsp:include page="nav2.jsp"/>
        <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
    <df-messenger
        intent="WELCOME"
        chat-title="WatchShop"
        agent-id="07d6d881-7f37-481b-b15f-58830e1c2667"
        language-code="vi"
        ></df-messenger>
</body>
</html>
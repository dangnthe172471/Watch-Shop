<%-- 
    Document   : thanks
    Created on : Jun 15, 2024, 5:15:14 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            .message {
                margin: 20px 0;
                font-size: 18px;
            }
            .link {
                color: red;
                text-decoration: none;
            }
            .button {
                background-color: #ea5455;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <jsp:include page="nav.jsp"/>
            <div class="container" style="text-align: center;margin: 50px auto;width: 50%;border: 1px solid #f0f0f0;padding: 20px;border-radius: 10px;background-color: #fdfdfd;">
                <div class="header" style="background-color: #fca82d;padding: 10px;font-size: 24px;font-weight: bold;color: white;">ĐẶT HÀNG THÀNH CÔNG</div>
                <div class="message">
                    Chúc mừng bạn đã hoàn tất đơn hàng.<br>
                    Chúng tôi sẽ kiểm tra và liên hệ giao hàng đến bạn trong thời gian sớm nhất!<br>
                    Để xem lại đơn hàng, vui lòng <a href="#" class="link">nhấn vào đây</a>.
                </div>
                <a href="home" class="button">QUAY LẠI TRANG CHỦ</a>
            </div>        
        <jsp:include page="nav2.jsp"/>
    </body>
</html>


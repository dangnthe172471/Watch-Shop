<%-- 
    Document   : confirm
    Created on : Jun 18, 2024, 1:34:17 PM
    Author     : dung2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Xác nhận thay đổi thông tin</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" href="css/style.css">
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- My CSS -->
        <link rel="stylesheet" href="css/manage.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/home.css">        
        <link rel="stylesheet" href="css/nav.css">
        <link rel="stylesheet" href="css/profile.css">
        <link rel="stylesheet" type="text/css" href="slick/slick.css" />
        <link rel="stylesheet" type="text/css" href="slick/slick-theme.css" />
        <script type="text/javascript" src="slick/slick.min.js"></script>
    </head>
    <body>
        <jsp:include page="leftprofile.jsp" />
        <section id="content" class="container mt-1">
            <div class="head-title">
                <div class="left">
                    <h2 style="color: blue">Hồ Sơ Của Tôi</h2>
                    <h5>Thay đổi thông tin Hồ Sơ của bạn</h5>
                </div>
            </div>
        </section>

        <section id="content" class="container mt-5">


            <% String message = request.getParameter("message");
           if (message != null) { %>
            <div class="alert alert-success"><%= message %></div>
            <% } %>

            <% String error = request.getParameter("error");
           if (error != null) { %>
            <div class="alert alert-danger"><%= error %></div>
            <% } %>
            <div class="row">
                <div class="col-md-6">
                    <form id="sendOTPForm" action="sendOTP" method="post">
                        <div class="form-group">
                            <label for="email">Nhập email hiện tại của bạn:</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                        <div class="form-group">
                            <label for="newEmail">Email mới:
                                <div id="emailMessage"></div></label>
                            <input type="email" class="form-control" id="newEmail" name="newEmail" required oninput="validateEmails(),checkWhitespace()">
                        </div>
                        <div class="form-group">
                            <label for="newPhone">Số điện thoại mới: <div id="phoneMessage"></div></label>
                            <input type="text" class="form-control" id="phoneNumber" name="newPhone" required oninput="validatePhoneNumber()">
                        </div>
                        <button type="submit" class="btn btn-primary">Gửi mã OTP</button>
                    </form>
                </div>
                <div class="col-md-1 d-flex justify-content-center align-items-center">
                    <div style="width: 1px; height: 100%; background-color: #ccc;"></div>
                </div>
                <div class="col-md-5">
                    <form id="confirmOTPForm" action="confirmUpdate" method="post">
                        <div class="form-group">
                            <label for="otp">Nhập mã OTP:</label>
                            <input type="text" class="form-control" id="otp" name="otp" required>
                        </div>
                        <button type="submit" class="btn btn-success">Xác nhận</button>
                    </form>
                </div>
            </div>
        </section>
        <script type="text/javascript" src="js/validation.js"></script>
        <script src="js/script.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>

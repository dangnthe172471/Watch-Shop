<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Order Tracking</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
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
            body {
                background-color: #f5f5f5;
                font-family: Arial, sans-serif;
            }
            .card {
                margin: 3vh auto;
                width: 80%;
                padding: 4vh;
                box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
                border-radius: 10px;
                background-color: #ffffff;
            }
            .title {
                color: #343a40;
                font-weight: 700;
                margin-bottom: 2vh;
                font-size: 24px;
                text-align: center;
            }
            .info {
                padding: 2% 8%;
            }
            .info .row {
                margin-bottom: 2vh;
            }
            #heading {
                color: #6c757d;
                font-weight: 500;
            }
            #details {
                font-weight: 400;
                color: #343a40;
            }
            .pricing {
                background-color: #f8f9fa;
                padding: 2vh 8%;
                margin-bottom: 2vh;
                border-radius: 10px;
            }
            .pricing .row {
                margin-bottom: 1vh;
            }
            .total {
                padding: 2vh 8%;
                color: #28a745;
                font-weight: bold;
                background-color: #e9f7ef;
                border-radius: 10px;
                margin-bottom: 2vh;
            }
            .footer {
                padding: 0 8%;
                font-size: small;
                color: #6c757d;
                text-align: center;
            }
            .footer a {
                color: #007bff;
            }
            .footer img {
                height: 5vh;
                opacity: 0.2;
            }
            .footer .col-10, .col-2 {
                display: flex;
                padding: 3vh 0 0;
                align-items: center;
            }
            .footer .row {
                margin: 0;
            }
            #progressbar {
                margin-bottom: 3vh;
                overflow: hidden;
                color: lightskyblue;
                padding-left: 0px;
                margin-top: 3vh;
            }
            #progressbar li {
                list-style-type: none;
                font-size: x-small;
                width: 25%;
                float: left;
                position: relative;
                font-weight: 400;
                color: rgb(160, 159, 159);
                text-align: center;
            }
            #progressbar li:before {
                line-height: 20px;
                display: block;
                font-size: 12px;
                background: #ddd;
                border-radius: 50%;
                margin: auto;
                z-index: -1;
                margin-bottom: 1vh;
                width: 20px;
                height: 20px;
                border: 2px solid lightskyblue;
                content: '';
            }
            #progressbar li:after {
                content: '';
                height: 2px;
                background: #ddd;
                position: absolute;
                left: 0%;
                right: 0%;
                margin-bottom: 2vh;
                top: 9px;
                z-index: 1;
            }
            #progressbar li.active {
                color: black;
            }
            #progressbar li.active:before,
            #progressbar li.active:after {
                background: lightskyblue;
                border-color: lightskyblue;
            }
            .step-icon {
                display: block;
                width: 20px;
                height: 20px;
                border-radius: 50%;
                margin: 0 auto 10px;
                background: white;
                border: 2px solid lightskyblue;
            }
        </style>
    </head>
    <body>
        <jsp:include page="leftprofile.jsp" />
        <section id="content" class="container" style="margin-left: 80px">
            <div class="card">
                <div class="title">Thông tin đơn hàng</div>
                <div class="info">
                    <div class="row">
                        <div class="col-7">
                            <span id="heading">Đơn hàng được đặt ngày:</span><br>
                            <span id="details">${orderDetails[0].orderDate}</span>
                        </div>
                        <div class="col-5 text-right">
                            <span id="heading">Dự kiến giao:</span><br>
                            <span id="details">${orderDetails[0].dateShip} - ${orderDetails[0].timeShip}</span>
                        </div>
                    </div>
                </div>
                <div class="pricing">
                    <c:forEach var="orderDetail" items="${orderDetails}">
                        <div class="row">
                            <div class="col-8">
                                <span id="name">${orderDetail.productName}</span><br>
                                <img src="${orderDetail.productImage}" class="media-object img-thumbnail" style="max-width: 100px;" />
                            </div>
                            <div class="col-4 text-right">
                                <span id="price">Giá tiền: ${orderDetail.formattedTotalPrice}</span>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="total">
                    <div class="row">
                        <div class="col-9">Tổng số tiền phải thanh toán:</div>
                        <div class="col-3 text-right"><big>${orderDetails[0].formattedTotalPrice}</big></div>
                    </div>
                </div>
                <div class="tracking">
                    <div class="title">Theo dõi đơn hàng</div>
                </div>
                <div class="progress-track">
                    <ul id="progressbar">
                        <li class="step0 ${orderDetails[0].orderStatus == 'Chờ giao hàng' || orderDetails[0].orderStatus == 'Đã nhận đơn' || orderDetails[0].orderStatus == 'Đang giao hàng' || orderDetails[0].orderStatus == 'Hoàn thành' ? 'active' : ''}" id="step1">
                            Đã đặt hàng
                        </li>
                        <li class="step0 ${orderDetails[0].orderStatus == 'Đã nhận đơn' || orderDetails[0].orderStatus == 'Đang giao hàng' || orderDetails[0].orderStatus == 'Hoàn thành' ? 'active' : ''}" id="step2">
                            Đã nhận đơn
                        </li>
                        <li class="step0 ${orderDetails[0].orderStatus == 'Đang giao hàng' || orderDetails[0].orderStatus == 'Hoàn thành' ? 'active' : ''}" id="step3">
                            Trên đường
                        </li>
                        <li class="step0 ${orderDetails[0].orderStatus == 'Hoàn thành' ? 'active' : ''}" id="step4">
                            Giao hàng thành công
                        </li>
                    </ul>
                </div>
                <hr>
                <div class="footer">
                    <p>Cảm ơn bạn đã tin tưởng và sử dụng dịch vụ của Watch Shop!</p>
                    <p>Mọi thắc mắc xin liên hệ với chúng tôi qua:</p>
                    <p>Hotline: 0962900476 hoặc Email: <a href="mailto:watchshop1804@gmail.com">watchshop1804@gmail.com</a>.</p>
                    <p>Chúng tôi sẽ cố gắng phản hồi bạn sớm nhất có thể!</p>
                </div>
            </div>
        </section>
    </body>
</html>

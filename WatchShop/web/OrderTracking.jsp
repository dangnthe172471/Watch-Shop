<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Order Tracking</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <style>
            .card {
                margin: auto;
                width: 100%;
                padding: 4vh 0;
                box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
                border-top: 3px solid lightskyblue;
                border-bottom: 3px solid lightskyblue;
                border-left: none;
                border-right: none;
            }
            .title {
                color: lightskyblue;
                font-weight: 600;
                margin-bottom: 2vh;
                padding: 0 8%;
                font-size: initial;
            }
            #details {
                font-weight: 400;
            }
            .info {
                padding: 5% 8%;
            }
            #heading {
                color: grey;
                line-height: 6vh;
            }
            .pricing {
                background-color: #ddd3;
                padding: 2vh 8%;
                font-weight: 400;
                line-height: 2.5;
            }
            .total {
                padding: 2vh 8%;
                color: lightskyblue;
                font-weight: bold;
            }
            .footer {
                padding: 0 8%;
                font-size: x-small;
                color: black;
            }
            .footer img {
                height: 5vh;
                opacity: 0.2;
            }
            .footer a {
                color: lightskyblue;
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
                margin-top: 3vh
            }

            #progressbar li {
                list-style-type: none;
                font-size: x-small;
                width: 25%;
                float: left;
                position: relative;
                font-weight: 400;
                color: rgb(160, 159, 159);
            }

            #progressbar li:before {
                line-height: 29px;
                display: block;
                font-size: 12px;
                background: #ddd;
                border-radius: 50%;
                margin: auto;
                z-index: -1;
                margin-bottom: 1vh;
            }

            #progressbar li:after {
                content: '';
                height: 2px;
                background: #ddd;
                position: absolute;
                left: 0%;
                right: 0%;
                margin-bottom: 2vh;
                top: 1px;
                z-index: 1;
            }
            .progress-track {
                padding: 0 8%;
            }

            #progressbar li.active {
                color: black;
            }

            #progressbar li.active:before,
            #progressbar li.active:after {
                background: lightskyblue;
            }
        </style>
    </head>
    <body>
        <div class="card">
            <div class="title">Thông tin đơn hàng</div>
            <div class="info">
                <div class="row">
                    <div class="col-7">
                        <span id="heading">Đơn hàng được đặt ngày:</span><br>
                        <span id="details">${orderDetail.orderDate}</span>
                    </div>
                    <div class="col-5 pull-right">

                        <span id="heading">Dự kiến giao:${orderDetail.dateShip}</span><br>
                        <span id="details">Thời gian:${orderDetail.timeShip}</span>
                    </div>
                </div>      
            </div>      
            <div class="pricing">
                <div class="row">
                    <div class="col-9">
                        <span id="name">Tên sản phẩm: ${orderDetail.productName}</span>  
                    </div>
                    <div class="col-3">
                        <span id="price">Giá tiền: ${orderDetail.formattedTotalPrice}</span>
                    </div>
                </div>
                <div class="row">
                    <div class="col-9">
                        <div class="col-5"><img src="${orderDetail.productImage}" class="media-object img-thumbnail" /></div>
                    </div>
                    <div class="col-3">
                        <span id="heading">Đơn hàng số:</span><br>
                        <span id="details">${orderDetail.orderId}</span>
                    </div>
                </div>
            </div>
            <div class="total">
                <div class="row">
                    <div class="col-9">Tổng số tiền phải thanh Toán:</div>
                    <div class="col-3"><big>${orderDetail.getFormattedTotalMoney()}</big></div>
                </div>
            </div>
            <div class="tracking">
                <div class="title">Theo dõi đơn hàng</div>
            </div>
            <div class="progress-track">
                <ul id="progressbar">
                    <li class="step0 ${orderDetail.orderStatus == 'Chờ giao hàng' || orderDetail.orderStatus == 'Đã nhận đơn' || orderDetail.orderStatus == 'Đang giao hàng' || orderDetail.orderStatus == 'Hoàn thành' ? 'active' : ''}" id="step1">Đã đặt hàng</li>
                    <li class="step0 ${orderDetail.orderStatus == 'Đã nhận đơn' || orderDetail.orderStatus == 'Đang giao hàng' || orderDetail.orderStatus == 'Hoàn thành' ? 'active' : ''}" id="step2">Đã vận chuyển</li>
                    <li class="step0 ${orderDetail.orderStatus == 'Đang giao hàng' || orderDetail.orderStatus == 'Hoàn thành' ? 'active' : ''}" id="step3">Trên đường</li>
                    <li class="step0 ${orderDetail.orderStatus == 'Hoàn thành' ? 'active' : ''}" id="step4">Giao hàng thành công</li>
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
    </body>
</html>

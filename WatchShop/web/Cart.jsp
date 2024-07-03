<%-- 
    Document   : Cart
    Created on : May 19, 2024, 8:20:22 PM
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
    </head>
    <body>
        <jsp:include page="nav.jsp"/>
        <c:if test="${size==0||sessionScope.cart==null}">

            <section class="content my-3">
                <div class="container">
                    <div class="cart-page bg-white">
                        <div class="row">
                            <!-- giao diện giỏ hàng khi không có item  -->
                            <div class="py-3 pl-3" style="height: 500px;">
                                <h6 class="header-gio-hang">GIỎ HÀNG CỦA BẠN <span>(0 sản phẩm)</span></h6>
                                <div class="cart-empty-content w-100 text-center justify-content-center" style="margin-left: 250px;margin-top: 150px">
                                    <a href="search" style="color: black"> <img src="img/shopping-cart-not-product.png" alt="shopping-cart-not-product">
                                        <p>Chưa có sản phẩm nào trong giở hàng của bạn</p></a>
                                    <a href="search" class="btn btn-primary nutmuathem mb-3">Mua thêm</a>
                                </div>
                            </div>
                        </div>
                    </div>    
                </div>
            </section>
        </c:if>

        <c:if test="${size!=0 && sessionScope.cart!=null}">
            <!-- giao diện giỏ hàng  -->
            <section class="content my-3">
                <div class="container">
                    <div class="cart-page bg-white">
                        <div class="row">
                            <div class="col-md-9 cart">
                                <div class="cart-content py-3 pl-3">
                                    <h6 class="header-gio-hang">GIỎ HÀNG CỦA BẠN</h6><br>
                                    <div class="cart-list-items">
                                        <div class="cart-item d-flex">
                                            <h5 style="width: 200px;">Sản phẩm</h5>
                                            <div class="item-caption d-flex w-100">
                                                <div class="soluong d-flex" style="margin-left: 58px;">
                                                    <h5> Số lượng</h5>
                                                </div>
                                                <div class="item-price ml-auto d-flex flex-column align-items-end">
                                                    <div class="giacu" style="margin-left: 170px;">Đơn giá</div>
                                                </div>
                                                <div class="item-price ml-auto d-flex flex-column align-items-end">
                                                    <div class="giacu">Thành tiền</div>
                                                </div>                                               
                                            </div>
                                            <div style="width: 115px;"></div>
                                        </div>
                                        <br>
                                        <c:set var="o" value="${sessionScope.cart}"/>
                                        <c:forEach items="${o.items}" var="i">
                                            <div class="cart-item d-flex">
                                                <a href="detail?pid=${i.product.id}" class="img">
                                                    <img src="${i.product.pimage.img1}" class="img-fluid" style="height: 100px;width: 150px;">
                                                </a>
                                                <div class="item-caption d-flex w-100">
                                                    <div class="item-info ml-2">
                                                        <a href="detail?pid=${i.product.id}" class="ten" style="display: -webkit-box;-webkit-line-clamp: 1;-webkit-box-orient: vertical;overflow: hidden;width: 340px;" title="${i.product.name}">${i.product.name}</a>
                                                        <div class="soluong d-flex">
                                                            <div class="input-number input-group mb-3">
                                                                <div class="input-group-prepend">
                                                                    <a  href="process?type=sub&pid=${i.product.id}" class="input-group-text btn-spin btn-dec" style="border: none;">-</a> 
                                                                </div>
                                                                <form action="process" id="f">
                                                                    <input type="hidden" name="pid" value="${i.product.id}"/>
                                                                    <input type="number" oninput="checkNum(this)" name="num" max="${i.product.quantity}" value="${i.quantity}" class="soluongsp numProduct text-center" style="height: 35px;">                                                                </form>
                                                                <div class="input-group-append" style="margin-left: -15px">
                                                                    <a href="process?type=add&&pid=${i.product.id}" class="input-group-text btn-spin btn-dec" style="border: none" >+</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="item-price ml-auto d-flex flex-column align-items-end">
                                                        <div class="giacu" style="margin-top: 30px; margin-left: -15px;"><fmt:formatNumber value="${i.price}"/></div>
                                                        <span class="remove mt-auto"><i class="far fa-trash-alt"></i></span>
                                                    </div>
                                                    <div class="item-price ml-auto d-flex flex-column align-items-end">
                                                        <div class="giamoi" style="margin-top: 32px"><fmt:formatNumber value="${i.quantity*i.price}"/> </div>
                                                        <span class="remove mt-auto"><i class="far fa-trash-alt"></i></span>
                                                    </div>
                                                </div>
                                                <div style="width: 100px;"><a href="process?type=remove&pid=${i.product.id}"><i class="fa fa-times text-danger" style="margin-left: 50px;margin-top: 33px;"></i></a></div>
                                            </div>

                                            <br>
                                        </c:forEach>
                                    </div> <br>
                                    <hr>

                                    <div class="row">
                                        <div class="col-md-3">
                                            <a href="search" class="btn btn-primary nutmuathem mb-3">Mua thêm</a>
                                        </div>
                                        <div class="col-md-5 offset-md-4">
                                            <div class="tonggiatien">
                                                <div class="group d-flex justify-content-between align-items-center">
                                                    <strong class="text-uppercase">Tổng cộng:</strong>
                                                    <p class="tongcong"><fmt:formatNumber value="${totalMoney}"/> vnđ</p>
                                                </div>
                                                <small class="note d-flex justify-content-end text-muted">
                                                    (Giá đã bao gồm VAT)
                                                </small>
                                            </div>
                                        </div>
                                    </div> 
                                    <c:if test="${error!=null}">
                                        <div style="margin-left: 250px;color: red;font-size: 20px;font-weight: bold">Tài khoản của bạn không đủ</div>
                                    </c:if>
                                </div>
                                <c:if test="${sessionScope.account==null}">
                                    <a href="checkout?pttt=ttweb"><button class="btn btn-lg btn-block btn-checkout text-uppercase text-white" id="btnCheckout"
                                                                          style="background: #F5A623;width: 133%;margin-left: 5px;">Đặt mua</button></a> 
                                    </c:if>
                            </div>

                            <c:if test="${sessionScope.account!=null}">
                                <button class="btn btn-lg btn-block btn-checkout text-uppercase text-white" id="btnCheckout"
                                        style="background: #F5A623; width: 96%;margin-left: 20px;" onclick="checkout()" >Đặt mua</button>
                            </c:if>

                            <!-- giao diện phần thanh toán nằm bên phải  -->
                            <div class="col-md-3 cart-steps pl-0" style="width: 200px;display: none" id="khoimua">
                                <div id="cart-steps-accordion" role="tablist" aria-multiselectable="true">
                                    <form action="checkout">                                        
                                        <div class="card">
                                            <div class="card-header" role="tab" id="step1header">
                                                <h5 class="mb-0">
                                                    <a data-toggle="collapse" data-parent="#cart-steps-accordion"
                                                       href="#step2contentid" aria-expanded="true" aria-controls="step2contentid"
                                                       class="text-uppercase header"><span class="steps">1</span>
                                                        <span class="label">Địa chỉ nhận hàng</span>
                                                        <i class="fa fa-chevron-right float-right"></i>
                                                    </a>
                                                </h5>
                                            </div>
                                            <div id="step1contentid" class="collapse in" role="tabpanel"
                                                 aria-labelledby="step1header" class="stepscontent">
                                                <div class="card-body">
                                                    <div class="form-label-group"><div id="fullnameMessage" style="width: 200%"></div>
                                                        <input type="text" id="fullname" class="form-control" value="${sessionScope.name!=null?sessionScope.name:sessionScope.account.user}"
                                                               placeholder="Nhập họ và tên" name="name" required autofocus oninput="validateFullName()">
                                                    </div>

                                                    <div class="form-label-group"><div id="phoneMessage" style="width: 200%"></div>
                                                        <input type="text" id="phoneNumber" class="form-control" value="${sessionScope.phone!=null?sessionScope.phone:sessionScope.account.phone}" 
                                                               placeholder="Nhập số điện thoại" name="phone" required oninput="validatePhoneNumber()">
                                                    </div>

                                                    <div class="form-label-group"><div id="emailMessage" style="width: 200%"></div>
                                                        <input type="email" id="email" class="form-control" value="${sessionScope.email!=null?sessionScope.email:sessionScope.account.email}" 
                                                               placeholder="Nhập địa chỉ email" name="email" required oninput="validateEmail()">
                                                    </div>

                                                    <div class="form-label-group"><div id="addressMessage" style="width: 200%"></div>
                                                        <input type="text" id="address" class="form-control" value="${sessionScope.address!=null?sessionScope.address:sessionScope.account.address}" 
                                                               placeholder="Nhập Địa chỉ giao hàng" name="address" required oninput="validateAddress()">
                                                    </div>   

                                                    <div class="form-label-group"><label>Chọn ngày muốn nhận hàng</label>
                                                        <input type="date" id="dateShip" id="address" class="form-control" value="${sessionScope.dateShip!=null?sessionScope.dateShip:''}" name="dateShip">
                                                    </div>

                                                    <div class="form-label-group"><label>Chọn khung giờ nhận hàng</label>
                                                        <input type="time" class="form-control" value="${sessionScope.timeShip!=null?sessionScope.timeShip:''}" name="timeShip">
                                                    </div>  

                                                    <div class="form-label-group">
                                                        <textarea type="text" id="inputNote" class="form-control"
                                                                  placeholder="Nhập ghi chú (Nếu có)" name="note">${sessionScope.note!=null?sessionScope.note:''}</textarea>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- bước 3: thanh toán đặt mua  -->
                                            <div class="card">
                                                <div class="card-header" role="tab" id="step2header">
                                                    <h5 class="mb-0">
                                                        <a data-toggle="collapse" data-parent="#cart-steps-accordion"
                                                           href="#step3contentid" aria-expanded="true"
                                                           aria-controls="step3contentid" class="text-uppercase header"><span
                                                                class="steps">2</span>
                                                            <span class="label">Thanh toán đặt mua</span>
                                                            <i class="fa fa-chevron-right float-right"></i>
                                                        </a>
                                                    </h5>
                                                </div>
                                                <div id="step3contentid" class="collapse in" role="tabpanel"
                                                     aria-labelledby="step3header" class="stepscontent">
                                                    <div class="card-body" style="padding: 15px;">                                                 
                                                        <div class="pttt">
                                                            <h6 class="header text-uppercase">Chọn phương thức thanh toán</h6>
                                                            <div class="option mb-2">
                                                                <input type="radio" name="pttt" value="ttweb" id="cod" checked>
                                                                <label for="cod">Thanh toán bằng tiền tài khoản shop</label>
                                                            </div>
                                                            <div class="option option2">
                                                                <input type="radio" name="pttt" value="ttpay" id="atm">
                                                                <label for="atm" class="chuyenkhoan">Thanh toán chuyển khoản qua Thẻ ATM/Internet Banking</label>
                                                                <p>- Thời gian chuyển khoản là trong tối đa 1 ngày từ khi có xác
                                                                    nhận đặt mua.</p>
                                                                <p>- Nội dung chuyển khoản cần ghi: <a href="#">[Mã đơn hàng]</a> ;
                                                                    hoặc <a href="#">[số điện thoại dùng đặt hàng]</a> </p>
                                                                <p>- Xem thông tin chuyển khoản của VNPay <a
                                                                        href="https://vnpay.vn/chuyen-tien-nhanh-chong-tien-loi-tren-vi-dien-tu-VNPAY-05f976gm2g7i">tại đây</a> </p>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <button type="submit" class="btn btn-lg btn-block btn-checkout text-uppercase text-white"
                                                                style="background: #F5A623">Đặt mua</button>
                                                        <p class="text-center note-before-checkout">(Vui lòng kiểm tra lại đơn hàng
                                                            trước khi Đặt Mua)</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- het div cart-steps  -->
                        </div>
                        <!-- het row  -->
                    </div>
                    <!-- het cart-page  -->
                </div>
                <!-- het container  -->
            </section>
        </c:if>
        <!-- het khoi content  -->
        <jsp:include page="nav2.jsp"/>
        <script src="js/cart.js"></script>
        <script>
                                            function checkout() {
                                                var x = document.getElementById("btnCheckout");
                                                var y = document.getElementById("khoimua");
                                                x.style.display = "none";
                                                y.style.display = "";
                                            }
        </script>
        <%
            session.setAttribute("error", "error");
        %>
        <script type="text/javascript">
            setTimeout(function () {
            <% session.removeAttribute("error"); %>
            }, 1000);
        </script>
    </body>
</html>

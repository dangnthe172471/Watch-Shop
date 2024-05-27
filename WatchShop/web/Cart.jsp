<%-- 
    Document   : Cart
    Created on : May 19, 2024, 8:20:22 PM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <!-- giao diện giỏ hàng  -->
        <section class="content my-3">
            <div class="container">
                <div class="cart-page bg-white">
                    <div class="row">
                        <div class="col-md-8 cart">
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
                                                <span class="remove mt-auto"><i class="far fa-trash-alt"></i></span>
                                            </div>
                                            <div class="item-price ml-auto d-flex flex-column align-items-end">
                                                <div class="giacu">Thành tiền</div>
                                                <span class="remove mt-auto"><i class="far fa-trash-alt"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                    <c:set var="o" value="${sessionScope.cart}"/>
                                    <c:set var="t" value="0"/>
                                    <c:forEach items="${o.items}" var="i">
                                        <div class="cart-item d-flex">
                                            <a href="detail?pid=${i.product.id}" class="img">
                                                <img src="${i.product.image}" class="img-fluid" style="height: 100px;width: 150px;">
                                            </a>
                                            <div class="item-caption d-flex w-100">
                                                <div class="item-info ml-2">
                                                    <a href="detail?pid=${i.product.id}" class="ten" style="display: -webkit-box;-webkit-line-clamp: 1;-webkit-box-orient: vertical;overflow: hidden;width: 340px;" title="${i.product.name}">${i.product.name}</a>
                                                    <div class="soluong d-flex">
                                                        <div class="input-number input-group mb-3">
                                                            <div class="input-group-prepend">
                                                                <a  href="#" class="input-group-text btn-spin btn-dec" style="border: none;">-</a> 
                                                            </div>
                                                            <input type="text" value="${i.quantity}" class="soluongsp  text-center">
                                                            <div class="input-group-append">
                                                                <a href="#" class="input-group-text btn-spin btn-dec" style="border: none" >+</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="item-price ml-auto d-flex flex-column align-items-end">
                                                    <div class="giacu" style="margin-top: 30px; margin-left: -15px;">${i.price} $</div>
                                                    <span class="remove mt-auto"><i class="far fa-trash-alt"></i></span>
                                                </div>
                                                <div class="item-price ml-auto d-flex flex-column align-items-end">
                                                    <div class="giamoi" style="margin-top: 32px">${i.quantity*i.price} $</div>
                                                    <span class="remove mt-auto"><i class="far fa-trash-alt"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                        <br>
                                    </c:forEach>
                                </div> <br>
                                <hr>

                                <div class="row">
                                    <div class="col-md-3">
                                        <a href="search" class="btn nutmuathem mb-3">Mua thêm</a>
                                    </div>
                                    <div class="col-md-5 offset-md-4">
                                        <div class="tonggiatien">
                                            <div class="group d-flex justify-content-between align-items-center">
                                                <strong class="text-uppercase">Tổng cộng:</strong>
                                                <p class="tongcong">${totalMoney} $</p>
                                            </div>
                                            <small class="note d-flex justify-content-end text-muted">
                                                (Giá đã bao gồm VAT)
                                            </small>
                                        </div>
                                    </div>
                                </div> 
                            </div>
                        </div>

                        <!-- giao diện phần thanh toán nằm bên phải  -->
                        <div class="col-md-4 cart-steps pl-0">
                            <div id="cart-steps-accordion" role="tablist" aria-multiselectable="true">
                                <div class="card">
                                    <div class="card-header" role="tab" id="step1header">
                                        <h5 class="mb-0">
                                            <a data-toggle="collapse" data-parent="#cart-steps-accordion"
                                               href="#step2contentid" aria-expanded="true" aria-controls="step2contentid"
                                               class="text-uppercase header"><span class="steps">1</span>
                                                <span class="label">Địa chỉ giao hàng</span>
                                                <i class="fa fa-chevron-right float-right"></i>
                                            </a>
                                        </h5>
                                    </div>
                                    <div id="step1contentid" class="collapse in" role="tabpanel"
                                         aria-labelledby="step1header" class="stepscontent">
                                        <div class="card-body">
                                            <form class="form-diachigiaohang">
                                                <div class="form-label-group">
                                                    <input type="text" id="inputName" class="form-control"
                                                           placeholder="Nhập họ và tên" name="name" required autofocus>
                                                </div>
                                                <div class="form-label-group">
                                                    <input type="text" id="inputPhone" class="form-control"
                                                           placeholder="Nhập số điện thoại" name="phone" required>
                                                </div>
                                                <div class="form-label-group">
                                                    <input type="email" id="inputEmail" class="form-control"
                                                           placeholder="Nhập địa chỉ email" name="email" required>
                                                </div>
                                                <div class="form-label-group">
                                                    <input type="text" id="inputAddress" class="form-control"
                                                           placeholder="Nhập Địa chỉ giao hàng" name="address" required>
                                                </div>
                                                <div class="form-label-group">
                                                    <input type="text" id="inputCity" class="form-control"
                                                           placeholder="Nhập Tỉnh/Thành phố" name="city" required>
                                                </div>
                                                <div class="form-label-group">
                                                    <input type="text" id="inputDistrict" class="form-control"
                                                           placeholder="Nhập Quận/Huyện" name="district" required>
                                                </div>
                                                <div class="form-label-group">
                                                    <textarea type="text" id="inputNote" class="form-control"
                                                              placeholder="Nhập ghi chú (Nếu có)" name="note"></textarea>
                                                </div>
                                            </form>
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
                                                <div class="goigiaohang">
                                                    <h6 class="header text-uppercase">Chọn gói giao hàng</h6>
                                                    <div class="option">
                                                        <input type="radio" name="goigiaohang" id="ghtc" checked>
                                                        <label for="ghtc">Giao hàng tiêu chuẩn</label>
                                                        <p>Từ 1-3 ngày tại TP. Hồ Chí Minh; từ 3-5 ngày đối với các Tỉnh /
                                                            Thành khác</p>
                                                    </div>
                                                    <div class="option">
                                                        <input type="radio" name="goigiaohang" id="ghn">
                                                        <label for="ghn">Giao hàng nhanh</label>
                                                        <p>1 ngày tại TP. Hồ Chí Minh; từ 2-3 ngày đối với các Tỉnh / Thành
                                                            khác</p>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="pttt">
                                                    <h6 class="header text-uppercase">Chọn phương thức thanh toán</h6>
                                                    <div class="option mb-2">
                                                        <input type="radio" name="pttt" id="cod" checked>
                                                        <label for="cod">Thanh toán bằng tiền mặt khi nhận hàng</label>
                                                    </div>
                                                    <div class="option option2">
                                                        <input type="radio" name="pttt" id="atm">
                                                        <label for="atm" class="chuyenkhoan">Thanh toán chuyển khoản trước
                                                            qua Thẻ ATM/Internet Banking</label>
                                                        <p class="mt-4">- Quý khách chỉ chuyển khoản khi được xác nhận có đủ
                                                            sách qua điện thoại từ DealBook.</p>
                                                        <p>- Thời gian chuyển khoản là trong tối đa 2 ngày từ khi có xác
                                                            nhận đủ sách.</p>
                                                        <p>- Nội dung chuyển khoản cần ghi: <a href="#">[Mã đơn hàng]</a> ;
                                                            hoặc <a href="#">[số điện thoại dùng đặt hàng]</a> </p>
                                                        <p>- Xem thông tin chuyển khoản của NetaBooks <a
                                                                href="phuong-thuc-thanh-toan.html">tại đây</a> </p>
                                                    </div>
                                                </div>
                                                <hr>
                                                <button class="btn btn-lg btn-block btn-checkout text-uppercase text-white"
                                                        style="background: #F5A623">Đặt mua</button>
                                                <p class="text-center note-before-checkout">(Vui lòng kiểm tra lại đơn hàng
                                                    trước khi Đặt Mua)</p>
                                            </div>
                                        </div>
                                    </div>

                                </div>

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
        <!-- het khoi content  -->
        <jsp:include page="nav2.jsp"/>

    </body>
</html>

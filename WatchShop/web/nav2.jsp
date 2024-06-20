<%-- 
    Document   : nav2
    Created on : May 8, 2024, 12:00:24 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <section class="abovefooter text-white" style="background-color: blue;">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-sm-6">
                        <div class="dichvu d-flex align-items-center">
                            <img src="img/icon-books.png" alt="icon-books">
                            <div class="noidung">
                                <h3 class="tieude font-weight-bold">NHIỀU SẢN PHẨM HẤP DẪN</h3>
                                <p class="detail">Tuyển chọn bởi WDONGHO</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="dichvu d-flex align-items-center">
                            <img src="img/icon-ship.png" alt="icon-ship">
                            <div class="noidung">
                                <h3 class="tieude font-weight-bold">MIỄN PHÍ GIAO HÀNG</h3>
                                <p class="detail">Miễn phí giao hàng toàn quốc</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="dichvu d-flex align-items-center">
                            <img src="img/icon-gift.png" alt="icon-gift">
                            <div class="noidung">
                                <h3 class="tieude font-weight-bold">QUÀ TẶNG MIỄN PHÍ</h3>
                                <p class="detail">Thay pin miễn phí</p>
                                <p class="detail">Móc khóa logo</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="dichvu d-flex align-items-center">
                            <img src="img/icon-return.png" alt="icon-return">
                            <div class="noidung">
                                <h3 class="tieude font-weight-bold">ĐỔI TRẢ NHANH CHÓNG</h3>
                                <p class="detail">Hàng bị lỗi được đổi trả nhanh chóng</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <br>
        <!-- footer  -->
        <footer>
            <div class="container py-4">
                <div class="row">
                    <div class="col-md-4 col-xs-6">
                        <div class="gioithieu">
                            <h3 class="header text-uppercase font-weight-bold">Về WATCH SHOP</h3>
                            <a href="#">Giới thiệu về WATCH SHOP</a>
                            <a href="#">Tuyển dụng</a>
                        </div>
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <div class="hotrokh">
                            <h3 class="header text-uppercase font-weight-bold">HỖ TRỢ KHÁCH HÀNG</h3>
                            <a href="#">Hướng dẫn đặt hàng</a>
                            <a href="#">Phương thức thanh toán</a>
                            <a href="#">Phương thức vận chuyển</a>
                            <a href="#">Chính sách đổi trả</a>
                        </div>
                    </div>                 
                    <div class="col-md-4 col-xs-6">
                        <div class="ptthanhtoan">
                            <h3 class="header text-uppercase font-weight-bold">Phương thức thanh toán</h3>
                            <img src="img/visa-payment.jpg" alt="visa-payment">
                            <img src="img/master-card-payment.jpg" alt="master-card-payment">
                            <img src="img/jcb-payment.jpg" alt="jcb-payment">
                            <img src="img/payoo-payment.jpg" alt="payoo-payment">
                        </div>
                    </div>
                    <div class="col-md-12 col-xs-6">
                        <div class="lienket">
                            <h3 class="header text-uppercase font-weight-bold">Địa chỉ</h3>
                            <iframe src="https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d3132.444306391705!2d105.53245210294008!3d20.98762361112083!3m2!1i1024!2i768!4f13.1!5e0!3m2!1svi!2s!4v1718800407964!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </footer>

        <!-- nut cuon len dau trang -->
        <div class="fixed-bottom">
            <div class="btn btn-warning float-right rounded-circle nutcuonlen" id="backtotop" href="#"
                 style="background:#CF111A;"><i class="fa fa-chevron-up text-white"></i></div>
        </div>
    </body>
</html>

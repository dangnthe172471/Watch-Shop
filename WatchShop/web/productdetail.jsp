<%-- 
    Document   : detail
    Created on : May 8, 2024, 6:38:56 PM
    Author     : admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Watch Shop</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/product-item.css">
        <link rel="stylesheet" href="css/home.css">
        <link rel="stylesheet" href="css/nav.css">
        <link rel="stylesheet" type="text/css" href="slick/slick.css" />
        <link rel="stylesheet" type="text/css" href="slick/slick-theme.css" />
        <script type="text/javascript" src="slick/slick.min.js"></script>
        <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>
        <script type="text/javascript" src="js/main.js"></script>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script> 

    </head>
    <body>
        <jsp:include page="nav.jsp"/>

        <section class="product-page mb-4">
            <div class="container">
                <div class="product-detail bg-white p-4">
                    <div class="row">
                        <div class="col-md-6 khoianh">
                            <div class="anhto mb-4">
                                <a class="active" href="detail?pid=${detail.id}" data-fancybox="thumb-img" style="cursor: pointer;">
                                    <img id="main-image" class="product-image" src="${detail.pimage.img1}" alt="" style="width: 520px;height: 580px;">
                                </a>
                            </div>
                            <div class="list-anhchitiet d-flex mb-4" style="margin-left: 4rem;">
                                <img class="thumb-img mr-3" src="${detail.pimage.img1}" class="img-fluid" style="cursor: pointer;">
                                <img class="thumb-img mr-3" src="${detail.pimage.img2}" class="img-fluid" style="cursor: pointer;">
                                <img class="thumb-img mr-3" src="${detail.pimage.img3}" class="img-fluid" style="cursor: pointer;">
                                <img class="thumb-img mr-3" src="${detail.pimage.img4}" class="img-fluid" style="cursor: pointer;">
                            </div>
                        </div>

                        <div class="col-md-5 khoithongtin" style="margin-left: 50px;margin-top: 30px;">
                            <form name="f" action="" method="post">
                                <div class="row">
                                    <div class="col-md-12 header">
                                        <h4 class="ten">${detail.name}</h4>
                                        <h5 class="ten">Mã Sản phẩm: ${detail.code}</h5>
                                        <p style="margin: 15px 0;">Đánh giá: ${detail.rate}<i class="fa fa-star" style="color: blue"></i></p>
                                    </div>
                                    <div class="col-md-9">
                                        <div class="gia">
                                            <div style="color: red; font-size:30px; font-weight:bold;">${detail.price} $</div>
                                            <div style="margin: 15px 0;font-size: 16px">Ngày sản xuất: <input type="date" value="${detail.releaseDate}" readonly style="border: none"/> </div>
                                            <div style="margin: 15px 0;font-size: 16px">Đã bán: <b>${detail.sold}</b> </div>
                                        </div>
                                        <div class="uudai my-3">
                                            <h6 class="header font-weight-bold">Khuyến mãi & Ưu đãi tại Watch Shop</h6>
                                            <ul>
                                                <li><b>Miễn phí giao hàng </b>cho mọi đơn hàng</li>
                                                <li><b>Đổi trả hàng nhanh chóng khi gặp lỗi </b></li>
                                                <li>Thay pin miễn phí và tặng móc khóa cho mọi đơn hàng</li>
                                            </ul>
                                        </div>
                                        <div class="soluong d-flex">
                                            <label class="font-weight-bold">Số lượng: </label>
                                            <dd>
                                                <input type="number" name="num" style="width:70px;" min="1" max="${detail.quantity}" value="1" >
                                            </dd>                                       
                                        </div>
                                        <label class="font-weight-bold" style="color: red">Lượng hàng trong kho (${detail.quantity})</label>
                                        <a href="#" onclick="addCart('${detail.id}')" class="btn btn-primary" style="width:200px; color: white" >Chọn mua</a>
                                        <P>Gọi đặt mua: 0962900476 (8:00-21:30)</P>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="row">
                            <div class="col-md-5">
                                <h5 style="font-weight: bold;"><i class="fa fa-address-card-o" style="font-size:24px"></i> Thông tin sản phẩm</h5>
                                <c:forEach  items="${listB}" var="c">
                                    <p style="display: ${detail.brandID ==c.bid?'':'none'};margin: 15px 0"><span style="font-weight: bold">Thương hiệu:</span> ${c.bname}<p>
                                    </c:forEach>
                                <p style="margin: 15px 0"><span style="font-weight: bold">Số hiệu sản phẩm:</span> ${detail.code}</p> 
                                <c:forEach  items="${listC}" var="c">
                                    <p style="display: ${detail.cateID1 ==c.cid?'':'none'};margin: 15px 0"><span style="font-weight: bold">Giới tính:</span> ${c.cname}<p>
                                    </c:forEach>
                                    <c:forEach  items="${listC}" var="c">
                                    <p style="display: ${detail.cateID2 ==c.cid?'':'none'};margin: 15px 0"><span style="font-weight: bold">Chống nước:</span> ${c.cname}<p>
                                    </c:forEach>
                                    <c:forEach  items="${listC}" var="c">
                                    <p style="display: ${detail.cateID3 ==c.cid?'':'none'};margin: 15px 0"><span style="font-weight: bold">Đường kính mặt số:</span> ${c.cname}<p>
                                    </c:forEach>
                                <p style="margin: 15px 0"><span style="font-weight: bold">Kính:</span> Mineral Crystal (Kính cứng)</p> 
                                <p style="margin: 15px 0"><span style="font-weight: bold">Chức năng:</span>  Lịch ngày – Lịch thứ</p> 

                                <p style="margin: 15px 0">Bảo hành quốc tế: 1 năm</p> 
                                <p style="margin: 15px 0">Bảo hành tại Watch Shop: 5 năm</p> 
                            </div>
                            <div class="col-md-7">
                                <h4 style="margin-left: 15px; font-weight: bold"><i class="fa fa-file-text-o" style="font-size:24px;"></i> Mô tả sản phẩm</h4>
                                <div class="tab-content" id="nav-tabContent">
                                    <div class="tab-pane fade show active ml-3" id="nav-gioithieu" role="tabpanel" aria-labelledby="nav-gioithieu-tab">
                                        <p>${detail.description}</p>
                                    </div>
                                </div>
                            </div>
                        </div>  
                        <div class="col-md-12">
                            <h4>Đánh giá</h4>
                            <c:if test="${sessionScope.account.roleID==4}">
                                <c:if test="${feedback==1}">
                                    <form action="comment" style="margin-top: 20px;" id="feedback">
                                        <div style="display: flex; align-items: center; padding-left: 10px;">
                                            <img src="${sessionScope.account.avatar}" style="width: 40px;height: 40px;border-radius: 50%;"/>
                                            <h6 style="margin-left: 10px;font-size:20px;color: red;margin-top: 10px;">${sessionScope.account.user}</h6>
                                        </div>
                                        <textarea style="height: 80px;width: 300px;margin-top: 10px;" name="content" placeholder="Viết đánh giá của bạn tại đây"></textarea>                              

                                        <select name="voted" style="margin: 10px 0">
                                            <option value="5" style="text-align: center">⭐⭐⭐⭐⭐</option>
                                            <option value="4" style="text-align: center">⭐⭐⭐⭐</option> 
                                            <option value="3" style="text-align: center">⭐⭐⭐</option>
                                            <option value="2" style="text-align: center">⭐⭐</option>
                                            <option value="1" style="text-align: center">⭐</option>                                                                     
                                        </select>
                                        <div class="g-recaptcha" data-sitekey="6LePFu8pAAAAAGmtUh76Nc4A3dKyJG-S6ioyycBR" data-callback="hideWarning"></div>                                        
                                        <div style="color: red; display: none" id="uncheck">Vui lòng xác thực bạn không phải là robot</div>
                                        <input type="button" onclick="checkCaptcha()" value="Đánh giá" style="margin-top: 10px;">
                                        <input value="${detail.id}" type="hidden" name="pid">
                                        <input value="${sessionScope.account.id}" type="hidden" name="aid">
                                    </form><br>
                                </c:if>
                                <c:if test="${feedback!=1}">
                                    <span style="font-size: 18px;">Bạn chưa mua sản phẩm này! Hãy mua sản phẩm để được đánh giá!</span>
                                </c:if>
                            </c:if>
                            <c:if test="${sessionScope.account.roleID!=4}">
                                <span style="font-size: 18px;">Vui lòng <a href="login" style="color: red"> đăng nhập </a> tài khoản khách hàng để đánh giá!</span>
                            </c:if>
                            <div>                                        
                                <c:forEach items="${listCo}" var="co">
                                    <div style="display: flex; align-items: center; padding-left: 10px;border: 0.5px solid black;margin-bottom: 10px;">
                                        <img src="${co.account.avatar}" style="width: 50px;height: 50px;border-radius: 50%"/>
                                        <h6 style="margin-left: 10px;font-size:20px; padding-top: 10px;color: red">${co.account.user} <span style="font-size:18px; font-weight: normal; color: black">(${co.voted}⭐)</span><br><span style="font-size:18px; font-weight: normal; color: black">${co.content}</span></h6>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="clearfix row" >
                                <c:if test="${countP >= 4}">
                                    <div class="hint-text" style="margin-top: 22px;margin-left: 10px;">Showing <b>4</b> comment of <b>${countP}</b> feedback</div>
                                </c:if>
                                <c:if test="${countP < 4}">
                                    <div class="hint-text" style="margin-top: 22px;margin-left: 10px;">Showing <b>${countP}</b> comment of <b>${countP}</b> feedback</div>
                                </c:if>  
                                <c:if test="${endP > 1}">
                                    <form action="detail">
                                        <input type="hidden" value="${detail.id}" name="pid">
                                        <c:set var="i" value="${page}"/>
                                        <ul class="pagination" style="margin-left: 145px;margin-top: 15px;">  
                                            <button name="index" value="${i-1}" type="${i>1?'submit':'button'}" style="width: 88px;height: 38px;border: 1px solid black;background-color: ${i>1?'white':'#9698ab'}">Previous</button>
                                            <c:forEach begin="1" end="${endP}" var="i">                                             
                                                <li>
                                                    <button name="index" value="${i}" type="submit" style="width: 35px;height: 38px;border: 1px solid black;background-color:${page==i?'#007BFF':'white'}">${i}</button>
                                                </li>
                                            </c:forEach>  
                                            <c:set var="i" value="${page}"/>
                                            <button name="index" value="${i+1}" type="${i<endP?'submit':'button'}" style="width: 58px;height: 38px;border: 1px solid black;background-color: ${i<endP?'white':'#9698ab'}">Next</button>
                                        </ul>
                                    </form>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="container">
            <h2>Sản phẩm bạn có thể thích</h2>
            <div class="row col-12 col-md-12 col-lg-12">                  
                <c:forEach items="${listP}" var="o">                                 
                    <div class="col-12 col-md-3 col-lg-3">
                        <div class="card">
                            <a href="detail?pid=${o.id}" class="motsanpham" style="text-decoration: none; color: black;" data-toggle="tooltip" data-placement="bottom">
                                <img class="card-img-top anh" src="${o.pimage.img1}" style="height: 250px">
                                <div class="card-body noidungsp mt-3">
                                    <h3 class="card-title ten">${o.name}</h3>
                                    <div class="gia d-flex align-items-baseline">
                                        <div class="giamoi">${o.price} $</div>
                                        <div class="giacu text-muted"><del>${o.price+350} $</del></div>
                                        <div class="sale">-10%</div>
                                    </div>
                                    <div class="danhgia">
                                        Đã bán: ${o.sold}
                                        <span style="margin-left:50px">${o.rate}<i class="fa fa-star" style="color: yellow"></i></span>
                                    </div>
                                </div>
                            </a>
                        </div> 
                    </div>
                </c:forEach>                               
            </div>
        </section>
        <br>
        <jsp:include page="nav2.jsp"/>

        <script type="text/javascript">
            function checkCaptcha() {
                var form = document.getElementById("feedback");
                var uncheck = document.getElementById("uncheck");
                const response = grecaptcha.getResponse();
                console.log(response);
                if (response) {
                    form.submit();
                } else {
                    uncheck.style.display = "";
                }
            }

            function hideWarning() {
                var uncheck = document.getElementById("uncheck");
                uncheck.style.display = "none";
            }
        </script>
        <p style="color: springgreen;font-size: 14px;"></p>
        <script type="text/javascript">
            function addCart(id) {
                // Tạo box thông báo
                var notification = document.createElement('div');
                notification.innerHTML = "Sản phẩm đã được thêm vào giỏ hàng !";
                notification.style.position = 'fixed';
                notification.style.fontSize = '15px';
                notification.style.top = '15px';
                notification.style.right = '25px';
                notification.style.padding = '15px';
                notification.style.backgroundColor = '#28a745';
                notification.style.color = '#fff';
                notification.style.borderRadius = '5px';
                document.body.appendChild(notification);

//                 Thực hiện hành động add to cart
                setTimeout(function () {
                    document.f.action = "buy?id=" + id;
                    document.f.submit();
                }, 800);
            }
        </script>

        <!--doi anh-->
        <script>
            const thumbImages = document.querySelectorAll('.thumb-img');
            const mainImage = document.getElementById('main-image');
            thumbImages.forEach(img => {
                img.addEventListener('click', function () {
                    // Đổi src của ảnh chính thành src của ảnh thumb được click
                    mainImage.src = this.src;
                });
            });
        </script>

        <script src="//cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
        <!--<script src="//cdn.ckeditor.com/4.22.1/basic/ckeditor.js"></script>-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>    
        <!--ckeditor-->
        <script>
            CKEDITOR.replace('content');
        </script>
    </body>
</html>

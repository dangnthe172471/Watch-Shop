<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
        <!-- banner -->
        <div class="container" style="padding-top: 10px;">
            <div id="carouselId" class="carousel slide" data-ride="carousel">
                <ol class="nutcarousel carousel-indicators rounded-circle">
                    <li data-target="#carouselId" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselId" data-slide-to="1"></li>
                    <li data-target="#carouselId" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <a href="#"><img src="img/banner1.png" class="img-fluid"    
                                         style="height: 350px;" width="100%" alt="First slide"></a>
                    </div>
                    <div class="carousel-item">
                        <a href="#"><img src="img/banner2.png" class="img-fluid"
                                         style="height: 350px;" width="100%" alt="Second slide"></a>
                    </div>
                    <div class="carousel-item">
                        <a href="#"><img src="img/banner3.png" class="img-fluid"
                                         style="height: 350px;" width="100%" alt="Third slide"></a>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselId" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselId" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>

        <br>
        <section class="_1khoi bg-white mt-2">
            <div class="container">
                <div class="noidung" style=" width: 100%;">
                    <div class="row">
                        <div class="col-12 d-flex justify-content-between align-items-center pb-2 ">
                            <h2 class="header text-uppercase" style="font-weight: 400;">Sản phẩm mới</h2>
                        </div>
                    </div>
                    <div class="khoisanpham" style="padding-bottom: 2rem;">
                        <c:forEach items="${listP1}" var="o">
                            <div class="card">
                                <a href="detail?pid=${o.id}" class="motsanpham" style="text-decoration: none; color: black;" data-toggle="tooltip" data-placement="bottom">
                                    <img class="card-img-top anh" src="${o.pimage.img1}" style="height: 250px">
                                    <div class="card-body noidungsp mt-3">
                                        <h3 class="card-title ten">${o.name}</h3>
                                        <div class="gia d-flex align-items-baseline">
                                            <div class="giamoi"><fmt:formatNumber value="${o.price}"/> vnđ</div>
                                            <div class="giacu text-muted ml-1"><del><fmt:formatNumber value="${o.price*1.1}"/> vnđ</del></div>
                                            <div class="sale">-10%</div>
                                        </div>
                                        <div class="danhgia">
                                            ${o.rate}<i class="fa fa-star" style="color: yellow"></i>
                                        </div>
                                    </div>
                                </a>
                            </div>       
                        </c:forEach>
                    </div>
                </div>
            </div>
        </section>

        <section class="_1khoi">
            <div class="container">
                <div class="noidung bg-white" style=" width: 100%;">
                    <div class="row">
                        <div class="col-12 d-flex justify-content-between align-items-center pb-2 bg-light">
                            <h2 class="header text-uppercase" style="font-weight: 400;">Sản phẩm bán chạy</h2>
                        </div>
                    </div>
                    <div class="khoisanpham">
                        <c:forEach var="o" items="${listP2}">
                            <div class="card">
                                <a href="detail?pid=${o.id}" class="motsanpham" style="text-decoration: none; color: black;" data-toggle="tooltip" data-placement="bottom">
                                    <img class="card-img-top anh" src="${o.pimage.img1}" style="height: 250px">
                                    <div class="card-body noidungsp mt-3">
                                        <h3 class="card-title ten">${o.name}</h3>
                                        <div class="gia d-flex align-items-baseline">
                                            <div class="giamoi"><fmt:formatNumber value="${o.price}"/> vnđ</div>
                                            <div class="giacu text-muted ml-1"><del><fmt:formatNumber value="${o.price*1.1}"/> vnđ</del></div>
                                            <div class="sale">-10%</div>
                                        </div>
                                        <div class="danhgia">
                                            ${o.rate}<i class="fa fa-star" style="color: yellow"></i>
                                        </div>
                                    </div>
                                </a>
                            </div>  
                        </c:forEach>
                    </div>
                </div>
            </div>
        </section>

        <section class="_1khoi" style="margin-top: 25px;">
            <div class="container">
                <div class="noidung bg-white" style=" width: 100%;">
                    <div class="row">
                        <div class="col-12 d-flex justify-content-between align-items-center pb-2 bg-light">
                            <h2 class="header text-uppercase" style="font-weight: 400;">Sản phẩm Giá tốt</h2>
                        </div>
                    </div>
                    <div class="khoisanpham">
                        <c:forEach var="o" items="${listP3}">
                            <div class="card">
                                <a href="detail?pid=${o.id}" class="motsanpham" style="text-decoration: none; color: black;" data-toggle="tooltip" data-placement="bottom">
                                    <img class="card-img-top anh" src="${o.pimage.img1}" style="height: 250px">
                                    <div class="card-body noidungsp mt-3">
                                        <h3 class="card-title ten">${o.name}</h3>
                                        <div class="gia d-flex align-items-baseline">
                                            <div class="giamoi"><fmt:formatNumber value="${o.price}"/> vnđ</div>
                                            <div class="giacu text-muted ml-1"><del><fmt:formatNumber value="${o.price*1.1}"/> vnđ</del></div>
                                            <div class="sale">-10%</div>
                                        </div>
                                        <div class="danhgia">
                                            ${o.rate}<i class="fa fa-star" style="color: yellow"></i>
                                        </div>
                                    </div>
                                </a>
                            </div>  
                        </c:forEach>
                    </div>
                </div>
            </div>
        </section>
        <br>
        <div class="container" style="margin-bottom: 30px">
            <div class="col-inner"> 
                <div id="text-3185983446" class="text">
                    <h2 class="uppercase">Thương hiệu đồng hồ nổi tiếng</h2>
                    <style>
                        #text-3185983446 {
                            font-size: 0.75rem;
                            text-align: center;
                        }
                    </style>
                    <div class="row">
                        <a href="search?bid=1" class="col-md-2" style="border: 1px solid black; margin-right: 120px;"><img src="img/logorolex.jpg" style="width: 100%;height: 95px"/></a>
                        <a href="search?bid=2" class="col-md-2" style="border: 1px solid black; margin-right: 120px;"><img src="img/logocartier.jpg" style="width: 100%;height: 95px"/></a>
                        <a href="search?bid=3" class="col-md-2" style="border: 1px solid black; margin-right: 120px;"><img src="img/logoAude.jpg" style="width: 100%;height: 95px"/></a>
                        <a href="search?bid=4" class="col-md-2" style="border: 1px solid black;"> <img src="img/logoPatek.png" style="width: 100%;height: 95px"/></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="container" style="margin-bottom: 20px;">
            <img src="img/footerhome.jpg" style="width: 100%"/>
        </div>
        <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
    <df-messenger
        intent="WELCOME"
        chat-title="WatchShop"
        agent-id="07d6d881-7f37-481b-b15f-58830e1c2667"
        language-code="vi"
        ></df-messenger>
        <jsp:include page="nav2.jsp" />       
</body>
</html>

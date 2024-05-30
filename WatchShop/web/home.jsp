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
        <!-- Sản phẩm pham moi  -->
        <section class="_1khoi bg-white">
            <div class="container">
                <div class="noidung" style=" width: 100%;">
                    <div class="row">
                        <!--header -->
                        <div class="col-12 d-flex justify-content-between align-items-center pb-2 ">
                            <h2 class="header text-uppercase" style="font-weight: 400;">Sản phẩm mới</h2>
                        </div>
                    </div>
                    <div class="khoisanpham" style="padding-bottom: 2rem;">
                        <c:forEach items="${listP1}" var="o">
                            <div class="card">
                                <a href="detail?pid=${o.id}" class="motsanpham" style="text-decoration: none; color: black;" data-toggle="tooltip" data-placement="bottom">
                                    <img class="card-img-top anh" src="${o.image}" style="height: 250px">
                                    <div class="card-body noidungsp mt-3">
                                        <h3 class="card-title ten">${o.name}</h3>

                                        <div class="gia d-flex align-items-baseline">
                                            <div class="giamoi">${o.price} $</div>
                                            <div class="giacu text-muted"><del>${o.price+350} $</del></div>
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

        <section class="_1khoi combohot mt-4">
            <div class="container">
                <div class="noidung bg-white" style=" width: 100%;">
                    <div class="row">
                        <!--header -->
                        <div class="col-12 d-flex justify-content-between align-items-center pb-2 bg-light">
                            <h2 class="header text-uppercase" style="font-weight: 400;">Sản phẩm bán chạy</h2>
                        </div>
                    </div>
                    <div class="khoisanpham">
                        <c:forEach var="o" items="${listP2}">
                            <div class="card">
                                <a href="detail?pid=${o.id}" class="motsanpham" style="text-decoration: none; color: black;" data-toggle="tooltip" data-placement="bottom">
                                    <img class="card-img-top anh" src="${o.image}"  style="height: 250px">
                                    <div class="card-body noidungsp mt-3">
                                        <h3 class="card-title ten">${o.name}</h3>

                                        <div class="gia d-flex align-items-baseline">
                                            <div class="giamoi">${o.price} $</div>
                                            <div class="giacu text-muted"><del>${o.price+350} $</del></div>
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

        <section class="_1khoi combohot mt-4">
            <div class="container">
                <div class="noidung bg-white" style=" width: 100%;">
                    <div class="row">
                        <!--header -->
                        <div class="col-12 d-flex justify-content-between align-items-center pb-2 bg-light">
                            <h2 class="header text-uppercase" style="font-weight: 400;">Sản phẩm Giá tốt</h2>
                        </div>
                    </div>
                    <div class="khoisanpham">
                        <c:forEach var="o" items="${listP3}">
                            <div class="card">
                                <a href="detail?pid=${o.id}" class="motsanpham" style="text-decoration: none; color: black;" data-toggle="tooltip" data-placement="bottom">
                                    <img class="card-img-top anh" src="${o.image}"  style="height: 250px">
                                    <div class="card-body noidungsp mt-3">
                                        <h3 class="card-title ten">${o.name}</h3>

                                        <div class="gia d-flex align-items-baseline">
                                            <div class="giamoi">${o.price} $</div>
                                            <div class="giacu text-muted"><del>${o.price+350} $</del></div>
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
        <jsp:include page="nav2.jsp" />       
    </body>
</html>

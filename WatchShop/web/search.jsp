<%-- 
    Document   : category
    Created on : May 8, 2024, 11:53:58 AM
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
        <jsp:include page="nav.jsp" />

        <div class="container">
            <div class="row">
                <div class="col-sm-3" style="margin-top: 24px;">
                    <form action="search" style="margin-top: 20px;"> 
                        <h5>Thương hiệu:</h5>
                        <c:forEach items="${requestScope.listB}" var="b">
                            <c:set var="isChecked" value="false" />
                            <c:if test="${not empty requestScope.bid}">
                                <c:forEach var="selectedBid" items="${requestScope.bid}">
                                    <c:if test="${b.bid == selectedBid}">
                                        <c:set var="isChecked" value="true" />
                                    </c:if>
                                </c:forEach>
                            </c:if>
                            <input ${isChecked ? 'checked' : ''} type="checkbox" value="${b.bid}" name="bid" onchange="this.form.submit()"/> ${b.bname}<br>
                        </c:forEach>

                        <h5>Loại:</h5>
                        <c:forEach items="${requestScope.listC}" var="c">
                            <c:set var="isChecked" value="false" />
                            <c:if test="${requestScope.cid!=null}">
                                <c:forEach var="selectedCid" items="${requestScope.cid}">
                                    <c:if test="${c.cid == selectedCid}">
                                        <c:set var="isChecked" value="true" />
                                    </c:if>
                                </c:forEach>
                            </c:if>
                            <input ${isChecked ? 'checked' : ''} type="checkbox" value="${c.cid}" name="cid" onchange="this.form.submit()"/> ${c.cname}<br>
                        </c:forEach>
                        <hr>
                        <h5>Miêu tả</h5>
                        <input type="text" name="key" value="${key != null ? key : ''}" placeholder="Nhập tên, miêu tả" ><br><hr>
                        <h5>Giá</h5>       
                        Từ: &nbsp;<input type="number" name="fromprice" value="${fromprice != null ? fromprice : ''}"><br>
                        Đến:<input type="number" name="toprice" value="${toprice != null ? toprice : ''}"> <br>
                        <hr>
                        <h5>Ngày</h5>
                        Từ ngày: <input type="date" name="fromdate" value="${fromdate != null ? fromdate : ''}" style="margin-left: 9px"> <br> 
                        Đến ngày: <input type="date" name="todate" value="${todate != null ? todate : ''}"> <br> 
                        <br> 
                        <input type="submit" value="SEARCH">
                    </form>
                </div>

                <div class="col-sm-9">
                    <div class="row" >                        
                        <c:if test="${countP!=0}">   
                            <div class="row col-12 col-md-12 col-lg-12">
                                <h3 style="color: red;padding: 15px">Danh sách sản phẩm</h3>    
                                <form action="search" style="margin-top: 20px; margin-left: 180px;">
                                    <c:forEach var="cidValue" items="${cid}">
                                        <input type="hidden" value="${cidValue}" name="cid">
                                    </c:forEach>
                                    <input type="hidden" value="${key}" name="key">
                                    <input type="hidden" value="${fromdate}" name="todate">
                                    <input type="hidden" value="${fromprice}" name="fromprice">
                                    <input type="hidden" value="${todate}" name="todate">
                                    <input type="hidden" value="${toprice}" name="toprice">
                                    <select name="sort" onchange="this.form.submit()" style="margin-left: 150px">
                                        <option ${sort == 0 ? 'selected' : ''} value="0">--NONE--</option>
                                        <option ${sort == 1 ? 'selected' : ''} value="1">Giá ↑</option>
                                        <option ${sort == 2 ? 'selected' : ''} value="2">Giá ↓</option>
                                        <option ${sort == 3 ? 'selected' : ''} value="3">⭐ ↑</option>
                                        <option ${sort == 4 ? 'selected' : ''} value="4">⭐ ↓</option>
                                        <option ${sort == 5 ? 'selected' : ''} value="5">Lượt bán ↑</option>    
                                        <option ${sort == 6 ? 'selected' : ''} value="6">Lượt bán ↓</option>
                                    </select>                                    
                                </form>
                                <c:if test="${countP >= 10}">
                                    <div class="clearfix row" style="margin: 10px -24px">
                                        <div class="hint-text" style="margin-left: 40px;">Showing <b>10</b> out of <b>${countP}</b> entries</div>
                                        <ul class="pagination" style="margin-left: 360px;">                                          
                                            <c:forEach begin="1" end="${endP}" var="i">                                             
                                                <li style="margin: -15px 5px;${page==i?'text-decoration: underline;':''}">
                                                    <form action="search">
                                                        <c:forEach var="cidValue" items="${cid}">
                                                            <input type="hidden" value="${cidValue}" name="cid">
                                                        </c:forEach>
                                                        <input type="hidden" value="${key}" name="key">
                                                        <input type="hidden" value="${fromdate}" name="todate">
                                                        <input type="hidden" value="${fromprice}" name="fromprice">
                                                        <input type="hidden" value="${todate}" name="todate">
                                                        <input type="hidden" value="${toprice}" name="toprice">
                                                        <input type="hidden" value="${sort}" name="sort">
                                                        <button name="index" value="${i}" type="submit" style="width: 25px;;border: none;background-color:${page==i?'orange':''}">${i}</button>
                                                    </form>
                                                </li>
                                            </c:forEach>                                       
                                        </ul>
                                    </div>
                                </c:if>
                            </div>
                            <div id="content" class="row col-12 col-md-12 col-lg-12">                       
                                <c:forEach items="${listP}" var="o">                                       
                                    <div class="col-12 col-md-4 col-lg-4">
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
                                                        Đã bán: ${o.sold}
                                                        <span style="margin-left:80px">${o.rate}<i class="fa fa-star" style="color: yellow"></i></span>
                                                    </div>
                                                </div>
                                            </a>
                                        </div> 
                                    </div>                          
                                </c:forEach>                               
                            </div>
                        </div>                         
                    </c:if>
                    <c:if test="${countP==0}">
                        <h3 style="color: red; margin: 50px auto;">Không có sản phẩm bạn cần tìm</h3>
                    </c:if>  
                </div>
            </div>
        </div>
        <br> 
        <jsp:include page="nav2.jsp" />  
    </body>
</html>

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
        <style>
            .button {
                background: linear-gradient(#c72f3c,#6771db);
                font-size: 25px;
                border-radius: 12px;
                margin: 0 70px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="nav.jsp" />

        <div class="container">
            <div class="row">
                <div class="col-sm-3" style="margin-top: 24px;border-right: 1px solid black">
                    <form action="search" style="margin-top: 20px;"> 
                        <div>
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
                        </div><br><hr>
                        <div>
                            <h5>Giới tính</h5> 
                            <c:forEach items="${requestScope.listC}" var="c">
                                <c:if test="${c.type==1}">
                                    <c:set var="isChecked" value="false" />
                                    <c:if test="${requestScope.cid!=null}">
                                        <c:forEach var="selectedCid" items="${requestScope.cid}">
                                            <c:if test="${c.cid == selectedCid}">
                                                <c:set var="isChecked" value="true" />
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                    <input ${isChecked ? 'checked' : ''} type="checkbox" value="${c.cid}" name="cid" onchange="this.form.submit()"/> ${c.type==2?'Chống nước: ':''}${c.type==3?'Độ rộng dây đeo: ':''} ${c.cname}<br>
                                </c:if>
                            </c:forEach>
                        </div><br><hr>

                        <div>
                            <h5>Mức độ chống nước</h5> 
                            <c:forEach items="${requestScope.listC}" var="c">
                                <c:if test="${c.type==2}">
                                    <c:set var="isChecked" value="false" />
                                    <c:if test="${requestScope.cid!=null}">
                                        <c:forEach var="selectedCid" items="${requestScope.cid}">
                                            <c:if test="${c.cid == selectedCid}">
                                                <c:set var="isChecked" value="true" />
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                    <input ${isChecked ? 'checked' : ''} type="checkbox" value="${c.cid}" name="cid" onchange="this.form.submit()"/> ${c.cname}<br>
                                </c:if>
                            </c:forEach>
                        </div><br><hr>

                        <div>
                            <h5>Độ rộng dây đeo</h5> 
                            <c:forEach items="${requestScope.listC}" var="c">
                                <c:if test="${c.type==3}">
                                    <c:set var="isChecked" value="false" />
                                    <c:if test="${requestScope.cid!=null}">
                                        <c:forEach var="selectedCid" items="${requestScope.cid}">
                                            <c:if test="${c.cid == selectedCid}">
                                                <c:set var="isChecked" value="true" />
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                    <input ${isChecked ? 'checked' : ''} type="checkbox" value="${c.cid}" name="cid" onchange="this.form.submit()"/> ${c.cname}<br>
                                </c:if>
                            </c:forEach>
                        </div><br><hr>
                        <div>
                            <h5>Miêu tả</h5>
                            <input type="text" name="key" value="${key != null ? key : ''}" placeholder="Nhập tên, mã sản phẩm" ><br>   
                        </div><br><hr>
                        <div>
                            <h5>Giá</h5>       
                            <label>Từ: </label><input style="margin-bottom: 10px;margin-left: 10px" type="number" name="fromprice" value="${fromprice != null ? fromprice : ''}"><br>
                            <label>Đến:</label><input type="number" name="toprice" value="${toprice != null ? toprice : ''}"> <br>
                        </div><br><hr>
                        <div>
                            <h5>Ngày</h5>
                            <label>Từ ngày:</label><input type="date" name="fromdate" value="${fromdate != null ? fromdate : ''}" style="margin-left: 9px;margin-bottom: 10px;"> <br> 
                            <label>Đến ngày:</label><input type="date" name="todate" value="${todate != null ? todate : ''}"> <br><br>
                        </div>
                        <button class="button" type="submit">Search</button>
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
                                <c:if test="${countP >= 9}">
                                    <form action="search">
                                        <input type="hidden" value="${key}" name="key">
                                        <input type="hidden" value="${fromdate}" name="todate">
                                        <input type="hidden" value="${fromprice}" name="fromprice">
                                        <input type="hidden" value="${todate}" name="todate">
                                        <input type="hidden" value="${toprice}" name="toprice">
                                        <input type="hidden" value="${sort}" name="sort">
                                        <c:set var="i" value="${page}"/>
                                        <div class="clearfix row" style="margin: 10px -24px">
                                            <div class="hint-text" style="margin-left: 40px;">Showing <b>9</b> out of <b>${countP}</b> entries</div>
                                            <ul class="pagination" style="margin-left: 300px;">  
                                                <button name="index" value="${i-1}" type="${i>1?'submit':'button'}" style="width: 65px;height: 30px;border: 1px solid #007BFF;background-color: ${i>1?'white':'#9698ab'}">Previous</button>
                                                <c:forEach begin="1" end="${endP}" var="i">                                             
                                                    <li>
                                                        <c:forEach var="cidValue" items="${cid}">
                                                            <input type="hidden" value="${cidValue}" name="cid">
                                                        </c:forEach>
                                                        <button name="index" value="${i}" type="submit" style="width: 30px;height: 30px;margin: 0 2px;border: 1px solid #007BFF;background-color:${page==i?'#007BFF':'white'}">${i}</button>
                                                    </li>
                                                </c:forEach>  
                                                <c:set var="i" value="${page}"/>
                                                <button name="index" value="${i+1}" type="${i<endP?'submit':'button'}" style="width:65px;height: 30px;border: 1px solid #007BFF;background-color: ${i<endP?'white':'#9698ab'}">Next</button>
                                            </ul>
                                        </div>
                                    </form>
                                </c:if>
                            </div>
                            <div id="content" class="row col-12 col-md-12 col-lg-12">                       
                                <c:forEach items="${listP}" var="o">                                       
                                    <div class="col-12 col-md-4 col-lg-4">
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
                                                        <span style="margin-left:70px">${o.rate}<i class="fa fa-star" style="color: yellow"></i></span>
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

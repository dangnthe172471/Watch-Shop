<%-- 
    Document   : ManageProduct
    Created on : Jun 20, 2024, 1:31:30 PM
    Author     : admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Watch Shop</title>
        <!-- Boxicons -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- My CSS -->
        <link rel="stylesheet" href="css/manage.css">

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
        <jsp:include page="left.jsp" />
        <section id="content">
            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>Sản phẩm</h1>                      
                    </div>
                    <a class="btn-download, btn btn-primary addbtn">
                        <span class="text">Thêm sản phẩm</span>
                    </a>
                </div>
                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <h3>Quản Lý</h3>
                            <form action="manageproduct" method="post">
                                <c:forEach var="bidValue" items="${bid}">
                                    <input type="hidden" value="${bidValue}" name="bid">
                                </c:forEach>
                                <c:forEach var="cidValue" items="${cid1}">
                                    <input type="hidden" value="${cidValue}" name="cid1">
                                </c:forEach>
                                <c:forEach var="cidValue" items="${cid2}">
                                    <input type="hidden" value="${cidValue}" name="cid2">
                                </c:forEach>
                                <c:forEach var="cidValue" items="${cid3}">
                                    <input type="hidden" value="${cidValue}" name="cid3">
                                </c:forEach>
                                <input value="${sort}" name="sort" type="hidden">
                                <input value="${key != null ? key : ''}" placeholder="Nhập tên, code sản phẩm"  name="key">
                                <button type="submit" style="border: none;background-color: #F8F9FA"><i class='bx bx-search'></i></button> 
                            </form>
                        </div>
                        <!--                        <div class="nav-bg">
                                                    <nav class="container" style="padding:0px ">
                                                        <ul class="main-menu">
                                                            <li><a style="padding-right: 0px" href="category">Danh sách</a></li>
                                                            <li style="margin-left: 30px;"><a href="BlockC.jsp">Danh sách Tạm Ẩn</a></li>               
                                                        </ul>
                                                    </nav>
                                                </div>-->
                        <c:if test="${empty listP}">
                            <p style="color: red">Không thấy sản phầm cần tìm</p>
                        </c:if>
                        <table id="manageproduct">
                            <thead>
                                <tr>
                                    <th style="width: 30px; text-align: center;">
                                        <form action="manageproduct" method="post">
                                            <input value="${key}" name="key" type="hidden">
                                            <c:forEach var="bidValue" items="${bid}">
                                                <input type="hidden" value="${bidValue}" name="bid">
                                            </c:forEach>
                                            <c:forEach var="cidValue" items="${cid1}">
                                                <input type="hidden" value="${cidValue}" name="cid1">
                                            </c:forEach>
                                            <c:forEach var="cidValue" items="${cid2}">
                                                <input type="hidden" value="${cidValue}" name="cid2">
                                            </c:forEach>
                                            <c:forEach var="cidValue" items="${cid3}">
                                                <input type="hidden" value="${cidValue}" name="cid3">
                                            </c:forEach>
                                            Code <button type="submit" value="1" name="sort" style="background-color: #F8F9FA; border: none;">
                                                <i class="fa fa-long-arrow-up" style="vertical-align: middle;"></i>
                                            </button>
                                            <button type="submit" value="2" name="sort" style="background-color: #F8F9FA; border: none;">
                                                <i class="fa fa-long-arrow-down" style="vertical-align: middle;"></i>
                                            </button>
                                        </form>
                                    </th>

                                    <th style="width: 160px;text-align: center">
                                        <form action="manageproduct" method="post">
                                            <input value="${key}" name="key" type="hidden">
                                            <c:forEach var="bidValue" items="${bid}">
                                                <input type="hidden" value="${bidValue}" name="bid">
                                            </c:forEach>
                                            <c:forEach var="cidValue" items="${cid1}">
                                                <input type="hidden" value="${cidValue}" name="cid1">
                                            </c:forEach>
                                            <c:forEach var="cidValue" items="${cid2}">
                                                <input type="hidden" value="${cidValue}" name="cid2">
                                            </c:forEach>
                                            <c:forEach var="cidValue" items="${cid3}">
                                                <input type="hidden" value="${cidValue}" name="cid3">
                                            </c:forEach>
                                            Sản phẩm <button type="submit" value="3" name="sort" style="background-color: #F8F9FA; border: none;">
                                                <i class="fa fa-long-arrow-up" style="vertical-align: middle;"></i>
                                            </button>
                                            <button type="submit" value="4" name="sort" style="background-color: #F8F9FA; border: none;">
                                                <i class="fa fa-long-arrow-down" style="vertical-align: middle;"></i>
                                            </button>
                                        </form>                                        
                                    </th>
                                    <th style="width: 130px;text-align: center">
                                        <form action="manageproduct" method="post">
                                            <input value="${key}" name="key" type="hidden">
                                            <input value="${sort}" name="sort" type="hidden">
                                            <ul class="main-menu" style="text-align: left"> 
                                                <li>Thương hiệu <i class='bx bx-filter' ></i>
                                                    <ul class="sub-menu" style="background: white">
                                                        <c:forEach items="${requestScope.listB}" var="b">
                                                            <c:set var="isChecked" value="false" />
                                                            <c:if test="${not empty requestScope.bid}">
                                                                <c:forEach var="selectedBid" items="${requestScope.bid}">
                                                                    <c:if test="${b.bid == selectedBid}">
                                                                        <c:set var="isChecked" value="true" />
                                                                    </c:if>
                                                                </c:forEach>
                                                            </c:if>
                                                            <input value="${sort}" name="sort" type="hidden"/>
                                                            <li><input ${isChecked ? 'checked' : ''} type="checkbox" value="${b.bid}" name="bid" onchange="this.form.submit()"/> ${b.bname}<br></li>
                                                            </c:forEach>
                                                    </ul>
                                                </li>   
                                            </ul>
                                        </form>
                                    </th>
                                    <th style="width: 150px;text-align: center">
                                        <form action="manageproduct" method="post">
                                            <input value="${key}" name="key" type="hidden">
                                            <input value="${sort}" name="sort" type="hidden">
                                            <ul class="main-menu" style="text-align: left;"> 
                                                <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Thể loại <i class='bx bx-filter' ></i>
                                                    <ul class="sub-menu" style="background: white">
                                                        <c:forEach items="${requestScope.listC}" var="c">
                                                            <c:if test="${c.type==1}">
                                                                <c:set var="isChecked" value="false" />
                                                                <c:if test="${requestScope.cid1!=null}">
                                                                    <c:forEach var="selectedCid" items="${requestScope.cid1}">
                                                                        <c:if test="${c.cid == selectedCid}">
                                                                            <c:set var="isChecked" value="true" />
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </c:if>
                                                                <input ${isChecked ? 'checked' : ''} type="checkbox" value="${c.cid}" name="cid1" onchange="this.form.submit()"/> ${c.type==2?'Chống nước: ':''}${c.type==3?'Độ rộng dây đeo: ':''} ${c.cname}<br>
                                                            </c:if>
                                                        </c:forEach>
                                                        <c:forEach items="${requestScope.listC}" var="c">
                                                            <c:if test="${c.type==2}">
                                                                <c:set var="isChecked" value="false" />
                                                                <c:if test="${requestScope.cid2!=null}">
                                                                    <c:forEach var="selectedCid" items="${requestScope.cid2}">
                                                                        <c:if test="${c.cid == selectedCid}">
                                                                            <c:set var="isChecked" value="true" />
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </c:if>
                                                                <input ${isChecked ? 'checked' : ''} type="checkbox" value="${c.cid}" name="cid2" onchange="this.form.submit()"/> ${c.type==2?'Chống nước: ':''}${c.type==3?'Độ rộng dây đeo: ':''} ${c.cname}<br>
                                                            </c:if>
                                                        </c:forEach>
                                                        <c:forEach items="${requestScope.listC}" var="c">
                                                            <c:if test="${c.type==3}">
                                                                <c:set var="isChecked" value="false" />
                                                                <c:if test="${requestScope.cid3!=null}">
                                                                    <c:forEach var="selectedCid" items="${requestScope.cid3}">
                                                                        <c:if test="${c.cid == selectedCid}">
                                                                            <c:set var="isChecked" value="true" />
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </c:if>
                                                                <input ${isChecked ? 'checked' : ''} type="checkbox" value="${c.cid}" name="cid3" onchange="this.form.submit()"/> ${c.type==2?'Chống nước: ':''}${c.type==3?'Độ rộng dây đeo: ':''} ${c.cname}<br>
                                                            </c:if>
                                                        </c:forEach>
                                                    </ul>
                                                </li>   
                                            </ul>
                                        </form>
                                    </th>
                                    <th style="width: 125px;text-align: center">
                                        <form action="manageproduct" method="post">
                                            <input value="${key}" name="key" type="hidden">
                                            <c:forEach var="bidValue" items="${bid}">
                                                <input type="hidden" value="${bidValue}" name="bid">
                                            </c:forEach>
                                            <c:forEach var="cidValue" items="${cid1}">
                                                <input type="hidden" value="${cidValue}" name="cid1">
                                            </c:forEach>
                                            <c:forEach var="cidValue" items="${cid2}">
                                                <input type="hidden" value="${cidValue}" name="cid2">
                                            </c:forEach>
                                            <c:forEach var="cidValue" items="${cid3}">
                                                <input type="hidden" value="${cidValue}" name="cid3">
                                            </c:forEach>
                                            Giá <button type="submit" value="5" name="sort" style="background-color: #F8F9FA; border: none;">
                                                <i class="fa fa-long-arrow-up" style="vertical-align: middle;"></i>
                                            </button>
                                            <button type="submit" value="6" name="sort" style="background-color: #F8F9FA; border: none;">
                                                <i class="fa fa-long-arrow-down" style="vertical-align: middle;"></i>
                                            </button>
                                        </form>
                                    <th style="width: 120px;text-align: center">
                                        <form action="manageproduct" method="post">
                                            <input value="${key}" name="key" type="hidden">
                                            <c:forEach var="bidValue" items="${bid}">
                                                <input type="hidden" value="${bidValue}" name="bid">
                                            </c:forEach>
                                            <c:forEach var="cidValue" items="${cid1}">
                                                <input type="hidden" value="${cidValue}" name="cid1">
                                            </c:forEach>
                                            <c:forEach var="cidValue" items="${cid2}">
                                                <input type="hidden" value="${cidValue}" name="cid2">
                                            </c:forEach>
                                            <c:forEach var="cidValue" items="${cid3}">
                                                <input type="hidden" value="${cidValue}" name="cid3">
                                            </c:forEach>
                                            Số lượng còn <button type="submit" value="7" name="sort" style="background-color: #F8F9FA; border: none;">
                                                <i class="fa fa-long-arrow-up" style="vertical-align: middle;"></i>
                                            </button>
                                            <button type="submit" value="8" name="sort" style="background-color: #F8F9FA; border: none;">
                                                <i class="fa fa-long-arrow-down" style="vertical-align: middle;"></i>
                                            </button>
                                        </form>
                                    </th>
                                    <th style="width: 80px;text-align: center">
                                        <form action="manageproduct" method="post">
                                            <input value="${key}" name="key" type="hidden">
                                            <c:forEach var="bidValue" items="${bid}">
                                                <input type="hidden" value="${bidValue}" name="bid">
                                            </c:forEach>
                                            <c:forEach var="cidValue" items="${cid1}">
                                                <input type="hidden" value="${cidValue}" name="cid1">
                                            </c:forEach>
                                            <c:forEach var="cidValue" items="${cid2}">
                                                <input type="hidden" value="${cidValue}" name="cid2">
                                            </c:forEach>
                                            <c:forEach var="cidValue" items="${cid3}">
                                                <input type="hidden" value="${cidValue}" name="cid3">
                                            </c:forEach>
                                            Đã bán <button type="submit" value="9" name="sort" style="background-color: #F8F9FA; border: none;">
                                                <i class="fa fa-long-arrow-up" style="vertical-align: middle;"></i>
                                            </button>
                                            <button type="submit" value="10" name="sort" style="background-color: #F8F9FA; border: none;">
                                                <i class="fa fa-long-arrow-down" style="vertical-align: middle;"></i>
                                            </button>
                                        </form>
                                    <th style="width: 120px;text-align: center">
                                        <form action="manageproduct" method="post">
                                            <input value="${key}" name="key" type="hidden">
                                            <c:forEach var="bidValue" items="${bid}">
                                                <input type="hidden" value="${bidValue}" name="bid">
                                            </c:forEach>
                                            <c:forEach var="cidValue" items="${cid1}">
                                                <input type="hidden" value="${cidValue}" name="cid1">
                                            </c:forEach>
                                            <c:forEach var="cidValue" items="${cid2}">
                                                <input type="hidden" value="${cidValue}" name="cid2">
                                            </c:forEach>
                                            <c:forEach var="cidValue" items="${cid3}">
                                                <input type="hidden" value="${cidValue}" name="cid3">
                                            </c:forEach>
                                            Ngày sản xuất <button type="submit" value="11" name="sort" style="background-color: #F8F9FA; border: none;">
                                                <i class="fa fa-long-arrow-up" style="vertical-align: middle;"></i>
                                            </button>
                                            <button type="submit" value="12" name="sort" style="background-color: #F8F9FA; border: none;">
                                                <i class="fa fa-long-arrow-down" style="vertical-align: middle;"></i>
                                            </button>
                                        </form>
                                    <th style="width: 150px;text-align: center">Mô tả</th>
                                    <th style="width: 70px;text-align: center">Hành động</th>
                                </tr>
                            </thead>
                            <tbody style="height: 500px;">    
                                <c:forEach var="o" items="${listP}">                                   
                                    <tr>
                                        <td style="text-align: left;display: table-cell;vertical-align: middle;">${o.code}</td>
                                        <td><span style="display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;overflow: hidden;font-size: 14px;" title="${o.name}">${o.name}</span>

                                            <div class="khoianh">
                                                <div class="anhto mb-2">
                                                    <img id="main-image" class="product-image" src="${o.pimage.img1}" style="width: 100%;height: 200px;border-radius: 0%">
                                                </div>
                                                <div class="list-anhchitiet d-flex">
                                                    <img class="thumb-img mr-3" src="${o.pimage.img1}" class="img-fluid" style="cursor: pointer;">
                                                    <img class="thumb-img mr-3" src="${o.pimage.img2}" class="img-fluid" style="cursor: pointer;">
                                                    <img class="thumb-img mr-3" src="${o.pimage.img3}" class="img-fluid" style="cursor: pointer;">
                                                    <img class="thumb-img mr-3" src="${o.pimage.img4}" class="img-fluid" style="cursor: pointer;">
                                                </div>
                                            </div>
                                        </td>                                               
                                        <td style="text-align: center">
                                            <c:forEach items="${listB}" var="b">
                                                <c:if test="${b.bid==o.brandID}">${b.bname}<br>${b.deleted==1?'(đã xóa)':''}</c:if>
                                            </c:forEach>
                                        </td>
                                        <td style="text-align: center">
                                            <c:forEach items="${listC}" var="c">
                                                <c:if test="${c.cid==o.cateID1}"><p>${c.cname}<br>${c.deleted==1?'(đã xóa)':''}</p></c:if>
                                                <c:if test="${c.cid==o.cateID2}"><p>Chống nước:<br>${c.cname}<br>${c.deleted==1?'(đã xóa)':''}</p></c:if>
                                                <c:if test="${c.cid==o.cateID3}"><p>Đường kính mặt số:<br>${c.cname}<br>${c.deleted==1?'(đã xóa)':''}</p></c:if>
                                                </c:forEach>
                                        </td>
                                        <td style="text-align: center"><fmt:formatNumber value="${o.price}"/></td>
                                        <td style="text-align: center">${o.quantity}</td>
                                        <td style="text-align: center">${o.sold} (${o.rate}⭐)</td>
                                        <td style="text-align: center"><fmt:formatDate value="${o.releaseDate}" pattern="dd-MM-yyyy"/></td>
                                        <td><p style="display: -webkit-box;-webkit-line-clamp: 8;-webkit-box-orient: vertical;overflow: hidden;" title="${o.description}">${o.description}</p></td>
                                        <td style="text-align: center;font-size: 20px;"><a  class="editbtn"><i class="fa fa-edit" style="color: blue"></i></a>&nbsp;&nbsp;
                                            <a href="#" onclick="doDelete('${c.cid}')"><i class="fa fa-trash" style="color: red"></i></a>
                                        </td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                    </div>             

                </div>
                <c:if test="${countP >= 6}">                                                
                    <form action="manageproduct" method="post">
                        <c:forEach var="bidValue" items="${bid}">
                            <input type="hidden" value="${bidValue}" name="bid">
                        </c:forEach>
                        <c:forEach var="cidValue" items="${cid1}">
                            <input type="hidden" value="${cidValue}" name="cid1">
                        </c:forEach>
                        <c:forEach var="cidValue" items="${cid2}">
                            <input type="hidden" value="${cidValue}" name="cid2">
                        </c:forEach>
                        <c:forEach var="cidValue" items="${cid3}">
                            <input type="hidden" value="${cidValue}" name="cid3">
                        </c:forEach>
                        <input type="hidden" value="${key}" name="key">
                        <input type="hidden" value="${fromdate}" name="todate">
                        <input type="hidden" value="${fromprice}" name="fromprice">
                        <input type="hidden" value="${todate}" name="todate">
                        <input type="hidden" value="${toprice}" name="toprice">
                        <input type="hidden" value="${sort}" name="sort">
                        <c:set var="i" value="${page}"/>
                        <div class="clearfix row" style="margin: 10px -24px">
                            <div class="hint-text" style="margin-left: 40px;">Showing <b>6</b> out of <b>${countP}</b> entries</div>
                            <ul class="pagination" style="margin-left: 200px;">  
                                <button name="index" value="${i-1}" type="${i>1?'submit':'button'}" style="width: 65px;height: 30px;border: 1px solid #007BFF;background-color: ${i>1?'white':'#9698ab'}">Previous</button>
                                <c:forEach begin="1" end="${endP}" var="i">                                             
                                    <li>
                                        <button name="index" value="${i}" type="submit" style="width: 30px;height: 30px;margin: 0 2px;border: 1px solid #007BFF;background-color:${page==i?'#007BFF':'white'}">${i}</button>
                                    </li>
                                </c:forEach>  
                                <c:set var="i" value="${page}"/>
                                <button name="index" value="${i+1}" type="${i<endP?'submit':'button'}" style="width:65px;height: 30px;border: 1px solid #007BFF;background-color: ${i<endP?'white':'#9698ab'}">Next</button>
                            </ul>
                        </div>
                    </form>
                </c:if>
            </main>
        </section>
        <script src="js/script.js"></script>
        <script src="js/mngproduct.js"></script>        
    </body>
</html>

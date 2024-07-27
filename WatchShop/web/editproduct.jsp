<%-- 
    Document   : editproduct
    Created on : Jun 25, 2024, 10:13:48 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <script src="ckeditor/ckeditor.js"></script>
    </head> 
    <body style="font-family: Arial, sans-serif;">
        <jsp:include page="left.jsp" />
        <section id="content">     
            <main>
                <div class="head-title">
                    <a href="manageproduct" class="btn-download">                       
                        <span class="text">Quay lại</span>
                    </a>
                    <div class="left" style="margin-right: 150px;">
                        <h1>Chỉnh sửa sản phẩm</h1>                      
                    </div>
                </div>                
                <div class="container">                  
                    <form action="editproduct" method="post" enctype="multipart/form-data" >       
                        <div class="row">
                            <div class="col-md-12 row">
                                <div class="col-md-5" style="margin-left: 160px;">  
                                    <div id="codeMessage" style="width: 200%"></div>
                                    <label for="code">Mã Sản phẩm</label><br>
                                    <input type="text" style="width: 268px;" value="${p.code}" id="code" name="code" required oninput="validateCode()"><br>

                                    <div id="nameMessage" style="width: 200%"></div>
                                    <label for="name">Tên</label><br>
                                    <input type="text" id="name" style="width: 268px;" value="${p.name}" name="name" required oninput="validateName()"><br>

                                    <label for="date">Ngày sản xuất</label><br>
                                    <input type="date" style="width: 268px;" value="${p.releaseDate}" id="date" name="date" required><br> 
                                </div>

                                <div class="col-md-4">
                                    <label for="price">Giá</label><br>
                                    <fmt:formatNumber value="${p.price}" type="number" groupingUsed="false" maxFractionDigits="0" var="formattedprice" />
                                    <input type="text" style="width: 268px;" id="price" name="price" value="${formattedprice}" min="1" required ><br>                                   

                                    <label for="quantity">Số lượng trong kho</label><br>
                                    <input type="number" min="1" style="width: 268px;" value="${p.quantity}" name="quantity" required><br>

                                    <input type="hidden" min="0" style="width: 268px;" value="${p.sold}" name="sold" required><br>

                                    <input type="hidden" step=0.01 min="0" max="5" oninput="checkNum(this)" style="width: 268px;" value="${p.rate}" name="rate" required><br>
                                </div>
                            </div>

                            <div class="col-md-12 row mt-3 mb-3">
                                <div class="col-md-5" style="margin-left: 160px;">
                                    <label>Giới tính:</label>
                                    <select name="cateID1" style="margin-left: 28px;width: 170px;">
                                        <c:forEach var="c" items="${listC}">
                                            <c:if test="${c.type==1}">
                                                <option ${c.cid==p.cateID1?'selected':''} value="${c.cid}">${c.cname}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select><br>
                                    <label>Chống nước:</label>
                                    <select name="cateID2" style="width: 170px;">
                                        <c:forEach var="c" items="${listC}">
                                            <c:if test="${c.type==2}">
                                                <option ${c.cid==p.cateID2?'selected':''} value="${c.cid}">${c.cname}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select><br>
                                </div>
                                <div class="col-md-4">
                                    <label>Đường kính mặt số:</label>
                                    <select name="cateID3" style="width: 125px;">
                                        <c:forEach var="c" items="${listC}">
                                            <c:if test="${c.type==3}">
                                                <option ${c.cid==p.cateID3?'selected':''} value="${c.cid}">${c.cname}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select><br>

                                    <label>Thương hiệu:</label>
                                    <select name="brandID" style="margin-left: 45px;width: 125px">
                                        <c:forEach var="b" items="${listB}">
                                            <option ${b.bid==p.brandID?'selected':''} value="${b.bid}">${b.bname}</option>
                                        </c:forEach>
                                    </select><br>
                                </div>
                            </div>

                            <div class="row" style="margin-left: 150px; ">
                                <div class="col col-md-2">
                                    <label>Ảnh 1</label><br>    
                                    <img src="${p.pimage.img1}" id="imgpreview1" onclick="document.getElementById('img1').click();" style="width: 150px;height: 150px;"/>
                                    <input type="file" id="img1" onchange="previewImage(event, 1);" style="display:none " name="img1" accept=".jpg, .jpeg, .png" ><br>
                                    <input type="hidden" name="img01" value="${p.pimage.img1}">
                                </div>
                                <div class="col col-md-2" style="margin-left: 60px;">
                                    <label>Ảnh 2</label><br>
                                    <img src="${p.pimage.img2}" id="imgpreview2" onclick="document.getElementById('img2').click();" style="width: 150px;height: 150px;"/>
                                    <input type="file" id="img2" onchange="previewImage(event, 2);" style="display: none" name="img2" accept=".jpg, .jpeg, .png" ><br>
                                    <input type="hidden" name="img02" value="${p.pimage.img2}">
                                </div>
                                <div class="col col-md-2" style="margin-left: 60px;">
                                    <label>Ảnh 3</label><br>
                                    <img src="${p.pimage.img3}" id="imgpreview3" onclick="document.getElementById('img3').click();" style="width: 150px;height: 150px;"/>
                                    <input type="file" id="img3"  onchange="previewImage(event, 3);" style="display: none" name="img3" accept=".jpg, .jpeg, .png" ><br>
                                    <input type="hidden" name="img03" value="${p.pimage.img3}">
                                </div>
                                <div class="col col-md-2" style="margin-left: 60px;">
                                    <label>Ảnh 4</label><br>
                                    <img src="${p.pimage.img4}" id="imgpreview4" onclick="document.getElementById('img4').click();" style="width: 150px;height: 150px;"/>
                                    <input type="file" id="img4" onchange="previewImage(event, 4);" style="display: none" name="img4" accept=".jpg, .jpeg, .png" ><br>
                                    <input type="hidden" name="img04" value="${p.pimage.img4}">
                                </div>
                            </div>
                        </div>
                        <input type="hidden" value="${p.id}" name="id"><br>
                        <input type="hidden" value="edit" name="type"><br>
                        <label>Mô tả</label><br>
                        <textarea name="description">${p.description}</textarea><br>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Cập nhật</button>
                        </div>
                    </form>
                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- CONTENT -->
        <script>
            function checkNum(input) {
                var maxValue = parseInt(input.getAttribute("max"));
                if (input.value > maxValue) {
                    input.value = maxValue;
                }
            }
        </script>
        <script>
            const today = new Date();
            const day = today.toISOString().split('T')[0]; // Format date to YYYY-MM-DD
            document.getElementById('date').setAttribute('max', day);
        </script> 
        <script src="js/script.js"></script>
        <script src="js/editproduct.js"></script>

        <script>CKEDITOR.replace('description');</script>
    </body>
</html>

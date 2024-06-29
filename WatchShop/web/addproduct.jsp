<%-- 
    Document   : addproduct
    Created on : Jun 26, 2024, 6:23:56 PM
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
        <style>
            input[type="file"]::file-selector-button {
                border: 0px solid #6c5ce7;
                background-color: white;
            }
        </style>
        <script>
            function validateImages() {
                var images = document.getElementsByClassName("productImage");
                for (var i = 0; i < images.length; i++) {
                    if (images[i].src.includes("img/noimg.jpg")) {
                        alert("Vui lòng thêm ảnh " + (i + 1) + " của sản phẩm.");
                        return false;
                    }
                }
                return true;
            }
        </script>
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
                        <h1>Thêm sản phẩm</h1>                      
                    </div>
                </div>
                <div style="color: red; margin-left: 50px;font-size: 20px;font-weight: bold">${mess}</div>
                <div class="container">                  
                    <form action="editproduct" method="post" enctype="multipart/form-data" onsubmit="return validateImages()">       
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-12 row">
                                    <div class="col-md-6">  
                                        <div id="codeMessage" style="width: 200%"></div>
                                        <label for="code">Mã Sản phẩm</label><br>
                                        <input value="${code==null?'':code}" type="text" style="width: 268px;" id="code" name="code" required oninput="validateCode()"><br>

                                        <div id="nameMessage" style="width: 200%"></div>
                                        <label for="name">Tên</label><br>
                                        <input value="${name==null?'':name}" type="text" id="name" style="width: 268px;" name="name" required oninput="validateName()"><br>

                                        <label for="date">Ngày sản xuất</label><br>
                                        <input  value="${date!=null?date:''}" type="date" style="width: 268px;" id="date" name="date" required><br> 
                                    </div>

                                    <div class="col-md-6">
                                        <label for="price">Giá</label><br>
                                        <fmt:formatNumber value="${p.price}" type="number" groupingUsed="false" maxFractionDigits="0" var="formattedprice" />
                                        <input value="${price!=null?price:'1'}" type="text" style="width: 268px;" id="price" name="price"  min="1" required ><br>                                   

                                        <label for="quantity">Số lượng trong kho</label><br>
                                        <input value="${quantity!=null?quantity:'1'}" type="number" min="1" style="width: 268px;"  name="quantity" required><br>

                                        <label for="sold">Đã bán</label><br>
                                        <input value="${sold!=null?sold:'0'}" type="number" min="0" style="width: 268px;" name="sold" required><br>

                                        <label for="rate">Đánh giá</label><br>
                                        <input value="${rate!=null?rate:'0'}" type="number" step=0.01 min="0" max="5" oninput="checkNum(this)" style="width: 268px;" name="rate" required><br>
                                    </div>
                                </div>

                                <div class="col-md-12 row mt-3 mb-3">
                                    <div class="col-md-6">
                                        <label>Giới tính:</label>
                                        <select name="cateID1" style="margin-left: 28px;width: 170px;">
                                            <c:forEach var="c" items="${listC}">
                                                <c:if test="${c.type==1}">
                                                    <option ${cateID1!=null?(cateID1==c.cid?'selected':''):''} value="${c.cid}">${c.cname}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select><br>
                                        <label>Chống nước:</label>
                                        <select name="cateID2" style="width: 170px;">
                                            <c:forEach var="c" items="${listC}">
                                                <c:if test="${c.type==2}">
                                                    <option ${cateID2!=null?(cateID2==c.cid?'selected':''):''} value="${c.cid}">${c.cname}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select><br>
                                    </div>
                                    <div class="col-md-6">
                                        <label>Đường kính mặt số:</label>
                                        <select name="cateID3" style="width: 125px;">
                                            <c:forEach var="c" items="${listC}">
                                                <c:if test="${c.type==3}">
                                                    <option ${cateID3!=null?(cateID3==c.cid?'selected':''):''} value="${c.cid}">${c.cname}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select><br>

                                        <label>Thương hiệu:</label>
                                        <select name="brandID" style="margin-left: 45px;width: 125px">
                                            <c:forEach var="b" items="${listB}">
                                                <option ${brandID!=null?(brandID==b.bid?'selected':''):''} value="${b.bid}">${b.bname}</option>
                                            </c:forEach>
                                        </select><br>
                                    </div>
                                </div>

                                <div class="col-md-12 row ml-3" style="height: 180px">
                                    <div class="col col-md-2">
                                        <label>Ảnh 1</label>  
                                        <img class="productImage" src="${img01!=null?img01:'img/noimg.jpg'}" id="imgpreview1" onclick="document.getElementById('img1').click();" style="width: 150px;height: 150px;"/>
                                        <input  style="width: 0.1em;" type="file" id="img1" onchange="previewImage(event, 1);" name="img1" accept=".jpg, .jpeg, .png">
                                        <input name="img01" type="hidden" value="${img01!=null?img01:''}" />
                                    </div>
                                    <div class="col col-md-2" style="margin-left: 60px;">
                                        <label>Ảnh 2</label><br>  
                                        <img class="productImage" src="${img02!=null?img02:'img/noimg.jpg'}" id="imgpreview2" onclick="document.getElementById('img2').click();" style="width: 150px;height: 150px;"/>
                                        <input  type="file" id="img2" onchange="previewImage(event, 2);"  style="width: 0.1em;" name="img2" accept=".jpg, .jpeg, .png" >
                                        <input name="img02" type="hidden" value="${img02!=null?img02:''}" />
                                    </div>
                                    <div class="col col-md-2" style="margin-left: 60px;">
                                        <label>Ảnh 3</label><br>  
                                        <img class="productImage"  src="${img03!=null?img03:'img/noimg.jpg'}" id="imgpreview3" onclick="document.getElementById('img3').click();" style="width: 150px;height: 150px;"/>
                                        <input  type="file" id="img3"  onchange="previewImage(event, 3);"  style="width: 0.1em;" name="img3" accept=".jpg, .jpeg, .png" >
                                        <input name="img03" type="hidden" value="${img03!=null?img03:''}" />
                                    </div>
                                    <div class="col col-md-2" style="margin-left: 60px;">
                                        <label>Ảnh 4</label><br>  
                                        <img class="productImage" src="${img04!=null?img04:'img/noimg.jpg'}" id="imgpreview4" onclick="document.getElementById('img4').click();" style="width: 150px;height: 150px;"/>
                                        <input type="file" id="img4" onchange="previewImage(event, 4);"  style="width: 0.1em;" name="img4" accept=".jpg, .jpeg, .png" >
                                        <input name="img04" type="hidden" value="${img04!=null?img04:''}" />
                                    </div>
                                </div>
                            </div>
                            <br>
                            <label>Mô tả</label><br>
                            <textarea name="description">${description!=null?description:''}</textarea><br>
                            <input type="hidden" value="add" name="type"><br>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Thêm</button>
                        </div>
                    </form>
                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- CONTENT -->
        <script>
            const today = new Date();
            const day = today.toISOString().split('T')[0]; // Format date to YYYY-MM-DD
            document.getElementById('date').setAttribute('max', day);
        </script> 

        <script>
            function checkNum(input) {
                var maxValue = parseInt(input.getAttribute("max"));
                if (input.value > maxValue) {
                    input.value = maxValue;
                }
            }
        </script>
        <script src="js/script.js"></script>
        <script src="js/editproduct.js"></script>

        <script>CKEDITOR.replace('description');</script>
    </body>
</html>

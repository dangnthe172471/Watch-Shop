<%-- 
    Document   : ProfileUser
    Created on : Jun 11, 2024, 2:59:55 AM
    Author     : dung2
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/style.css">
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- My CSS -->
        <link rel="stylesheet" href="css/manage.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/home.css">        
        <link rel="stylesheet" href="css/nav.css">
        <link rel="stylesheet" href="css/profile.css">
        <script type="text/javascript" src="js/main.js"></script>
        <link rel="stylesheet" type="text/css" href="slick/slick.css" />
        <link rel="stylesheet" type="text/css" href="slick/slick-theme.css" />
        <script type="text/javascript" src="slick/slick.min.js"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script>
            function previewImage(event) {
                var reader = new FileReader();
                reader.onload = function () {
                    var output = document.getElementById('profileImagePreview');
                    output.src = reader.result;
                }
                reader.readAsDataURL(event.target.files[0]);
            }
        </script>
    </head>
    <body>
        <div>
            <jsp:include page="leftprofile.jsp" />
            <section id="content">     
                <main>
                    <div class="head-title">
                        <div class="left">
                            <h2>Hồ Sơ Của Tôi</h2>
                            <h5>Quản lý thông tin hồ sơ để bảo mật tài khoản</h5>
                        </div>
                    </div><br>

                    <div class="form-row">
                        <div class="form-group col-sm-7">
                            <label class="profile-label">Tên đăng nhập:</label>
                            <div class="profile-value">${account.user}</div>

                            <div class="form-group">
                                <label class="profile-label">Email:</label>
                                <div class="profile-value">${account.email}</div> 
                            </div>
                            <div class="form-group">
                                <label class="profile-label">Số điện thoại:</label>
                                <input type="tel" class="form-control" id="phone" name="phone" value="${account.phone}">
                            </div>

                            <div class="form-group">
                                <div class="profile-label">Địa chỉ nhận hàng:</div>
                                <input type="text" class="form-control" id="address" name="address" value="${account.address}" >
                            </div>

                            <div class="form-group">
                                <div class="profile-label">Ví:</div>
                                <div class="profile-value">${account.amount}</div>
                            </div>
                        </div>

                        <div style="width: 0.5px; height: 300px; background-color: #ccc;"></div>
                        
                        <div class="form-group col-sm-4">
                            <form action="updateavatar" method="post" enctype="multipart/form-data">

                                <div class="profile-picture-container">
                                    <div class="profile-picture">
                                        <div class="profile-value">
                                            <img id="profileImagePreview" src="${account.avatar}" alt="Avatar" onclick="document.getElementById('profilePicture').click();" style="max-width: 200px; max-height: 200px; border-radius: 50%; border: 5px solid #ccc;">
                                        </div>
                                        <input type="file" class="form-control-file" id="profilePicture" name="profilePicture" accept=".jpg, .jpeg, .png" style="display: none;" onchange="previewImage(event);">
                                    </div>
                                    <div class="file-info"> <label for="profilePicture" class="choose-file">Chọn Ảnh</label></div>

                                </div>
                                <div class="col-sm-12 text-center">
                                    <button type="submit" class="btn btn-primary">Lưu</button>
                                </div>
                                <div class="file-info">Dung lượng file tối đa 1 MB, Định dạng: .JPEG, .PNG</div> 
                                <div class="file-info">
                                     <h5 style="color: red" ">${requestScope.error}</h5>
                                </div>
                               

                            </form>
                        </div>


                    </div>



                </main>
                <!-- MAIN -->
            </section>
        </div>



        <footer>
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
            <jsp:include page="nav2.jsp" /> 
        </footer>

        <!-- CONTENT -->
        <script src="js/script.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>

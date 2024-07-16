<%-- 
    Document   : ProfileUser
    Created on : Jun 11, 2024, 2:59:55 AM
    Author     : dung2
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
        <script>
            $(document).ready(function () {
                $("#changeAddressButton").on("click", function () {
                    $("#addressInputContainer").toggle();
                    if ($("#addressInputContainer").is(":visible")) {
                        $(this).text("Lưu thay đổi");
                    } else {
                        $(this).text("Thay đổi");
                    }
                });
            });
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
                    <!-- Success or Error Messages -->
                    <c:if test="${not empty param.update}">
                        <c:choose>
                            <c:when test="${param.update eq 'success'}">
                                <div class="alert alert-success">Địa chỉ đã được cập nhật thành công.</div>
                            </c:when>
                            <c:when test="${param.update eq 'errorr'}">
                                <div class="alert alert-danger">Có lỗi xảy ra khi cập nhật địa chỉ. Vui lòng thử lại.</div>
                            </c:when>
                            <c:when test="${param.update eq 'invalid'}">
                                <div class="alert alert-warning">Địa chỉ không hợp lệ. Vui lòng nhập lại.</div>
                            </c:when>
                        </c:choose>
                    </c:if>

                    <div class="form-row">
                        <div class="form-group col-sm-7">
                            <label class="profile-label">Tên đăng nhập:</label>
                            <div class="profile-value">${account.user}</div>

                            <div class="form-group">
                                <label class="profile-label">Email:</label>
                                <div class="profile-value">${account.email}
                                    <a href="sendOTP" class="btn btn-info">Thay đổi</a>
                                </div> 

                            </div>
                            <div class="form-group">
                                <label class="profile-label">Số điện thoại: </label>
                                <div class="profile-value">${account.phone}</div> 
                            </div>

                            <div class="form-group">
                                <label class="profile-label">Địa chỉ nhận hàng (mặc định):</label>
                                <div class="profile-value">${account.address}</div>
                                <form action="updateaddress" method="post">
                                    <c:choose>
                                        <c:when test="${empty account.address}">
                                            <div class="form-group" id="addressInputContainer">
                                                <input type="text" class="form-control w-50" name="newAddress" placeholder="Nhập địa chỉ mới" required>
                                                <button type="submit" class="btn btn-info mt-2">Thêm</button>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="form-group" id="addressInputContainer" style="display:none;">
                                                <input type="text" class="form-control w-50" name="newAddress" placeholder="Nhập địa chỉ mới" required>
                                                <button type="submit" class="btn btn-info mt-2">Lưu</button>
                                            </div>
                                            <button type="button" class="btn btn-info mt-2" id="changeAddressButton">Thay đổi</button>
                                        </c:otherwise>
                                    </c:choose>
                                </form>
                            </div>

                            <div class="form-group">
                                <div class="profile-label">Số hàng đã mua:</div>
                                <div class="profile-value">${account.bought} sản phẩm</div> 
                            </div>
                            <div class="form-group">
                                <div class="profile-label">Ví:</div>
                                <div class="profile-value row ml-0"><fmt:formatNumber value="${account.amount}"/> vnđ
                                    <form action="checkout" class="ml-3">
                                        <input name="pttt" value="add" type="hidden"/>
                                        <button type="submit" class="btn btn-primary" style="font-size: 10px;"><i class="fa fa-plus"></i></button>
                                    </form>
                                </div> 

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
                                <div class="form-group">
                                    <label for="avatarUrl">Hoặc dán đường dẫn ảnh (URL):</label>
                                    <input type="text" class="form-control" id="avatarUrl" name="avatarUrl" placeholder="Nhập đường dẫn ảnh">
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





        <!-- CONTENT -->
        <script src="js/script.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>

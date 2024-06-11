<%-- 
    Document   : Edit Feedback
    Created on : Jun 11, 2024, 10:39:57 PM
    Author     : admin
--%>

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
        <link rel="stylesheet" href="css/detail.css">
        <link rel="stylesheet" href="css/home.css">
        <link rel="stylesheet" href="css/nav.css">
        <link rel="stylesheet" type="text/css" href="slick/slick.css" />
        <link rel="stylesheet" type="text/css" href="slick/slick-theme.css" />
        <script type="text/javascript" src="slick/slick.min.js"></script>
        <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>
        <script type="text/javascript" src="js/main.js"></script>      
        <script src="https://www.google.com/recaptcha/api.js" async defer></script> 

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <div id="editmodal" style="position: fixed; top: 20px;left: 365px;">
            <div class="modal-dialog">
                <div class="modal-content" style="width: 850px;">
                    <form action="feedback" method="post">
                        <input value="${feeback.product.id}" name="pid" type="hidden"/>
                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Chỉnh sửa đánh giá sản phẩm</h4>
                            <button type="submit" class="close" name="type" value="back">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">
                            <input type="hidden" name="id" id="update_id" value="${feeback.id}"><br>
                            Nội Dung:<br>                            
                            <textarea name="content" id="update_Content" style="width: 100%;">${feeback.content}</textarea>
                            <br>
                            Đánh giá:<br>
                            <select name="voted">
                                <option value="5" ${feeback.voted==5?'selected':''} style="text-align: center">⭐⭐⭐⭐⭐</option>
                                <option value="4" ${feeback.voted==4?'selected':''} style="text-align: center">⭐⭐⭐⭐</option> 
                                <option value="3" ${feeback.voted==3?'selected':''} style="text-align: center">⭐⭐⭐</option>
                                <option value="2" ${feeback.voted==2?'selected':''} style="text-align: center">⭐⭐</option>
                                <option value="1" ${feeback.voted==1?'selected':''} style="text-align: center">⭐</option>                                                                     
                            </select>
                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-danger" name="type" value="back">Đóng</button>
                            <button type="submit" class="btn btn-success" name="type" value="update">Chỉnh sửa</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
                            
        <script src="//cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
        <!--<script src="//cdn.ckeditor.com/4.22.1/basic/ckeditor.js"></script>-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>    
        <!--ckeditor-->
        <script>CKEDITOR.replace('update_Content');</script>
    </body>
</html>

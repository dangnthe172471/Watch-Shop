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
        <jsp:include page="nav.jsp"/><br>
        <div class="container">
            <img src="img/banner3.png" alt="alt" style="width: 100%"/><br><br>
            <h1 style="margin-left: 380px;color: orange">
                Thành lập năm 2024
            </h1>
            <h1 style="margin-left: 333px;color: orange">
                Cam kết 100% chính hãng
            </h1><br>
            <div style="margin: 0 200px">
                <span>Trải qua nhiều năm thành lập, với những nỗ lực không ngừng, Watch Shop đã gặt hái nhiều thành công trong hoạt động kinh doanh và chiếm lĩnh trên thị trường. Watch Shop đã đăng ký hoạt động thương mại điện tử với Bộ Công Thương. Chúng tôi cam kết 100% sản phẩm chính hãng.</span>
            </div>
            <h1 style="margin-left:455px;color: orange">
                Watch Shop
            </h1>
            <img src="img/gt.png" style="width: 100%">
        </div>        
        <jsp:include page="nav2.jsp"/>
        <!--<script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>-->
    <df-messenger
        intent="WELCOME"
        chat-title="WatchShop"
        agent-id="07d6d881-7f37-481b-b15f-58830e1c2667"
        language-code="vi"
        ></df-messenger>
</body>
</html>

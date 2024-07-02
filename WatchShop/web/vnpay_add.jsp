<%-- 
    Document   : addMoney
    Created on : Jul 2, 2024, 10:03:47 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Tạo mới đơn hàng</title>
        <!-- Bootstrap core CSS -->
        <link href="assets/bootstrap.min.css" rel="stylesheet"/>
        <!-- Custom styles for this template -->
        <link href="assets/jumbotron-narrow.css" rel="stylesheet">      
        <script src="assets/jquery-1.11.3.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>

    <body style="background-color: #F5F7F9">
        <div class="container">
            <a href="ProfileUser.jsp">                
                <span style="color: black;font-size: 20px"> <i class="fa fa-chevron-circle-left"></i>&nbsp;Quay lại</span>
            </a>
        </div>
        <div class="container" style="transform: translateY(-10px); box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2); background-color: white; margin-top: 50px;">
            <div class="header clearfix">
                <h3 class="text-muted"><img src="img/vnlogo.jpg" style="width: 200px;"/>VNPAY</h3>
            </div>
            <h3>Tạo yêu cầu thanh toán</h3><br>
            <div class="table-responsive">
                <form action="vnpay" id="frmCreateOrder" method="post">        
                    <div class="form-group">
                        <label for="amount" style="font-size: 20px">Nhập số tiền cần nạp </label>
                        <div id="error" style="color: red; font-size: 16px;display: none">Số tiền nhỏ hơn 1.000.000.000 vnđ và lớn hơn 1.000.000 vnđ</div>
                        <input class="form-control" value="1000000" id="amountF" type="text">
                        <input  type="hidden" class="form-control" data-val="true" data-val-number="The field Amount must be a number." data-val-required="The Amount field is required." id="amount" name="amount" />
                    </div>
                    <h4>Chọn phương thức thanh toán</h4>
                    <div class="form-group">
                        <h5>Cách 1: Chuyển hướng sang Cổng VNPAY chọn phương thức thanh toán</h5>
                        <input type="radio" Checked="True" id="bankCode" name="bankCode" value="">
                        <label for="bankCode">Cổng thanh toán VNPAYQR</label><br>

                        <h5>Cách 2: Tách phương thức tại site của đơn vị kết nối</h5>
                        <input type="radio" id="bankCode" name="bankCode" value="VNPAYQR">
                        <label for="bankCode">Thanh toán bằng ứng dụng hỗ trợ VNPAYQR</label><br>

                        <input type="radio" id="bankCode" name="bankCode" value="VNBANK">
                        <label for="bankCode">Thanh toán qua thẻ ATM/Tài khoản nội địa</label><br>

                        <input type="radio" id="bankCode" name="bankCode" value="INTCARD">
                        <label for="bankCode">Thanh toán qua thẻ quốc tế</label><br>

                    </div>
                    <div class="form-group">
                        <h5>Chọn ngôn ngữ giao diện thanh toán:</h5>
                        <input type="radio" id="language" Checked="True" name="language" value="vn">
                        <label for="language">Tiếng việt</label><br>
                        <input type="radio" id="language" name="language" value="en">
                        <label for="language">Tiếng anh</label><br>

                    </div>
                    <button type="submit" class="btn btn-default" href>Thanh toán</button>
                </form>
            </div>
            <p>
                &nbsp;
            </p>
        </div>

        <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
        <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const amountF = document.getElementById("amountF");
                const amount = document.getElementById("amount");
                function formatCurrencyInput(inputElement) {
                    function formatValue(value) {
                        value = value.replace(/[^0-9]/g, "");
                        if (value > 1000000000 || value < 1000000) {
                            document.getElementById("error").style.display = "";
                        } else {
                            document.getElementById("error").style.display = "none";
                        }
                        amount.value = value;
                        return value === "" ? "" : parseInt(value).toLocaleString("vi-VN");
                    }

                    inputElement.addEventListener("input", function (e) {
                        e.target.value = formatValue(e.target.value);
                    });
                    // Initial formatting on page load
                    inputElement.value = formatValue(inputElement.value);
                }

                formatCurrencyInput(amountF);
            });
        </script>
        <script type="text/javascript">
            $("#frmCreateOrder").submit(function () {
                var postData = $("#frmCreateOrder").serialize();
                var submitUrl = $("#frmCreateOrder").attr("action");
                $.ajax({
                    type: "POST",
                    url: submitUrl,
                    data: postData,
                    dataType: 'JSON',
                    success: function (x) {
                        if (x.code === '00') {
                            if (window.vnpay) {
                                vnpay.open({width: 768, height: 600, url: x.data});
                            } else {
                                location.href = x.data;
                            }
                            return false;
                        } else {
                            alert(x.Message);
                        }
                    }
                });
                return false;
            });
        </script>       
    </body>
</html>

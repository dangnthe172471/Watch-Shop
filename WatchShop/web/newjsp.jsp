<%-- 
    Document   : newjsp
    Created on : Jun 11, 2024, 1:50:08 PM
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
        <img src="img/audemars1-1.jpg" style="width: 50px;height: 50px;border-radius: 50%"/>
        <h6 class="khung" style="margin-left: 10px;font-size:20px;padding-top: 10px;color: red;width: 950px">aaaaaaaaaa
            <span style="font-size:18px;color: black">5</span><br>
            <table>                                                 
                <tbody>
                    <tr>
                        <td >1 asd asd asd as asd</td>
                        <td >1 asd as sa sa as as das </td>
                        <td >1 a dsa as das das asd a</td> 
                        <td>
                            <ul class="main-menu">
                                <li style="margin-left: 150px;margin-top: -25px;"> <i class="icon fa fa-bars" style="color: black"></i>
                                    <ul class="sub-menu" style="background: cornsilk">
                                        <li><a href="#" onclick="deleteFeedback(event, '${o.id}', '${o.product.id}')"  style="color: black"><i class="fa fa-trash-o" style="color: red"></i> Delete</a></li>
                                        <li onclick="editFeedback(event)"><a href="#" class="editbtn" style="color: black"><i class="fa fa-pencil" style="color: springgreen"></i> Edit</a></li>
                                    </ul>
                                </li>   
                            </ul>
                        </td>
                    </tr>
                </tbody>
            </table>
            <span style="font-size:18px;color: black;" >333</span>

            <img src="img/audemars1-1.jpg" style="width: 50px;height: 50px;border-radius: 50%"/>
            <h6 class="khung" style="margin-left: 10px;font-size:20px;padding-top: 10px;color: red;width: 950px">aaaaaaaaaa
                <span style="font-size:18px;color: black">5</span><br>
                <table>                                                 
                    <tbody>
                        <tr>
                            <td >1 asd asd asd as asd</td>
                            <td >1 asd as sa sa as as das </td>
                            <td >1 a dsa as das das asd a</td> 
                            <td>
                                <ul class="main-menu">
                                    <li style="margin-left: 150px;margin-top: -25px;"> <i class="icon fa fa-bars" style="color: black"></i>
                                        <ul class="sub-menu" style="background: cornsilk">
                                            <li onclick="editFeedback(event)"><a href="#" class="editbtn" style="color: black"><i class="fa fa-pencil" style="color: springgreen"></i> Edit</a></li>
                                        </ul>
                                    </li>   
                                </ul>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <span style="font-size:18px;color: black;" >333</span>

                <img src="img/audemars1-1.jpg" style="width: 50px;height: 50px;border-radius: 50%"/>
                <h6 class="khung" style="margin-left: 10px;font-size:20px;padding-top: 10px;color: red;width: 950px">aaaaaaaaaa
                    <span style="font-size:18px;color: black">5</span><br>
                    <table>                                                 
                        <tbody>
                            <tr>
                                <td >1 asd asd asd as asd</td>
                                <td >1 asd as sa sa as as das </td>
                                <td >1 a dsa as das das asd a</td> 
                                <td>
                                    <ul class="main-menu">
                                        <li style="margin-left: 150px;margin-top: -25px;"> <i class="icon fa fa-bars" style="color: black"></i>
                                            <ul class="sub-menu" style="background: cornsilk">
                                                <li onclick="editFeedback(event)"><a href="#" class="editbtn" style="color: black"><i class="fa fa-pencil" style="color: springgreen"></i> Edit</a></li>
                                            </ul>
                                        </li>   
                                    </ul>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <span style="font-size:18px;color: black;" >333</span>

                    <!-- The Modal -->
                    <div class="modal fade" id="editmodal">
                        <div class="modal-dialog">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title">Modal Heading</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">
                                    <input type="text" name="bname" id="update_id"> 
                                    <input type="text" name="bname" id="update_voted"> 
                                    <input type="text" name="bname" id="update_content"> 
                                </div>

                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                </div>

                            </div>
                        </div>
                    </div>

                    </div>

                    <script>
                        function editFeedback(event) {
                            event.preventDefault();

                            $('.editbtn').on('click', function () {
                                $('#editmodal').modal('show');
                                $tr = $(this).closest('tr');
                                var data = $tr.children("td").map(function () {
                                    return $(this).text();
                                }).get();
                                console.log(data);
                                $('#update_id').val(data[0].trim());
                                $('#update_voted').val(data[1].trim());
                                $('#update_content').val(data[2].trim());
                            });
                        }
                    </script>
                    </body>
                    </html>

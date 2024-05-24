<%-- 
    Document   : Register
    Created on : May 23, 2024, 3:42:56 PM
    Author     : dung2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <title>Cadastro</title>
        <!-- Custom styles-path -->
        <link rel="stylesheet" href="css/login.css">

        <!-- Font Awesome kit script -->
        <script src="https://kit.fontawesome.com/a81368914c.js"></script>

        <!-- Google Fonts Open Sans-->
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">

       
    </head>

    <body style="background-image: url('img/watchlogin1.jpg')">

        <div class="container">
            <div class="img">

            </div>
            <div class="login-container">
                <form action="register" method="post">
                    <h2>REGISTER</h2>
                    <p>With to:</p>
                    <div class="social">
                        <div class="social-icons facebook">
                            <a href="#"><img src="img/facebook.png">Register with Facebook</a>
                        </div>
                        <div class="social-icons google">
                            <a href="#"><img src="img/google.png">Register with Google</a>
                        </div>
                    </div>
                    <div class="input-div one">
                        <div class="i">
                            <i class="fas fa-user"></i>
                        </div>
                        <div>
                            <h5>Username</h5>
                            <input class="input" type="text" name="username" required>
                        </div>
                    </div>
                    <div class="input-div two">
                        <div class="i">
                            <i class="fas fa-envelope"></i>
                        </div>
                        <div>
                            <h5>E-mail</h5>
                            <input class="input" type="email" name="email">
                        </div>
                    </div>
                    <div class="input-div one">
                        <div class="i">
                            <i class="fas fa-key"></i>
                        </div>
                        <div>
                            <h5>Phone Number</h5>
                            <input class="input" type="text" name="phone">
                        </div>
                    </div>
                    <div class="input-div one">
                        <div class="i">
                            <i class="fas fa-key"></i>
                        </div>
                        <div>
                            <h5>Password</h5>
                            <input class="input" type="password" name="password" required>
                        </div>
                    </div>
                    
                    <div class="input-div two">
                        <div class="i">
                            <i class="fas fa-key"></i>
                        </div>
                        <div>
                            <h5>Confirm Password</h5>
                            <input class="input" type="password" name="repassword" required>
                        </div>
                    </div>
                    <div class="input-div one">
                        <div class="i">
                            <i class="fas fa-key"></i>
                        </div>
                        <div>
                            <h5>Location</h5>
                            <input class="input" type="text" name="address">
                        </div>
                    </div><br>
                    <h3 style="color: red" ">${requestScope.error}</h3>
                    <div class="terms">
                        <input type="checkbox">
                        <label>I have read and agree with
                        </label><a id="action-modal">terms of use.</a>
                    </div>
                    <div class="btn-container">
                        <input type="submit" class="btn"  value="register">
                    </div>
                    <div class="account">
                        <p>Are you ready an account?</p>
                        <a href="login">Login.</a>
                    </div>
                    <!-- The Modal -->
                    <div id="modal-terms" class="modal">
                        <!-- Modal content -->
                        <div class="modal-content">
                            <span class="close">&times;</span>
                            <h2>Termos e serviços</h2>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                                labore et dolore magna aliqua. Iaculis at erat pellentesque adipiscing commodo. Adipiscing
                                at in tellus integer feugiat scelerisque. Duis at consectetur lorem donec massa. Lacus vel
                                facilisis volutpat est velit. Faucibus turpis in eu mi bibendum. Natoque penatibus et magnis
                                dis parturient. Potenti nullam ac tortor vitae purus. Odio euismod lacinia at quis risus sed
                                vulputate odio. Pulvinar mattis nunc sed blandit libero volutpat sed. Dolor sit amet
                                consectetur adipiscing elit ut aliquam purus. Nulla facilisi etiam dignissim diam quis.
                                Massa ultricies mi quis hendrerit dolor magna eget. Tincidunt praesent semper feugiat nibh
                                sed pulvinar proin gravida. At auctor urna nunc id cursus metus aliquam eleifend. Amet nisl
                                purus in mollis nunc. Ultricies mi quis hendrerit dolor magna eget est lorem. Mi proin sed
                                libero enim. Viverra accumsan in nisl nisi. Cras ornare arcu dui vivamus arcu felis bibendum
                                ut tristique.</p>
                            <p>Mus mauris vitae ultricies leo integer. Gravida dictum fusce ut placerat orci nulla
                                pellentesque dignissim enim. Tempus egestas sed sed risus pretium quam vulputate. Nec
                                tincidunt praesent semper feugiat nibh sed. Dui accumsan sit amet nulla facilisi. Enim
                                praesent elementum facilisis leo vel fringilla est ullamcorper eget. Dolor sit amet
                                consectetur adipiscing elit pellentesque. Elit duis tristique sollicitudin nibh sit.
                                Scelerisque purus semper eget duis at tellus at urna. Consequat interdum varius sit amet
                                mattis. Nibh cras pulvinar mattis nunc sed blandit libero volutpat. Ac orci phasellus
                                egestas tellus. Fames ac turpis egestas sed tempus urna et. Non enim praesent elementum
                                facilisis leo vel fringilla est. Habitant morbi tristique senectus et. Hendrerit dolor magna
                                eget est lorem ipsum dolor sit. Nulla porttitor massa id neque aliquam vestibulum morbi
                                blandit cursus.</p>
                            <p>Sed odio morbi quis commodo. Purus semper eget duis at tellus at. Et netus et malesuada fames
                                ac. Dictum sit amet justo donec enim diam vulputate ut pharetra. Pellentesque pulvinar
                                pellentesque habitant morbi tristique. Platea dictumst quisque sagittis purus sit amet
                                volutpat. Nulla facilisi morbi tempus iaculis urna. Nunc sed blandit libero volutpat sed
                                cras. Magna sit amet purus gravida quis. Vel fringilla est ullamcorper eget nulla.</p>
                            <p>Consequat interdum varius sit amet mattis vulputate enim nulla aliquet. Praesent tristique
                                magna sit amet purus gravida. In cursus turpis massa tincidunt dui ut ornare lectus.
                                Tristique risus nec feugiat in fermentum posuere urna nec. Non blandit massa enim nec dui
                                nunc mattis. Volutpat blandit aliquam etiam erat velit. In ante metus dictum at. Pretium
                                vulputate sapien nec sagittis aliquam malesuada bibendum. Scelerisque mauris pellentesque
                                pulvinar pellentesque habitant morbi tristique senectus et. Ipsum suspendisse ultrices
                                gravida dictum fusce ut placerat orci nulla.</p>
                            <p>Non consectetur a erat nam. Tempor id eu nisl nunc mi ipsum faucibus vitae aliquet. Nec dui
                                nunc mattis enim ut tellus elementum sagittis. Pellentesque nec nam aliquam sem et tortor
                                consequat id porta. Mauris commodo quis imperdiet massa tincidunt. Nullam vehicula ipsum a
                                arcu cursus vitae congue mauris. In fermentum et sollicitudin ac. Fermentum dui faucibus in
                                ornare quam viverra orci sagittis eu. Ac turpis egestas sed tempus urna et pharetra pharetra
                                massa. Sit amet justo donec enim. Aliquam purus sit amet luctus venenatis lectus magna
                                fringilla. Non quam lacus suspendisse faucibus interdum.</p>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <script type="text/javascript" src="js/login.js"></script>
    </body>

</html>
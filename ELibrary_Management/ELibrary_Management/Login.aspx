<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ELibrary_Management.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Existing Login Form a Flat Responsive Widget Template :: W3layouts</title>

    <!-- Meta-Tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="keywords" content="Existing Login Form Widget Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design">
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //Meta-Tags -->

    <link href="../login/css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />

    <!-- Style -->
    <link rel="stylesheet" href="../login/css/style.css" type="text/css" media="all">

    <!-- Fonts -->
    <link href="//fonts.googleapis.com/css?family=Quicksand:300,400,500,700" rel="stylesheet">
    <!-- //Fonts -->
</head>
<body>
    <form id="form1" runat="server">

        <h1>LIBRARY FPT EDUCATION</h1>

        <div class="w3layoutscontaineragileits">
            <h2>Login here</h2>
            <form action="#" method="post">
                <asp:TextBox ID="TextBox1" TextMode="Email" runat="server" placeholder="EMAIL" required=""></asp:TextBox>
                <asp:TextBox ID="TextBox2" TextMode="Password" runat="server" placeholder="PASSWORD" required=""></asp:TextBox>
                <ul class="agileinfotickwthree">
                    <li>
                        <input type="checkbox" id="brand1" value="">
                        <label for="brand1"><span></span>Remember me</label>
                        <a href="#">Forgot password?</a>
                    </li>
                </ul>
                <div class="aitssendbuttonw3ls">
                    <asp:Button ID="Button1" runat="server" Text="LOGIN" OnClick="Button1_Click" />
                    <div class="clear"></div>
                </div>
            </form>
        </div>

        <!-- for register popup -->
        <div id="small-dialog1" class="mfp-hide">
            <div class="contact-form1">
                <div class="contact-w3-agileits">
                    <h3>Register Form</h3>
                    <form action="#" method="post">
                        <div class="form-sub-w3ls">
                            <input placeholder="User Name" type="text" required="">
                            <div class="icon-agile">
                                <i class="fa fa-user" aria-hidden="true"></i>
                            </div>
                        </div>
                        <div class="form-sub-w3ls">
                            <input placeholder="Email" class="mail" type="email" required="">
                            <div class="icon-agile">
                                <i class="fa fa-envelope-o" aria-hidden="true"></i>
                            </div>
                        </div>
                        <div class="form-sub-w3ls">
                            <input placeholder="Password" type="password" required="">
                            <div class="icon-agile">
                                <i class="fa fa-unlock-alt" aria-hidden="true"></i>
                            </div>
                        </div>
                        <div class="form-sub-w3ls">
                            <input placeholder="Confirm Password" type="password" required="">
                            <div class="icon-agile">
                                <i class="fa fa-unlock-alt" aria-hidden="true"></i>
                            </div>
                        </div>
                        <div class="login-check">
                            <label class="checkbox">
                                <input type="checkbox" name="checkbox" checked="">I Accept Terms & Conditions</label>
                        </div>
                        <div class="submit-w3l">
                            <input type="submit" value="Register">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- //for register popup -->

        <div class="w3footeragile">
           <p><strong> Hoa Lac Library | Copyright @ </strong><a href="http://libol.fpt.edu.vn/" target="_blank"> FPT University</a></p>
        </div>


        <script type="text/javascript" src="../login/js/jquery-2.1.4.min.js"></script>

        <!-- pop-up-box-js-file -->
        <script src="../login/js/jquery.magnific-popup.js" type="text/javascript"></script>
        <!--//pop-up-box-js-file -->
        <!-- sweet alert -->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
            $(document).ready(function () {
                $('.w3_play_icon,.w3_play_icon1,.w3_play_icon2').magnificPopup({
                    type: 'inline',
                    fixedContentPos: false,
                    fixedBgPos: true,
                    overflowY: 'auto',
                    closeBtnInside: true,
                    preloader: false,
                    midClick: true,
                    removalDelay: 300,
                    mainClass: 'my-mfp-zoom-in'
                });

            });
        </script>
    </form>
</body>
</html>

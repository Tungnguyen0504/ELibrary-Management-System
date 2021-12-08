<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="ELibrary_Management.homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/home-page.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.css" integrity="sha512-UTNP5BXLIptsaj5WdKFrkFov94lDx+eBvbKyoe1YAfjeRPC+gT5kyZ10kOHCfNZqEui1sxmqvodNUx3KbuYI/A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.css" integrity="sha512-OTcub78R3msOCtY3Tc6FzeDJ8N9qvQn1Ph49ou13xgA9VsH9+LRxoFU6EqLhW4+PKRfU+/HReXmSZXHEkpYoOA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <style>
        .header-navbar .navbar-wrapper .header-search .main-search .input-group {
            height: 29px;
        }

        .pcoded .pcoded-header[header-theme="theme1"] .input-group-addon, .pcoded .pcoded-header[header-theme="theme1"] a {
            text-decoration: none;
        }

        .media {
            display: flex;
        }

        #txtBookName {
            width: 230px;
            height: 29px;
            margin: 0 30px;
        }

        #Button2 {
            background: transparent;
            border: none;
            width: 30px;
            cursor: pointer;
            z-index: 1;
            height: 29px;
            position: absolute;
            top: 0;
            left: 2px;
        }

        #Button3 {
            background: transparent;
            border: none;
            width: 37px;
            cursor: pointer;
            z-index: 1;
            height: 29px;
            position: absolute;
            right: 5px;
            top: 0px;
        }

        body[themebg-pattern="theme1"] {
            background: #fff;
        }

        #bg-image {
            opacity: 1;
            background-image: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.4)), url('assets/images/bg-image.jpg');
            background-size: cover;
        }

            #bg-image a {
                background: #222;
                color: #eee;
                border: none;
            }

                #bg-image a:hover {
                    background: #df1827;
                }

        .header-navbar {
            padding: 0;
        }

        .show-notification {
            padding: 0;
        }

        .header-navbar .navbar-wrapper .navbar-container .header-notification .profile-notification li:first-child {
            padding: 0.7em 20px;
            padding-left: 35px;
        }

        .header-navbar .navbar-wrapper .navbar-container .header-notification .profile-notification a {
            text-decoration: none;
        }

        .banner {
            margin-bottom: 30px;
        }

        .owl-prev {
            left: -30px;
        }

        .owl-next {
            right: -30px;
        }

        .owl-next,
        .owl-prev {
            position: absolute;
            top: 20%;
        }

            .owl-next span,
            .owl-prev span {
                font-size: 65px;
                color: #787878;
            }

        .owl-theme .owl-nav [class*="owl-"]:hover {
            background: transparent;
        }

        .owl-carousel .owl-item img {
            width: 135px;
            height: 175px;
            padding-left: 15px;
        }

        .card-block {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 9px;
        }

            .card-block #btn-login {
                padding: 0;
                margin: 0;
                background: blue;
            }

                .card-block #btn-login:hover {
                    background: coral;
                }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header class="py-5">
        <div class="container px-lg-5" style="margin-top: -1rem !important;">
            <div class="p-4 p-lg-5 bg-light rounded-3 text-center" id="bg-image">
                <div class="m-4 m-lg-5 text-white">
                    <h1 class="display-5 fw-bold">Welcome to <strong>Fpt Library Center</strong>!</h1>
                    <p class="fs-4" style="color: lightgray;">Information and Library Center primary function is to support the teaching, research and scholarly activities of faculty, staff and students of FPT university.</p>
                    <a class="btn btn-primary btn-lg" href="ViewBook.aspx">View Book Now</a>
                </div>
            </div>
        </div>
    </header>

    <%--slider--%>
    <section class="pt-4" style="padding-bottom: 20px;">
        <div class="container px-lg-5" id="slider">
            <h2>
                <strong style="color: #e18109;">New</strong> Arrival
            </h2>
            <div class="slider">
                <div class="owl-carousel owl-theme">
                    <asp:Repeater ID="carousel" runat="server">
                        <ItemTemplate>
                            <div class="item active">
                                <div class="card mb-3" style="max-width: 540px;">
                                    <div class="row g-0 d-flex align-items-center" style="height: 205px;">
                                        <div class="col-md-4">
                                            <a href="viewBookDetail.aspx?id=<%# Eval("BookID") %>">
                                                <asp:Image ID="Image2" runat="server" ImageUrl='<%# "../img/book_inventory/" + Eval("BookImage") %>' />
                                            </a>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="card-body">
                                                <a href="viewBookDetail.aspx?id=<%# Eval("BookID") %>" class="text-decoration-none">
                                                    <h5 class="card-title text-truncate"><%# Eval("BookName") %></h5>
                                                </a>
                                                <p class="card-text mb-0">
                                                    Genre - <%# Eval("Genre") %>
                                                    <br />
                                                    Author - <%# Eval("AuthorName") %>
                                                    <br />
                                                    Book cost - <%# Eval("BookCost") %>
                                                    <br />
                                                    Available - <%# (int) Eval("Available") > 0 ? "In stock" : "Out of stock" %>
                                                </p>
                                                <p class="card-text mb-0">
                                                    <div style="font-size: 20px; color: darkgoldenrod;">
                                                        <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                                                    </div>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </section>
    <%--end slider--%>

    <!-- Page Content-->
    <section class="pt-4">
        <div class="container px-lg-5">
            <h2 style="margin-bottom: 40px;">
                <strong style="color: #e18109;">About</strong> Us
            </h2>
            <!-- Page Features-->
            <div class="row gx-lg-5">
                <div class="col-lg-6 col-xxl-4 mb-5">
                    <div class="card bg-light border-0 h-100">
                        <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i class="bi bi-collection"></i></div>
                            <h2 class="fs-4 fw-bold">Function</h2>
                            <p class="mb-0">Information and Library Center primary function is to support the teaching, research and scholarly activities of faculty, staff and students of FPT university.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-xxl-4 mb-5">
                    <div class="card bg-light border-0 h-100">
                        <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i class="bi bi-cloud-download"></i></div>
                            <h2 class="fs-4 fw-bold">Free to Read Book</h2>
                            <p class="mb-0">As always, Fpt Library has a powerful collectin of free Books..</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-xxl-4 mb-5">
                    <div class="card bg-light border-0 h-100">
                        <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i class="bi bi-card-heading"></i></div>
                            <h2 class="fs-4 fw-bold">Collection</h2>
                            <p class="mb-0">
                                Almost 80,000 textbooks and references;<br />
                                4 databases with more than 35.000 ebooks;<br />
                                Reference Collection including Dictionaries….;<br />
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-xxl-4 mb-5">
                    <div class="card bg-light border-0 h-100">
                        <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i class="bi bi-bootstrap"></i></div>
                            <h2 class="fs-4 fw-bold">Services</h2>
                            <p class="mb-0">
                                Circulation; Seaking Information; Library's Orientation "Log-on-to E-resource";
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-xxl-4 mb-5">
                    <div class="card bg-light border-0 h-100">
                        <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i class="bi bi-code"></i></div>
                            <h2 class="fs-4 fw-bold">Address</h2>
                            <p class="mb-0">
                                FPTU HÀ NỘI - HOA LAC  LIBRARY:
                                    <br />
                                Add: Beta Building, Room no.107, 1st floor, Hoa Lac Campus, Km29 Thang Long avenue, Hoa Lac Hi - Tech Park, Thach That, Ha Noi.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-xxl-4 mb-5">
                    <div class="card bg-light border-0 h-100">
                        <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i class="bi bi-patch-check"></i></div>
                            <h2 class="fs-4 fw-bold">Openning</h2>
                            <p class="mb-0">
                                Monday - Friday | 8.30 –  21.30
                                    <br />
                                Saturday, Sunday | 8.00  –   12.00 & 13.30  –   17.30
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script>
        $('.owl-carousel').owlCarousel({
            autoplay: true,
            autoplayHoverPause: true,
            items: 3,
            dots: true,
            loop: true,
            margin: 10,
            nav: true
        })
    </script>
</asp:Content>

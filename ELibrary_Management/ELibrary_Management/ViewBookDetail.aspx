<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewBookDetail.aspx.cs" Inherits="ELibrary_Management.viewBookDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .pcoded-wrapper {
            background: #FFFFFF;
        }

        .carousel-item img {
            height: 250px;
            border-radius: 5px;
        }

        .breadcrumb-item a {
            text-decoration: none;
            color: black;
        }

        .carousel-caption {
            background: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.4));
        }

        .detail-left {
            width: 173px;
            text-transform: uppercase;
            font-weight: bold;
        }

        .table td, .table th {
            padding: 0.35rem 0;
            border: 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="card mb-0">
            <div class="card-block" style="padding: 10px 30px">
                <h5>View Book Detail Page</h5>
                <div class="page-header-breadcrumb">
                    <ul class="breadcrumb-title d-flex align-items-center ps-0 mb-0">
                        <li class="breadcrumb-item">
                            <a href="home-default.aspx" style="font-size: 24px;">
                                <i class="icofont icofont-home"></i>
                            </a>
                        </li>
                        <li class="breadcrumb-item"><a href="#!">View Book Detail</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="bd-example">
            <div id="carouselExampleCaptions" class="carousel slide carousel-fade" data-ride="carousel">
                <ol class="carousel-indicators my-4">
                    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
                    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="assets/images/banner.png" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block mb-4">
                            <h2>Home - View Book Detail</h2>
                            <p class="mb-0">Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="assets/images/banner2.png" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block mb-4">
                            <h2>Home - View Book Detail</h2>
                            <p class="mb-0">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="assets/images/banner3.png" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block mb-4">
                            <h2>Home - View Book Detail</h2>
                            <p class="mb-0">Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>

        <h2 style="margin-bottom: 0; padding: 30px; width: 100%;">View Book Detail</h2>
        <div class="card m-0 col-12 bg-white" style="padding: 1.25rem 2.25rem;">
            <div class="row card-body">
                <div class="col-md-4 p-0 d-flex align-items-center">
                    <asp:Image ID="Image1" runat="server" ImageUrl="img/book_inventory/book-picture.png" Width="350" Height="410" />
                </div>
                <div class="col-md-8 p-l-40">
                    <!-- Content -->
                    <div class="single-book-content">

                        <!-- Category & Title -->
                        <div class="head-content">

                            <div class="category-title">
                                <a href="#" style="font-size: 18px;">
                                    <asp:Label ID="txtGenre" runat="server" Text="Label"></asp:Label>
                                </a>
                                <h3 class="title p-b-5" style="color: #0066cc;">
                                    <asp:Label ID="txtBookName" runat="server" Text="Label"></asp:Label>
                                </h3>
                            </div>

                            <h5 class="price mb-2"><span class="detail-left">Book cost: </span>$<asp:Label ID="txtCost" runat="server" Text="Label"></asp:Label>.00</h5>

                        </div>

                        <div class="single-product-description">

                            <div class="ratting mb-2" style="color: #f2b645; font-size: 18px;">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>

                            <div class="desc">
                                <p>
                                    <span class="detail-left">Description: </span>
                                    <asp:Label ID="txtDes" runat="server" Text="Label" style="font-size: 14px;"></asp:Label>
                                </p>
                            </div>

                            <div class="detail">
                                <table style="width: 100%;" class="table">
                                    <tr class="mb-1" style="margin-bottom: 15px;">
                                        <td class="detail-left">
                                            Availability: 
                                        </td>
                                        <td class="detail-right">
                                            <asp:Label ID="txtAvailable" runat="server" Text="Label" style="margin-bottom: 15px;"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="detail-left">
                                            Author: 
                                        </td>
                                        <td class="detail-right">
                                            <asp:Label ID="txtAuthor" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="detail-left">
                                            Publisher:
                                        </td>
                                        <td class="detail-right">
                                            <asp:Label ID="txtPublisher" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="detail-left">
                                            Publish date:
                                        </td>
                                        <td class="detail-right">
                                            <asp:Label ID="txtDate" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="detail-left">
                                            Language:
                                        </td>
                                        <td class="detail-right">
                                            <asp:Label ID="txtLanguage" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="detail-left">
                                            Edition: 
                                        </td>
                                        <td class="detail-right">
                                            <asp:Label ID="txtEdition" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="detail-left">
                                            Number of Pages: 
                                        </td>
                                        <td class="detail-right">
                                            <asp:Label ID="txtNoOfPage" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="detail-left">
                                            Can borrow:
                                        </td>
                                        <td class="detail-right">
                                            <asp:Label ID="txtCanborrow" runat="server" Text="Label"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

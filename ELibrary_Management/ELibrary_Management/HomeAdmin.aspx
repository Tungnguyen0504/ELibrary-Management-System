<%@ Page Title="" Language="C#" MasterPageFile="~/sidebar.Master" AutoEventWireup="true" CodeBehind="HomeAdmin.aspx.cs" Inherits="ELibrary_Management.home_admin" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .carousel-item {
            padding: 15px;
        }

            .carousel-item img {
                width: 100%;
                height: 500px;
                border-radius: 5px;
            }

        .carousel-caption {
            height: fit-content;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.4));
            border-radius: 5px;
        }
    </style>
    <div class="bd-example">
        <div id="carouselExampleCaptions" class="carousel slide carousel-fade" data-ride="carousel">
            <ol class="carousel-indicators my-4">
                <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
                <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active" data-bs-interval="10000">
                    <img src="assets/images/banner.png" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block mb-4">
                        <h2>Admin Page</h2>
                        <p class="mb-0">Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
                    </div>
                </div>
                <div class="carousel-item" data-bs-interval="10000">
                    <img src="assets/images/banner2.png" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block mb-4">
                        <h2>Admin Page</h2>
                        <p class="mb-0">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    </div>
                </div>
                <div class="carousel-item" data-bs-interval="10000">
                    <img src="assets/images/banner3.png" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block mb-4">
                        <h2>Admin Page</h2>
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
</asp:Content>

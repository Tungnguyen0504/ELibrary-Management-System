<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewBook.aspx.cs" Inherits="ELibrary_Management.view_book" %>

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

        table.dataTable tbody th, table.dataTable tbody td {
            border: none;
        }

        table.dataTable {
            border: none;
        }

            table.dataTable tbody tr {
                background: transparent;
            }

            table.dataTable tbody th, table.dataTable tbody td {
                padding: 0;
            }

        thead {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="card mb-0">
            <div class="card-block" style="padding: 10px 30px">
                <h5>List Book Page</h5>
                <div class="page-header-breadcrumb">
                    <ul class="breadcrumb-title d-flex align-items-center ps-0 mb-0">
                        <li class="breadcrumb-item">
                            <a href="home-default.aspx" style="font-size: 24px;">
                                <i class="icofont icofont-home"></i>
                            </a>
                        </li>
                        <li class="breadcrumb-item"><a href="#!">View Books</a>
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
                            <h2>Home - View Books</h2>
                            <p class="mb-0">Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="assets/images/banner2.png" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block mb-4">
                            <h2>Home - View Books</h2>
                            <p class="mb-0">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="assets/images/banner3.png" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block mb-4">
                            <h2>Home - View Books</h2>
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

        <div class="row">
            <h2 style="margin-bottom: 0; padding: 30px; width: 100%;">View Books</h2>
            <div class="col-md-12">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <div class="card card-body" style="margin-bottom: 15px;">
                                    <div class="media align-items-center align-items-lg-start text-lg-left flex-column flex-lg-row">
                                        <div class="row" style="width: 100%;">
                                            <div class="mb-3 mb-lg-0 col-md-3 p-0 d-flex justify-content-center align-items-center">
                                                <a href="ViewBookDetail.aspx?id=<%# Eval("BookID") %>">
                                                    <asp:Image ID="Image2" runat="server" ImageUrl='<%# "../img/book_inventory/" + Eval("BookImage") %>' Width="150" Height="180" alt="" Style="margin-right: 30px;" />
                                                </a>
                                            </div>
                                            <div class="media-body mb-3 col-md-9 p-0">
                                                <div>
                                                    <a href="viewBookDetail.aspx?id=<%# Eval("BookID") %>" data-abc="true" style="font-weight: bold; font-size: 23px; text-decoration: none;"><%# Eval("BookName") %></a>
                                                </div>
                                                <div style="font-size: 20px; color: darkgoldenrod;">
                                                    <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                                                </div>

                                                <span>Author - </span>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Author") %>' Font-Bold="True"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <span>Genre - </span>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Genre") %>' Font-Bold="True"></asp:Label>&nbsp;<br />

                                                <span>Language - </span>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("Language") %>' Font-Bold="True"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <span>Pages - </span>
                                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("NoOfPages") %>' Font-Bold="True"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 <span>Edition - </span>
                                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("Edition") %>' Font-Bold="True"></asp:Label>&nbsp;<br />

                                                <span>Cost - </span>
                                                <asp:Label ID="Label7" runat="server" Text='<%# "$" + Eval("BookCost") %>' Font-Bold="True"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <span>Available - </span>
                                                <asp:Label ID="Label8" runat="server" Text='<%# (int) Eval("Available") > 0 ? "In Stock" : "Out of Stock" %>' Font-Bold="True"></asp:Label><br />

                                                <div class="text-truncate">
                                                    <span>Description - </span>
                                                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("BookDescription") %>' Font-Bold="True"></asp:Label><br />
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=GridView1.ClientID %>").dataTable({
                lengthMenu: [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]]
            });
        });
    </script>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/sidebar.master" AutoEventWireup="true" CodeBehind="AddEditBookInventory.aspx.cs" Inherits="ELibrary_Management.adminAddEditBookInventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" style="width: 100%;">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <h5>Book detail</h5>
                </div>
                <div class="form-material col-md-12 text-center mt-4">
                    <asp:Image ID="Image2" CssClass="imgview" runat="server" ImageUrl="assets/images/book-picture.png" Style="width: 125px; height: 150px;" />
                </div>
                <div class="card-block d-flex">
                    <div class="form-material col-md-6">
                        <% if (Request.QueryString["action"] == "edit")
                            {
                        %>
                        <div class="form-group form-default">
                            <input type="text" class="form-control" required="" disabled>
                            <span class="form-bar"></span>
                            <asp:Label ID="lblID" runat="server" class="float-label"></asp:Label>
                        </div>
                        <div class="form-group form-default">
                            <asp:TextBox ID="txtBookNameEdit" runat="server" CssClass="form-control" required=""></asp:TextBox>
                            <span class="form-bar"></span>
                            <label class="float-label">Book Name</label>
                        </div>
                        <% } %>
                        <% if (Request.QueryString["action"] == "add")
                            { %>
                        <div class="form-group form-default row" style="padding: 15px;">
                            <div class="col-md-10 p-0">
                                <asp:TextBox ID="txtBookNameAdd" runat="server" CssClass="form-control" required=""></asp:TextBox>
                                <span class="form-bar"></span>
                                <label class="float-label">Book Name</label>
                            </div>
                            <div class="col-md-2 p-0 d-flex align-items-end justify-content-end">
                                <div class="checkbox-fade fade-in-primary m-0">
                                    <label>
                                        <asp:CheckBox ID="cbCheckName" runat="server" OnCheckedChanged="cbCheckName_CheckedChanged" AutoPostBack="True" />
                                        <span class="cr"><i class="cr-icon icofont icofont-ui-check txt-primary"></i></span>
                                        <span class="text-inverse">Check</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <% } %>

                        <div class="form-group form-default">
                            <asp:TextBox ID="txtEdition" runat="server" CssClass="form-control" required=""></asp:TextBox>
                            <span class="form-bar"></span>
                            <label class="float-label">Edition</label>
                        </div>
                        <div class="form-group form-default">
                            <asp:TextBox ID="txtCost" runat="server" CssClass="form-control" TextMode="Number" required=""></asp:TextBox>
                            <span class="form-bar"></span>
                            <label class="float-label">Book cost (per unit)</label>
                        </div>
                        <div class="form-group form-default">
                            <asp:TextBox ID="txtNoPage" runat="server" CssClass="form-control" TextMode="Number" required=""></asp:TextBox>
                            <span class="form-bar"></span>
                            <label class="float-label">Number of Page</label>
                        </div>
                        <div class="form-group form-default">
                            <asp:TextBox ID="txtDes" runat="server" CssClass="form-control" TextMode="MultiLine" required="" Style="height: 45px !important;"></asp:TextBox>
                            <span class="form-bar"></span>
                            <label class="float-label">Book description</label>
                        </div>
                        <div class="form-group form-default">
                            <asp:TextBox ID="txtAvailable" runat="server" CssClass="form-control" TextMode="Number" required=""></asp:TextBox>
                            <span class="form-bar"></span>
                            <label class="float-label">Available</label>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label d-flex align-items-center" required="">Publish date</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="txtPublishDate" runat="server" CssClass="form-control" TextMode="Date" required=""></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="form-material col-md-6 textbox-right">
                        <style>
                            .textbox-right label {
                                padding-left: 45px;
                            }
                        </style>
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label d-flex align-items-center">Genre</label>
                            <div class="col-sm-9 lb-genre">
                                <style>
                                    .lb-genre option {
                                        padding-left: 25px;
                                    }
                                </style>
                                <asp:ListBox ID="lbGenre" runat="server" Width="100%" SelectionMode="Multiple" Style="border: 1px solid #ccc;" required="">
                                    <asp:ListItem Text="Self Help" Value="Self Help" />
                                    <asp:ListItem Text="Motivation" Value="Motivation" />
                                    <asp:ListItem Text="Education" Value="Education" />
                                    <asp:ListItem Text="IT" Value="Information Technology" />
                                    <asp:ListItem Text="Fiction" Value="Action and Adventure" />
                                    <asp:ListItem Text="Classics" Value="Classics" />
                                    <asp:ListItem Text="Romance" Value="Comic Book or Graphic Novel" />
                                    <asp:ListItem Text="Detective and Mystery" Value="Detective and Mystery" />
                                    <asp:ListItem Text="Science Fiction (Sci-Fi)" Value="Science Fiction (Sci-Fi)" />
                                    <asp:ListItem Text="Short Stories" Value="Short Stories" />
                                </asp:ListBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label d-flex align-items-center" required="">Author</label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="ddlAuthor" runat="server" CssClass="form-control" Style="border-bottom: 1px solid #ccc">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label d-flex align-items-center">Publisher</label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="ddlPublisher" runat="server" CssClass="form-control" Style="border-bottom: 1px solid #ccc">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label d-flex align-items-center">Language</label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="ddlLanguage" runat="server" CssClass="form-control" Style="border-bottom: 1px solid #ccc">
                                    <asp:ListItem Text="English" Value="English" />
                                    <asp:ListItem Text="Vietnam" Value="Vietnam" />
                                    <asp:ListItem Text="Japan" Value="Japan" />
                                    <asp:ListItem Text="Chinese" Value="Chinese" />
                                    <asp:ListItem Text="German" Value="German" />
                                    <asp:ListItem Text="French" Value="French" />
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label d-flex align-items-center">Can Borrow?</label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="ddlCanBorrow" runat="server" CssClass="form-control" Style="border-bottom: 1px solid #ccc">
                                    <asp:ListItem Text="Yes" Value="1" />
                                    <asp:ListItem Text="No" Value="0" />
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label pr-0">Upload File</label>
                            <div class="col-sm-9">
                                <asp:FileUpload ID="FileUpload1" runat="server" onchange="readURL(this);" class="form-control" Style="padding-top: 5px;" required="" />
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="d-flex justify-content-center" style="padding-bottom: 20px;">
                <% if (Request.QueryString["action"] == "edit")
                    { %>
                <asp:Button ID="Button1" runat="server" Text="Update" CssClass="btn btn-info waves-effect waves-light" Width="200" OnClick="Button1_Click" />
                <% } %>
                <% if (Request.QueryString["action"] == "add")
                    { %>
                <asp:Button ID="Button2" runat="server" Text="Add" CssClass="btn btn-info waves-effect waves-light" Width="200" OnClick="Button1_Click" />
                <% } %>
            </div>
        </div>
    </div>
    <script>
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('.imgview').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</asp:Content>

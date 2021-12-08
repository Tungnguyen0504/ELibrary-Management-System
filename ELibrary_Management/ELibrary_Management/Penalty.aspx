<%@ Page Title="" Language="C#" MasterPageFile="~/sidebar.master" AutoEventWireup="true" CodeBehind="Penalty.aspx.cs" Inherits="ELibrary_Management.Penalty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col">
        <div class="card">
            <div class="card-header">
                <h5>Penalty</h5>
            </div>
            <div class="card-block d-flex m-30" style="border: 1px solid #ccc; padding: 15px 10px;">
                <div class="form-material row w-100 align-items-center" style="padding: 0 60px;">
                    <div class="col-md-4" style="padding: 0 25px;">
                        <div class="form-group form-default">
                            <asp:TextBox ID="txtNumberID" runat="server" class="form-control" required=""></asp:TextBox>
                            <span class="form-bar"></span>
                            <label class="float-label">Student Number ID</label>
                        </div>
                    </div>
                    <div class="col-md-4" style="padding: 0 25px;">
                        <div class="form-group form-default">
                            <asp:TextBox ID="txtBookID" runat="server" class="form-control" required=""></asp:TextBox>
                            <span class="form-bar"></span>
                            <label class="float-label">Book ID</label>
                        </div>
                    </div>
                    <div class="col-4 text-center">
                        <asp:Button ID="Button1" class="btn btn-primary waves-effect waves-light" runat="server" Text="Search" Width="150" required="" OnClick="Button1_Click" />
                    </div>
                </div>
            </div>

            <style>
                #detail .form-group .form-control {
                    padding-left: 0 !important;
                }
            </style>
            <div class="card-block" runat="server" id="detail" visible="false">
                <h4 class="sub-title">Basic Inputs</h4>
                <div class="row w-100">
                    <div class="col-12">
                        <h3 style="margin: 25px 30px 30px 60px !important">
                            <asp:Label ID="lblBookName" runat="server" Text="Label"></asp:Label>
                        </h3>
                    </div>
                    <div class="col-md-4 text-right">
                        <asp:Image ID="Image1" runat="server" ImageUrl="img/book_inventory/book-picture.png" Width="300" style="border-radius: 5px;" />
                    </div>
                    <div class="col-md-4">
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Author :</label>
                            <div class="col-sm-8 p-l-0">
                                <asp:TextBox ID="txtAuthor" class="form-control" Enabled="false" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Genre :</label>
                            <div class="col-sm-8 p-l-0">
                                <asp:TextBox ID="txtGenre" class="form-control" Enabled="false" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Publish date :</label>
                            <div class="col-sm-8 p-l-0">
                                <asp:TextBox ID="txtPublishDate" class="form-control" Enabled="false" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Penalty :</label>
                            <div class="col-sm-8 p-l-0">
                                <asp:TextBox ID="txtSt" class="form-control" Enabled="false" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Borrowed date :</label>
                            <div class="col-sm-8 p-l-0">
                                <asp:TextBox ID="txtBorrowDate" class="form-control" Enabled="false" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Amount :</label>
                            <div class="col-sm-8 p-l-0">
                                <asp:TextBox ID="txtAmmount" class="form-control" Enabled="false" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Full name :</label>
                            <div class="col-sm-8 p-l-0">
                                <asp:TextBox ID="txtName" class="form-control" Enabled="false" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Number ID :</label>
                            <div class="col-sm-8 p-l-0">
                                <asp:TextBox ID="txtNumID" class="form-control" Enabled="false" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Email :</label>
                            <div class="col-sm-8 p-l-0">
                                <asp:TextBox ID="txtEmail" class="form-control" Enabled="false" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Phone :</label>
                            <div class="col-sm-8 p-l-0">
                                <asp:TextBox ID="txtPhone" class="form-control" Enabled="false" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Due date :</label>
                            <div class="col-sm-8 p-l-0">
                                <asp:TextBox ID="txtDueDate" class="form-control" Enabled="false" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Detail :</label>
                            <div class="col-sm-8 p-l-0">
                                <asp:TextBox ID="txtDetail" class="form-control" runat="server" Style="width: 171.2px;"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-12">
                        <asp:Button ID="Button2" class="btn btn-primary waves-effect waves-light pos-absolute m-t-20" style="left: -36%;" runat="server" Text="Pay Now" Width="180" required="" OnClick="Button2_Click" />
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

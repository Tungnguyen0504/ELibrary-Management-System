<%@ Page Title="" Language="C#" MasterPageFile="~/sidebar.master" AutoEventWireup="true" CodeBehind="ViewDetailBorrowedReturnedBook.aspx.cs" Inherits="ELibrary_Management.ViewDetailBorrowedReturnedBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
      .form-control {
            width: 80%;
            height: 30px;
        }
    </style>
    <div class="row" style="width: 100%;">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <h5>View Borrowed / Returned Book Detail</h5>
                </div>
                <div class="form-material col-md-12 text-center mt-4">
                    <asp:Image ID="Image2" CssClass="imgview" runat="server" ImageUrl="assets/images/book-picture.png" Style="width: 125px; height: 150px;" />
                </div>
                <div class="card-block d-flex" style="padding: 20px 80px;">
                    <div class="col-md-6">
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label">User ID :</label>
                            <div class="col-sm-9 p-l-0">
                                <asp:TextBox ID="txtUid" CssClass="form-control"  readonly="true" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Book ID :</label>
                            <div class="col-sm-9 p-l-0">
                                <asp:TextBox ID="txtBid" CssClass="form-control" readonly="true" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Borrowed Total:</label>
                            <div class="col-sm-9 p-l-0">
                                <asp:TextBox ID="txtTotal" CssClass="form-control" readonly="true" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Borrowed Date :</label>
                            <div class="col-sm-9 p-l-0">
                                <asp:TextBox ID="txtBorrowDate" CssClass="form-control" readonly="true" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Due Date :</label>
                            <div class="col-sm-9 p-l-0">
                                <asp:TextBox ID="txtDueDate" CssClass="form-control" readonly="true" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Returned Date :</label>
                            <div class="col-sm-9 p-l-0">
                                <asp:TextBox ID="txtReturnDate" CssClass="form-control" readonly="true" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        
                    </div>
                    <div class="col-md-6">
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Full Name :</label>
                            <div class="col-sm-9 p-l-0">
                                <asp:TextBox ID="txtFName" CssClass="form-control" readonly="true" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Book Name :</label>
                            <div class="col-sm-9 p-l-0">
                                <asp:TextBox ID="txtBName" CssClass="form-control" readonly="true" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Status :</label>
                            <div class="col-sm-9 p-l-0">
                                <asp:TextBox ID="txtSt" CssClass="form-control" readonly="true" runat="server"></asp:TextBox>
                            </div>
                        </div>
                         <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Fine Amount :</label>
                            <div class="col-sm-9 p-l-0">
                                <asp:TextBox ID="txtFine" CssClass="form-control" readonly="true" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Detail :</label>
                            <div class="col-sm-9 p-l-0">
                                <asp:TextBox ID="txtDetail" CssClass="form-control" readonly="true" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
              
            </div>
        </div>
    </div>
</asp:Content>

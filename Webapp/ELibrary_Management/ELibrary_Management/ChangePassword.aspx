<%@ Page Title="" Language="C#" MasterPageFile="~/sidebar.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="ELibrary_Management.change_password" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" style="width: 100%;">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <h5>My Account</h5>
                    <!--<span>Add class of <code>.form-control</code> with <code>&lt;input&gt;</code> tag</span>-->
                </div>
                <div class="card-block d-flex justify-content-center">
                    <div class="form-material col-md-6">
                        <div class="form-group form-default">
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" ReadOnly=""></asp:TextBox>
                            <span class="form-bar"></span>
                        </div>
                        <div class="form-group form-default">
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" MaxLength="8" required=""></asp:TextBox>
                            <span class="form-bar"></span>
                            <label class="float-label">Current Password</label>
                        </div>
                        <div class="form-group form-default">
                            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" MaxLength="8" required=""></asp:TextBox>
                            <span class="form-bar"></span>
                            <label class="float-label">New Password</label>
                        </div>
                        <div class="form-group form-default">
                            <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" MaxLength="8" required=""></asp:TextBox>
                            <span class="form-bar"></span>
                            <label class="float-label">Confirm Password</label>
                        </div>
                    </div>
                </div>
                <div class="d-flex justify-content-center" style="padding-bottom: 20px;">
                    <asp:Button ID="Button1" runat="server" Text="Comfirm" CssClass="btn btn-info waves-effect waves-light" Width="200" OnClick="Button1_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

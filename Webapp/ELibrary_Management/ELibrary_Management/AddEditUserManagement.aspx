<%@ Page Title="" Language="C#" MasterPageFile="~/sidebar.master" AutoEventWireup="true" CodeBehind="AddEditUserManagement.aspx.cs" Inherits="ELibrary_Management.adminAddEditUserManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" style="width: 100%;">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <h5>Add & Edit Account</h5>
                </div>
                <div class="form-material col-md-12 text-center mt-4">
                    <asp:Image ID="Image2" CssClass="imgview" ImageUrl="../img/member_img/user-blank.png" runat="server" Style="width: 125px; height: 125px; border-radius: 5px; border: 1px solid #ccc;" />
                </div>
                <div class="card-block d-flex">
                    <div class="form-material col-md-6">
                        <% if (Request.QueryString["action"] != "add")
                            { %>
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label d-flex align-items-end" required="">ID</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="txtUserID" runat="server" CssClass="form-control" ReadOnly=""></asp:TextBox>
                            </div>
                        </div>
                        <% } %>
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label d-flex align-items-end" required="">User Number ID</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="txtUserNumberID" runat="server" CssClass="form-control" required=""></asp:TextBox>
                            </div>
                        </div>

                        <% if (Request.QueryString["action"] == "edit")
                            { %>
                        <div class="form-group form-default">
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" required=""></asp:TextBox>
                            <span class="form-bar"></span>
                            <label class="float-label">Email</label>
                        </div>
                        <% } %>
                        <% if (Request.QueryString["action"] == "add")
                            { %>
                        <div class="form-group form-default row" style="padding: 0 15px;">
                            <div class="col-md-10 p-0">
                                <asp:TextBox ID="txtEmailAdd" runat="server" CssClass="form-control" TextMode="Email" required=""></asp:TextBox>
                                <span class="form-bar"></span>
                                <label class="float-label">Email</label>
                            </div>
                                <div class="col-md-2 p-0 d-flex align-items-end justify-content-end">
                                    <div class="checkbox-fade fade-in-primary m-0">
                                        <label class="d-flex m-0">
                                            <asp:CheckBox ID="cbCheck" runat="server" OnCheckedChanged="cbCheck_CheckedChanged" AutoPostBack="True" />
                                            <span class="cr"><i class="cr-icon icofont icofont-ui-check txt-primary"></i></span>
                                            <span class="text-inverse">Check</span>
                                        </label>
                                    </div>
                                </div>
                        </div>
                        <% } %>

                        <div class="form-group form-default">
                            <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" required=""></asp:TextBox>
                            <span class="form-bar"></span>
                            <label class="float-label">Full Name</label>
                        </div>
                        <div class="form-group form-default">
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" required=""></asp:TextBox>
                            <span class="form-bar"></span>
                            <label class="float-label">Phone Number</label>
                        </div>
                        <div class="form-group form-default">
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" MaxLength="8" required=""></asp:TextBox>
                            <span class="form-bar"></span>
                            <label class="float-label">Password</label>
                        </div>

                    </div>
                    <div class="form-material col-md-6">
                        <div class="form-group form-default">
                            <div style="height: 43px; padding-top: 23px;">
                                <div class="checkbox-fade fade-in-primary" style="margin-right: 40px;">
                                    <label class="m-0">
                                        <asp:CheckBox ID="cbMale" runat="server" OnCheckedChanged="cbMale_CheckedChanged" AutoPostBack="True" />
                                        <span class="cr"><i class="cr-icon icofont icofont-ui-check txt-primary"></i></span>
                                        <span class="text-inverse">Male.</span>
                                    </label>
                                </div>
                                <div class="checkbox-fade fade-in-primary">
                                    <label class="m-0">
                                        <asp:CheckBox ID="cbFemale" runat="server" OnCheckedChanged="cbFemale_CheckedChanged" AutoPostBack="True" />
                                        <span class="cr"><i class="cr-icon icofont icofont-ui-check txt-primary"></i></span>
                                        <span class="text-inverse">Female.</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group form-default">
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" required=""></asp:TextBox>
                            <span class="form-bar"></span>
                            <label class="float-label">Full Address</label>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label d-flex align-items-center" required="">Is Admin</label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="ddlIsAdmin" runat="server" CssClass="form-control" Style="border-bottom: 1px solid #ccc">
                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <% if (Request.QueryString["action"] != "add")
                            { %>
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label d-flex align-items-center" required="">Is Active</label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="ddlIsActive" runat="server" CssClass="form-control" Style="border-bottom: 1px solid #ccc">
                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <% } %>
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label d-flex align-items-center" required="">Date of birth</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="txtDob" runat="server" CssClass="form-control" TextMode="Date" required=""></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label pr-0">Upload File</label>
                            <div class="col-sm-9">
                                <% if (Request.QueryString["action"] == "add")
                                    { %>
                                <asp:FileUpload ID="FileUpload1" runat="server" onchange="readURL(this);" class="form-control" Style="padding-top: 5px;" />
                                <% }
                                    else
                                    { %>
                                <asp:FileUpload ID="FileUpload2" runat="server" onchange="readURL(this);" class="form-control" Style="padding-top: 5px;" required="" />
                                <% } %>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="d-flex justify-content-center" style="padding-bottom: 20px;">
                    <asp:Button ID="Button1" runat="server" Text="Update" CssClass="btn btn-info waves-effect waves-light" Width="200" OnClick="Button1_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

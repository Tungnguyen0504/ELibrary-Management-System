<%@ Page Title="" Language="C#" MasterPageFile="~/sidebar.master" AutoEventWireup="true" CodeBehind="MyProfile.aspx.cs" Inherits="ELibrary_Management.my_profile" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" style="width: 100%;">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <h5>My Account</h5>
                    <!--<span>Add class of <code>.form-control</code> with <code>&lt;input&gt;</code> tag</span>-->
                </div>
                <div class="form-material col-md-12 text-center mt-4">
                    <asp:Image ID="Image2" CssClass="imgview" runat="server" Style="width: 125px; height: 125px; border-radius: 5px;" />
                </div>
                <div class="card-block d-flex">
                    <div class="form-material col-md-6">
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label d-flex align-items-center" required="">User ID</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="txtUserNumberID" runat="server" CssClass="form-control" ReadOnly></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group form-default">
                            <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" required=""></asp:TextBox>
                            <span class="form-bar"></span>
                            <label class="float-label">Full Name</label>
                        </div>
                        <div class="form-group form-default">
                            <asp:TextBox ID="txtDob" runat="server" CssClass="form-control" TextMode="Date" required=""></asp:TextBox>
                            <span class="form-bar"></span>
                            <label class="float-label">Date of Birth</label>
                        </div>
                        <div class="form-group form-default">
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" required=""></asp:TextBox>
                            <span class="form-bar"></span>
                            <label class="float-label">Phone Number</label>
                        </div>
                    </div>
                    <div class="form-material col-md-6">
                        <div class="form-group form-default">
                            <div style="height: 43px; padding-top: 15px;">
                                <div class="checkbox-fade fade-in-primary">
                                    <label>
                                        <asp:CheckBox ID="cbMale" runat="server" OnCheckedChanged="cbMale_CheckedChanged" AutoPostBack="True" />
                                        <span class="cr"><i class="cr-icon icofont icofont-ui-check txt-primary"></i></span>
                                        <span class="text-inverse">Male.</span>
                                    </label>
                                </div>
                                <div class="checkbox-fade fade-in-primary">
                                    <label>
                                        <asp:CheckBox ID="cbFemale" runat="server" OnCheckedChanged="cbFemale_CheckedChanged" AutoPostBack="True" />
                                        <span class="cr"><i class="cr-icon icofont icofont-ui-check txt-primary"></i></span>
                                        <span class="text-inverse">Female.</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group form-default">
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" required=""></asp:TextBox>
                            <span class="form-bar"></span>
                            <label class="float-label">Email</label>
                        </div>
                        <div class="form-group form-default">
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" required=""></asp:TextBox>
                            <span class="form-bar"></span>
                            <label class="float-label">Full Address</label>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label pr-0">Upload File</label>
                            <div class="col-sm-9">
                                <asp:FileUpload ID="FileUpload1" runat="server" onchange="readURL(this);" class="form-control" Style="padding-top: 5px;" />
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

    <div class="row" style="width: 100%;">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <h5>Book Issuing</h5>
                    <!--<span>Add class of <code>.form-control</code> with <code>&lt;input&gt;</code> tag</span>-->
                </div>
                <div class="card-block" style="padding: 20px 150px">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table-striped table-bordered table-hover table-responsive" HorizontalAlign="Center" Style="vertical-align: middle; text-align: center;" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:TemplateField HeaderText="Book Image">
                                <ItemTemplate>
                                    <div class="text-left text-truncate">
                                        <a href="ViewBookDetail.aspx?id=<%# Eval("BookID") %>">
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "../img/book_inventory/" + Eval("BookImage") %>' Style="width: 75px; height: 95px; margin-right: 10px;" />
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("BookName") %>'></asp:Label>
                                            </a>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="BorrowedDate" DataFormatString="{0:dd, MMM yyyy}" HeaderText="Borrowed Date" />
                            <asp:BoundField DataField="DueDate" DataFormatString="{0:dd, MMM yyyy}" HeaderText="Due Date" />
                            <asp:TemplateField HeaderText="Returned Date">
                                <ItemTemplate>
                                    <div>
                                        <%# Eval("ReturnDate").ToString().Equals("") ? "<p class='text-primary mb-0' style='font-size: 14px;'>Not yet</p>" : Eval("ReturnDate", "{0:dd, MMM yyyy}") %>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <style>
                                        .status label {
                                            font-size: 100%;
                                            padding: 5px 8px;
                                        }
                                    </style>
                                    <div class="status">
                                        <%# Convert.ToInt32(Eval("Status").ToString()) == 1 ? "<label class='label label-success'>Returned</label>" : Convert.ToInt32(Eval("Status").ToString()) == 0 ? "<label class='label label-primary'>Borrowing</label>":"<label class='label label-danger'>Fined</label>" %>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                    <asp:Label ID="Label1" runat="server" Style="color: red;"></asp:Label>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=GridView1.ClientID %>").dataTable();
        });
    </script>
</asp:Content>

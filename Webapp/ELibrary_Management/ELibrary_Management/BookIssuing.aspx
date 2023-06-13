<%@ Page Title="" Language="C#" MasterPageFile="~/sidebar.master" AutoEventWireup="true" CodeBehind="BookIssuing.aspx.cs" Inherits="ELibrary_Management.BookIssuing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .form-control:disabled {
            opacity: 0.8;
        }

        @media (min-width: 576px) {
            .modal-dialog {
                max-width: 850px;
            }
        }

        .title-detail {
            padding: 4px;
            position: absolute;
            left: 10px;
            top: -30px;
            border-radius: 3px;
        }
    </style>
    <div class="row" style="width: 100%;">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <h5>Book Issuing</h5>
                </div>
                <div class="card-block d-flex m-30" style="border: 1px solid #ccc; padding: 15px 10px;">
                    <div class="form-material col-md-5" style="border-right: 1px solid #ccc">
                        <div class="row">
                            <div class="col-12 flex-column p-1 text-center m-b-10">
                                <label class="bg-secondary text-white title-detail" style="padding: 5px;">Student Detail</label>
                                <asp:Image ID="Image1" runat="server" ImageUrl="img/member_img/user-blank.png" Width="125" Height="125" Style="border-radius: 5px; border: 1px solid #ccc" />
                                <div class="">
                                    <asp:Button ID="search" runat="server" Text="Search" CssClass="btn btn-info waves-effect waves-light p-0 m-t-10" Style="width: 100px; height: 30px;" OnClick="search_Click" />
                                </div>
                                <a href="#exampleModal" data-toggle="modal" class="pos-absolute font-italic text-primary" style="bottom: 0; left: 7px;"><i class="fas fa-search m-r-5"></i>Lookup</a>

                                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">User List</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <asp:GridView ID="gvUserLookup" class="table text-center" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center" CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="true" EmptyDataText="Not found record">
                                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" VerticalAlign="Middle" />
                                                    <Columns>

                                                        <asp:BoundField HeaderText="UserID" DataField="UserID" />
                                                        <asp:BoundField HeaderText="Full Name" DataField="FullName" />
                                                        <asp:BoundField HeaderText="NumberID" DataField="UserNumberID" />
                                                        <asp:TemplateField HeaderText="Sex">
                                                            <ItemTemplate>
                                                                <div class="status">
                                                                    <%# Convert.ToInt32(Eval("Sex").ToString()) == 1 ? "Female" : "Male" %>
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField HeaderText="Email" DataField="Email" />
                                                        <asp:BoundField HeaderText="Phone" DataField="Phone" />

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
                                            </div>
                                            <div class="modal-footer">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-6 p-2">
                                <div class="form-group form-default">
                                    <asp:TextBox ID="txtNumberID" runat="server" class="form-control" required=""></asp:TextBox>
                                    <span class="form-bar"></span>
                                    <label class="float-label">Student Number ID</label>
                                </div>
                                <div class="form-group form-default form-static-label">
                                    <asp:TextBox ID="txtUserID" runat="server" class="form-control" required="" disabled></asp:TextBox>
                                    <span class="form-bar"></span>
                                    <label class="float-label">User ID</label>
                                </div>
                                <div class="form-group form-default form-static-label">
                                    <asp:TextBox ID="txtFullName" runat="server" class="form-control" required="" disabled></asp:TextBox>
                                    <span class="form-bar"></span>
                                    <label class="float-label">Full Name</label>
                                </div>
                            </div>
                            <div class="col-md-6 p-2">
                                <div class="form-group form-default form-static-label">
                                    <asp:TextBox ID="txtEmail" runat="server" class="form-control" required="" disabled></asp:TextBox>
                                    <span class="form-bar"></span>
                                    <label class="float-label">Email</label>
                                </div>
                                <div class="form-group form-default form-static-label">
                                    <asp:TextBox ID="txtPhone" runat="server" class="form-control" required="" disabled></asp:TextBox>
                                    <span class="form-bar"></span>
                                    <label class="float-label">Phone</label>
                                </div>
                                <div class="form-group form-default form-static-label">
                                    <asp:TextBox ID="txtDob" runat="server" class="form-control" required="" disabled></asp:TextBox>
                                    <span class="form-bar"></span>
                                    <label class="float-label">Date of Birth</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%-- <style>
                        #ContentPlaceHolder1_ContentPlaceHolder1_GridView1_length {
                            display: none;
                        }

                        #ContentPlaceHolder1_ContentPlaceHolder1_GridView1_filter {
                            display: none;
                        }
                    </style>--%>
                    <div class="col-md-7">
                        <div class="col-12 text-center m-b-20 m-t-30">
                            <h3>Issued Book List</h3>
                        </div>
                        <asp:GridView ID="GridView1" class="table text-center" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center" CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="true" EmptyDataText="Not found record">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" VerticalAlign="Middle" />
                            <Columns>

                                <asp:BoundField DataField="BookID" HeaderText="BookID" />
                                <asp:BoundField DataField="BookName" HeaderText="Book Name" ItemStyle-CssClass="text-left" />
                                <asp:BoundField DataField="BorrowedDate" DataFormatString="{0:dd, MMM yyyy}" HeaderText="BorrowedDate" />
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
                    </div>
                </div>

                <style>
                    .lable-additem {
                        justify-content: end;
                        align-items: end !important;
                    }

                    .input-additem {
                        height: 30px !important;
                    }

                    .add-item .form-group {
                        padding-top: 15px;
                    }
                </style>
                <div class="card-block flex-column m-30" style="border: 1px solid #ccc; padding: 15px 10px;">
                    <div class="row m-0 add-item">
                        <div class="col-md-4">
                            <div class="form-group row">
                                <label class="bg-secondary text-white title-detail" style="padding: 5px;">Add Items</label>
                                <label class="lable-additem col-sm-4 col-form-label d-flex align-items-center">BookID :</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtBookID" runat="server" CssClass="input-additem form-control"></asp:TextBox>
                                </div>

                                <%--modal book--%>
                                <a href="#exampleModal1" data-toggle="modal" class="pos-absolute font-italic text-primary" style="bottom: 0; left: 15%;"><i class="fas fa-search m-r-5"></i>Lookup</a>

                                <div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel1">Book List</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <asp:GridView ID="GridView3" class="table text-center" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center" CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="true" EmptyDataText="Not found record">
                                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" VerticalAlign="Middle" />
                                                    <Columns>

                                                        <asp:BoundField HeaderText="Book ID" DataField="BookID" />
                                                         <asp:BoundField HeaderText="Book Name" DataField="BookName" />
                                                         <asp:BoundField HeaderText="Author Name" DataField="AuthorName" />
                                                         <asp:TemplateField HeaderText="Available">
                                                             <ItemTemplate>
                                                                 <%# Convert.ToInt32(Eval("Available").ToString()) > 0? "<label class='label label-success'>True</label>" : "<label class='label label-danger'>False</label>" %>
                                                             </ItemTemplate>
                                                         </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Can Borrow?">
                                                             <ItemTemplate>
                                                                 <%# Convert.ToInt32(Eval("CanBorrow").ToString()) == 1? "<label class='label label-success'>True</label>" : "<label class='label label-danger'>False</label>" %>
                                                             </ItemTemplate>
                                                         </asp:TemplateField>
                                                         <asp:BoundField HeaderText="Publish Date" DataField="PublishDate" DataFormatString="{0:dd, MMM yyyy}" />

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
                                            </div>
                                            <div class="modal-footer">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group row">
                                <label class="lable-additem col-sm-4 col-form-label d-flex align-items-center">Borrow Date :</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtBorrowDate" runat="server" CssClass="input-additem form-control" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group row">
                                <label class="lable-additem col-sm-4 col-form-label d-flex align-items-center">Due Date :</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtDueDate" runat="server" CssClass="input-additem form-control" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group row">
                                <label class="lable-additem col-sm-4 col-form-label d-flex align-items-center">Total :</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtTotal" runat="server" CssClass="input-additem form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 text-center">
                            <asp:Button ID="add" runat="server" Text="Add" CssClass="btn btn-info waves-effect waves-light p-0 m-t-10" Style="width: 130px; height: 38px;" OnClick="add_Click" />
                        </div>
                    </div>
                    <div style="height: 320px; overflow: auto">
                        <asp:GridView ID="GridView2" class="table text-center" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center" CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True" EmptyDataText="Not found record">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" VerticalAlign="Middle" />
                            <Columns>

                                <asp:BoundField DataField="BookID" HeaderText="Book ID" />
                                <asp:BoundField DataField="BookName" HeaderText="Book Name" />
                                <asp:BoundField DataField="Total" HeaderText="Total" />
                                <asp:BoundField DataField="BorrowDate" HeaderText="Borrow Date" />
                                <asp:BoundField DataField="DueDate" HeaderText="Due Date" />
                                <asp:BoundField DataField="BookCost" HeaderText="Book Cost" />

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
                    </div>
                    <div class="row justify-content-end m-0">
                        <style>
                            .action {
                                height: 35px;
                                padding: 0 30px;
                                margin-right: 35px;
                            }
                        </style>
                        <asp:Button ID="btnIssue" runat="server" Text="Issue" CssClass="action btn btn-info waves-effect waves-light" OnClick="btnIssue_Click" />
                        <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="action btn btn-danger waves-effect waves-light" OnClick="btnReset_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
     <script type="text/javascript">
         $(document).ready(function () {
             $("#<%=gvUserLookup.ClientID %>").dataTable({
                 lengthMenu: [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
                 stateSave: true
            });
        });
     </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=GridView1.ClientID %>").dataTable({
                lengthMenu: [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]]
            });
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=GridView2.ClientID %>").dataTable({
                lengthMenu: [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]]
            });
        });
    </script>
 <script type="text/javascript">
     $(document).ready(function () {
         $("#<%=GridView3.ClientID %>").dataTable({
                lengthMenu: [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]]
            });
        });
 </script>
   
</asp:Content>

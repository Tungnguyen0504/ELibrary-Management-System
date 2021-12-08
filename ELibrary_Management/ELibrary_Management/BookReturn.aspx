<%@ Page Title="" Language="C#" MasterPageFile="~/sidebar.master" AutoEventWireup="true" CodeBehind="BookReturn.aspx.cs" Inherits="ELibrary_Management.BookReturn" %>

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

        .reissue-input .form-group .form-control {
            height: 30px;
            width: 80%;
        }

        .reissue-input .form-group .btn {
            padding: 0;
            width: 135px;
            height: 37px;
        }
    </style>
    <div class="row" style="width: 100%;">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <h5>Return Book / Re-issue</h5>
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
                    <div class="col-12">
                    <div class="row m-b-20 add-item">
                        <div class="col-md-4">
                            <div class="form-group row">
                                <label class="bg-secondary text-white title-detail" style="padding: 5px;">Return Book</label>
                                <label class="lable-additem col-sm-4 col-form-label d-flex align-items-center">Book Issue ID :</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtBookIssueID2" runat="server" CssClass="input-additem form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group row">
                                <label class="lable-additem col-sm-4 col-form-label d-flex align-items-center">Return Date :</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtReturnDate" runat="server" CssClass="input-additem form-control" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 d-flex justify-content-center align-items-center">
                            <asp:Button ID="add" runat="server" Text="Add" CssClass="btn btn-info waves-effect waves-light p-0" Style="width: 130px; height: 30px;" OnClick="add_Click" />
                        </div>
                    </div>
                        </div>
                    <style>
                        .table td, .table th {
                            text-align: center;
                        }
                    </style>
                    <div style="height: 250px; overflow: auto">
                        <asp:GridView ID="GridView2" class="table text-center" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center" CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True" EmptyDataText="Not found record">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" VerticalAlign="Middle" />
                            <Columns>

                                <asp:BoundField DataField="UserID" HeaderText="Student ID" />
                                <asp:BoundField DataField="BookIssueID" HeaderText="Book Issue ID" />
                                <asp:BoundField DataField="BookName" HeaderText="Book Name" />
                                <asp:BoundField DataField="BorrowedDate" DataFormatString="{0:dd, MMM yyyy}" HeaderText="Borrowed Date" />
                                <asp:BoundField DataField="DueDate" DataFormatString="{0:dd, MMM yyyy}" HeaderText="Due Date" />
                                <asp:BoundField DataField="Now" DataFormatString="{0:dd, MMM yyyy}" HeaderText="Return" />
                                <asp:TemplateField HeaderText="Penalty Status">
                                    <ItemTemplate>
                                        <style>
                                            .status label {
                                                font-size: 100%;
                                                padding: 5px 8px;
                                            }
                                        </style>
                                        <div class="status">
                                            <%# (DateTime.Now - Convert.ToDateTime(Eval("DueDate"))).Days > 0 ? "<label class='label label-danger'>Yes</label>" : "<label class='label label-primary'>No</label>" %>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Fine">
                                    <ItemTemplate>
                                        <label><%# (DateTime.Now - Convert.ToDateTime(Eval("DueDate"))).Days > 0 ? "$" + (DateTime.Now - Convert.ToDateTime(Eval("DueDate"))).Days * 2 : "$0" %></label>
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
                    <div class="row justify-content-end m-0">
                        <style>
                            .action {
                                height: 35px;
                                padding: 0 30px;
                                margin-right: 35px;
                                width: 143px;
                            }
                        </style>
                        <asp:Button ID="btnReturn" runat="server" Text="Return Book" CssClass="action btn btn-info waves-effect waves-light" OnClick="btnReturn_Click" />
                        <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="action btn btn-danger waves-effect waves-light" OnClick="btnReset_Click" />
                    </div>
                </div>

                <div class="card-block d-flex m-30" style="border: 1px solid #ccc; padding: 15px 10px;">
                    <div class="col-12">
                        <div class="row reissue-input">
                            <div class="col-md-4 p-l-20 p-r-20 p-t-25">
                                <div class="form-group row">
                                    <label class="bg-secondary text-white title-detail" style="padding: 5px;">Re-issue Book</label>
                                    <label class="lable-additem col-sm-4 col-form-label d-flex align-items-center">BookIssue ID :</label>
                                    <div class="d-flex pos-absolute align-items-center font-italic text-primary" style="right: -15px; top: 23px; z-index: 999; cursor: pointer;">
                                        <i class="fas fa-search"></i><asp:Button ID="search" CssClass="btn font-italic text-primary bg-transparent border-0 " runat="server" Text="Search" OnClick="search_Click" style="width: 55px; height: 35px;" />
                                    </div>

                                    <asp:TextBox ID="txtUserID" runat="server" Visible="false"></asp:TextBox>
                                    <asp:TextBox ID="txtBookID" runat="server" Visible="false"></asp:TextBox>

                                    <div class="col-sm-8 p-l-0">
                                        <asp:TextBox ID="txtBookIssueID" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="lable-additem col-sm-4 col-form-label d-flex align-items-center">Book name :</label>
                                    <div class="col-sm-8 p-l-0">
                                        <asp:TextBox ID="txtBookName" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="lable-additem col-sm-4 col-form-label d-flex align-items-center">Borrow date :</label>
                                    <div class="col-sm-8 p-l-0">
                                        <asp:TextBox ID="txtBorrowDate" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 p-l-20 p-r-20 p-t-25">
                                <div class="form-group row">
                                    <label class="lable-additem col-sm-4 col-form-label d-flex align-items-center">Number ID :</label>
                                    <div class="col-sm-8 p-l-0">
                                        <asp:TextBox ID="txtNumID" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="lable-additem col-sm-4 col-form-label d-flex align-items-center">Full name :</label>
                                    <div class="col-sm-8 p-l-0">
                                        <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="lable-additem col-sm-4 col-form-label d-flex align-items-center">Returned date:</label>
                                    <div class="col-sm-8 p-l-0">
                                        <asp:TextBox ID="txtReturnedDate" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 p-l-20 p-r-20 p-t-20">
                                <div class="form-group row">
                                    <label class="lable-additem col-sm-4 col-form-label d-flex align-items-center">Due date :</label>
                                    <div class="col-sm-8 p-l-0">
                                        <asp:TextBox ID="txtDueDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="lable-additem col-sm-4 col-form-label d-flex align-items-center">Total :</label>
                                    <div class="col-sm-8 p-l-0">
                                        <asp:TextBox ID="txtTotal" runat="server" CssClass="form-control" MaxLength="5"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group d-flex align-items-center justify-content-center" style="height: 55%;">
                                    <asp:Button ID="Button1" class="btn btn-primary waves-effect waves-light m-r-10" runat="server" Text="Re-Borrow Book" OnClick="Button1_Click"/>
                                    <asp:Button ID="Button2" class="btn btn-danger waves-effect waves-light" runat="server" Text="Reset" OnClick="Button2_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

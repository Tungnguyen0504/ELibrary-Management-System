<%@ Page Title="" Language="C#" MasterPageFile="~/sidebar.master" AutoEventWireup="true" CodeBehind="ReservationBook.aspx.cs" Inherits="ELibrary_Management.ReservationBook" %>

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
                <style>
                    .input-additem {
                        height: 30px !important;
                    }

                    .add-item .form-group {
                        padding-top: 15px;
                    }
                </style>
                <div class="card-block flex-column m-30" style="border: 1px solid #ccc; padding: 15px 10px;">
                    <div class="row m-0 add-item" style="height: 0;">
                        <div class="col-md-4">
                            <div class="form-group row">
                                <label class="bg-secondary text-white title-detail" style="padding: 5px;">Reserve Book</label>
                            </div>
                        </div>
                    </div>
                    <div style="overflow: auto; margin-top: 20px;">
                        <asp:GridView ID="GridView1" class="table" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center" CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True" EmptyDataText="Not found record" OnRowCommand="GridView1_RowCommand">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" VerticalAlign="Middle" />
                            <Columns>

                                <asp:BoundField DataField="ReservationID" HeaderText="#" />
                                <asp:BoundField DataField="FullName" HeaderText="Student Name" />
                                <asp:BoundField DataField="UserNumberID" HeaderText="Student ID" />
                                <asp:BoundField DataField="BookName" HeaderText="Book Name" />
                                <asp:BoundField DataField="Date" HeaderText="Reserve Date" DataFormatString="{0:dd, MMM yyyy}" />
                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <style>
                                            .action-list label {
                                                font-size: 14px;
                                                padding: 4px 15px;
                                                border-radius: 15px;
                                            }
                                        </style>
                                        <div class="action-list">
                                            <%# Convert.ToInt32(Eval("Status").ToString()) == 1 ? "<label class='label label-success'>Approved</label>" : Convert.ToInt32(Eval("Status").ToString()) == 0 ? "<label class='label label-warning'>Pending</label>" : "<label class='label label-danger'>Rejected</label>" %>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Detail">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnDetail" CommandName="detail" CommandArgument='<%# Container.DataItemIndex %>' runat="server"><i class="fas fa-info-circle" style="color: orange; font-size: 26px; margin: 0 5px;"></i></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Action" ItemStyle-Width="200">
                                    <ItemTemplate>
                                        <div class="d-flex justify-content-center m-auto">
                                            <%-- <asp:Button ID="btnAccept" runat="server" Text="Accept" CssClass="btn btn-success waves-effect waves-light" Style="margin-right: 10px; padding: 7px 19px;" Visible='<%# Convert.ToInt32(Eval("Status")) == 0 ? true : false %>' OnClick="btnAccept_Click" />
                                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-danger waves-effect waves-light" Style="padding: 7px 19px;" Visible='<%# Convert.ToInt32(Eval("Status")) == 0 ? true : false %>' OnClick="btnCancel_Click" />--%>
                                            <asp:LinkButton ID="btnApprove" CssClass="btn btn-success waves-effect waves-light" CommandName="approve" CommandArgument='<%# Container.DataItemIndex %>' Style="margin-right: 10px; padding: 7px; width: 65px;" runat="server" Visible='<%# Convert.ToInt32(Eval("Status")) == 0 ? true : false %>'>Approve</asp:LinkButton>
                                            <asp:LinkButton ID="btnReject" CssClass="btn btn-danger waves-effect waves-light" CommandName="reject" CommandArgument='<%# Container.DataItemIndex %>' Style="padding: 7px; width: 65px;" runat="server" Visible='<%# Convert.ToInt32(Eval("Status")) == 0 ? true : false %>'>Reject</asp:LinkButton>
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
                            <SortedAscendingHeaderStyle BackColor="#007DBB" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>

                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" style="width: fit-content;">
                                <div class="modal-content" style="width: 600px;">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Reserve Detail</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">

                                        <div class="card mb-3">
                                            <div class="d-flex align-items-center">
                                                <div class="col-md-4">
                                                    <asp:Image ID="Image2" runat="server" Width="155" Height="185" />
                                                </div>
                                                <div class="col-md-8 p-0">
                                                    <div class="card-body">
                                                        <h5 class="card-title text-truncate m-b-5">
                                                            <asp:Label ID="lblBookName" runat="server" Text="Label"></asp:Label>
                                                        </h5>
                                                        <p class="card-text mb-0" style="font-size: 14px;">
                                                            Genre - <asp:Label ID="lblGenre" runat="server" Text="Label"></asp:Label>
                                                            <br />
                                                            Author - <asp:Label ID="lblAuthor" runat="server" Text="Label"></asp:Label>
                                                            <br />
                                                            Book cost - <asp:Label ID="lblCost" runat="server" Text="Label"></asp:Label>
                                                            <br />
                                                            Available - <asp:Label ID="lblAvailable" runat="server" Text="Label"></asp:Label>
                                                            <br />
                                                            Date Reserve - <asp:Label ID="lblDate" runat="server" Text="Label"></asp:Label>
                                                            <br />
                                                            Status - <asp:Label ID="lblSt" runat="server" Text="Label"></asp:Label>
                                                        </p>
                                                        <p class="card-text mb-0">
                                                            <div style="font-size: 20px; color: darkgoldenrod;">
                                                                <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                                                            </div>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card-block flex-column m-30" style="border: 1px solid #ccc; padding: 15px 10px;">
                    <div class="row m-0 add-item">
                        <div class="col-md-4">
                            <div class="form-group row">
                                <label class="bg-secondary text-white title-detail" style="padding: 5px;">Add Reserve Book</label>
                                <label class="lable-additem col-sm-4 col-form-label d-flex align-items-center">Student ID:</label>
                                <div class="col-sm-8 p-l-0 p-r-35">
                                    <asp:TextBox ID="txtNumberID" runat="server" CssClass="input-additem form-control" required=""></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group row">
                                <label class="lable-additem col-sm-4 col-form-label d-flex align-items-center">Book ID:</label>
                                <div class="col-sm-8 p-l-0 p-r-35">
                                    <asp:TextBox ID="txtBookID" runat="server" CssClass="input-additem form-control" required=""></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group row">
                                <label class="lable-additem col-sm-4 col-form-label d-flex align-items-center">Reserve Date:</label>
                                <div class="col-sm-8 p-l-0 p-r-35">
                                    <asp:TextBox ID="txtDate" runat="server" CssClass="input-additem form-control" TextMode="Date" Enabled="false"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group row">
                                <label class="lable-additem col-sm-4 col-form-label d-flex align-items-center">Quantity:</label>
                                <div class="col-sm-8 p-l-0 p-r-35">
                                    <asp:TextBox ID="txtQty" runat="server" CssClass="input-additem form-control" Text="1" Enabled="false"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 text-center">
                            <asp:Button ID="add" runat="server" Text="Add" CssClass="btn btn-info waves-effect waves-light p-0 m-t-10" Style="width: 130px; height: 38px;" OnClick="add_Click" />
                        </div>
                    </div>
                    <div style="height: 250px; overflow: auto; margin-top: 35px;">
                        <style>
                            .table td, .table th {
                                text-align: center;
                            }
                        </style>
                        <asp:GridView ID="GridView2" class="table" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center" CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True" EmptyDataText="Not found record">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" VerticalAlign="Middle" />
                            <Columns>

                                <asp:BoundField DataField="StudentNumberID" HeaderText="Student Number ID" />
                                <asp:BoundField DataField="StudentName" HeaderText="Student Name" />
                                <asp:BoundField DataField="BookID" HeaderText="Book ID" />
                                <asp:BoundField DataField="BookName" HeaderText="Book Name" />
                                <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                                <asp:BoundField DataField="ReserveDate" HeaderText="Reserve Date" />

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
                        <asp:Button ID="btnReserve" runat="server" Text="Reserve" CssClass="action btn btn-info waves-effect waves-light" OnClick="btnReserve_Click" />
                        <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="action btn btn-danger waves-effect waves-light" OnClick="btnReset_Click" />
                    </div>
                </div>

            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=GridView1.ClientID %>").dataTable({
                lengthMenu: [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]]
            });
        });
        function ShowPopup() {
            $('#exampleModal').modal('show');
        }
    </script>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/sidebar.master" AutoEventWireup="true" CodeBehind="ManageBookIssue.aspx.cs" Inherits="ELibrary_Management.bookIssueManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h5>Borrowed / Returned Management</h5>
                <span>Information and Library Center</span>

            </div>

            <style>
                .st-label label {
                    padding: 5px 8px;
                    font-size: 14px;
                    max-width: 87px;
                }
            </style>
            <div class="card-block table-border-style">
                <asp:GridView ID="GridView1" class="table text-center" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" VerticalAlign="Middle" />
                    <Columns>

                        <asp:BoundField DataField="UserID" HeaderText="User ID" />
                        <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                        <asp:BoundField DataField="BookID" HeaderText="Book ID" />
                        <asp:TemplateField HeaderText="Book Name">
                            <ItemTemplate>
                                <span><%# Eval("BookName") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="BorrowedDate" DataFormatString="{0:dd, MMM yyyy}" HeaderText="Borrowed Date" />
                        <asp:BoundField DataField="DueDate" DataFormatString="{0:dd, MMM yyyy}" HeaderText="Due Date" />
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <itemtemplate>
                                    <style>
                                        .status label {
                                            font-size: 100%;
                                            padding: 5px 8px;
                                        }
                                    </style>
                                    <div class="status">
                                        <%# Convert.ToInt32(Eval("Status").ToString()) == 1 ? "<label class='label label-success'>Returned</label>" : Convert.ToInt32(Eval("Status").ToString()) == 0 ? "<label class='label label-primary'>Borrowing</label>":"<label class='label label-danger'>Fined</label>" %>
                                    </div>
                                </itemtemplate>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <div>
                                    <a href="ViewDetailBorrowedReturnedBook.aspx?id=<%# Eval("BookIssueID") %>" title="Detail"><i class="fas fa-info-circle" style="color: orange; font-size: 26px; margin: 0 5px;"></i></a>
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
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=GridView1.ClientID %>").dataTable({
                "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                "autoWidth": false
            });
        });
    </script>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/sidebar.master" AutoEventWireup="true" CodeBehind="ManageBookInventory.aspx.cs" Inherits="ELibrary_Management.book_inventory" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h5>Book Inventory</h5>
                <span>Information and Library Center</span>
                <div class="card-header-right">
                    <a href="AddEditBookInventory.aspx?action=add" class="btn btn-primary waves-effect waves-light" style="font-size: 18px; padding: 2px 15px; font-size: 18px;"><i class="fas fa-book-open" style="margin: 0; margin-right: 10px; font-size: 18px; color: white;"></i>Add new book</a>
                </div>
            </div>

            <div class="card-block table-border-style">
                <asp:GridView ID="GridView1" class="table text-center" runat="server" AutoGenerateColumns="False" Style="width: 100%;" HorizontalAlign="Center" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" OnRowCommand="GridView1_RowCommand">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" VerticalAlign="Middle" />
                    <Columns>
                        <asp:BoundField DataField="BookID" HeaderText="#" />
                        <asp:TemplateField HeaderText="Book Name" ItemStyle-Width="300" >
                            <ItemTemplate>
                                <div class="text-left d-flex align-items-center">
                                    <div>
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "../img/book_inventory/" + Eval("BookImage") %>' Style="width: 75px; height: 95px; margin-right: 15px;" />
                                    </div>
                                    <div style="width: 250px;">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("BookName") %>'></asp:Label>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Genre">
                            <ItemTemplate>
                                <div>
                                    <%# Eval("Genre") %>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="BookCost" HeaderText="Book cost" />
                        <asp:TemplateField HeaderText="Available">
                            <ItemTemplate>
                                <%# int.Parse(Eval("Available").ToString()) <= 3 ? "<label class='label label-danger' style='font-size: 14px; padding: 5px 8px;'>"+ (Eval("Available")) +"</label>" : Eval("Available") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="PublishDate" HeaderText="Publish date" DataFormatString="{0:dd, MMM yyyy}" />
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <div>
                                    <asp:LinkButton ID="delete" runat="server" CommandName="del" CommandArgument='<%# Container.DataItemIndex %>' OnClientClick="return conFunction(this);" tittle="Delete"><i class="fas fa-trash-alt" style="color: red; font-size: 24px; margin: 0 5px;"></i></asp:LinkButton>
                                    &nbsp;&nbsp;
                                    <a href="AddEditBookInventory.aspx?id=<%# Eval("BookId") %>&action=edit" title="Edit"><i class="fas fa-edit" style="color: orange; font-size: 26px; margin: 0 5px;"></i></a>
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
                lengthMenu: [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]]
            });
        });
    </script>

    <script type="text/javascript">
        var object = { status: false, ele: null };
        function conFunction(ev) {
            if (object.status) { return true; }

            swal({
                title: "Are you sure?",
                text: "Your will not be able to recover this book!",
                type: "warning",
                showCancelButton: true,
                confirmButtonClass: "btn-danger",
                confirmButtonText: "Delete",
                closeOnConfirm: false
            },
                function () {
                    object.status = true;
                    object.ele = ev;
                    object.ele.click();
                });

            return object.status;
        };
    </script>
</asp:Content>

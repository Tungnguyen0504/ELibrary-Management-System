<%@ Page Title="" Language="C#" MasterPageFile="~/sidebar.master" AutoEventWireup="true" CodeBehind="ManagePublisher.aspx.cs" Inherits="ELibrary_Management.ManagePublisher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h5>Manage Author / Publisher</h5>
                <span>Information and Library Center</span>
                <div class="card-header-right">
                    <a href="ManagePublisher.aspx" class="btn btn-primary waves-effect waves-light m-r-40" style="font-size: 18px; padding: 2px 15px; font-size: 18px;"><i class="fas fa-book-open" style="margin: 0; margin-right: 10px; font-size: 18px; color: white;"></i>Add new author</a>
                </div>
            </div>
            <div class="row w-100">
                <div class="col-md-6" style="border-right: 1px solid; padding: 25px 130px;">
                    <div class="col-md-12 text-center m-b-15">
                        <h3>Publisher Detail</h3>
                        <img src="img/book_inventory/book-picture.png" style="width: 115px; border: 1px solid #ccc; border-radius: 5px;" />
                    </div>
                    <div class="form-material flex-column">
                        <div class="form-group form-default">
                            <asp:TextBox ID="TextBox1" runat="server" class="form-control form-static-label" ReadOnly=""></asp:TextBox>
                            <span class="form-bar"></span>
                            <% if(Request.QueryString["action"] != "edit"){ %>
                            <label class="float-label">Publisher ID</label>
                            <% } %>
                        </div>
                        <div class="form-group form-default">
                            <asp:TextBox ID="TextBox2" runat="server" class="form-control" required=""></asp:TextBox>
                            <span class="form-bar"></span>
                            <label class="float-label">Publisher Name</label>
                        </div>
                    </div>
                    <div class="col-md-12 text-center">
                        <% if (Request.QueryString["action"] == null)
                            { %>
                        <asp:Button ID="Button1" runat="server" Text="Add" CssClass="btn btn-info waves-effect waves-light" Width="200" OnClick="Button1_Click" />
                        <% } %>
                        <% if (Request.QueryString["action"] == "edit")
                            { %>
                        <asp:Button ID="Button2" runat="server" Text="Update" CssClass="btn btn-info waves-effect waves-light" Width="200" OnClick="Button2_Click" />
                        <% } %>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card-block table-border-style">
                        <asp:GridView ID="GridView1" class="table text-center" runat="server" AutoGenerateColumns="False" Style="width: 100%;" HorizontalAlign="Center" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" OnRowCommand="GridView1_RowCommand">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" VerticalAlign="Middle" />
                            <Columns>

                                <asp:BoundField HeaderText="Publisher ID" DataField="PublisherID" />
                                <asp:BoundField HeaderText="Publisher Name" DataField="PublisherName" />
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <div>
                                            <asp:LinkButton ID="delete" runat="server" CommandName="del" CommandArgument='<%# Container.DataItemIndex %>' OnClientClick="return conFunction(this);" tittle="Delete"><i class="fas fa-trash-alt" style="color: red; font-size: 24px; margin: 0 5px;"></i></asp:LinkButton>
                                            &nbsp;&nbsp;
                                    <a href="ManagePublisher.aspx?id=<%# Eval("PublisherID") %>&action=edit" title="Edit"><i class="fas fa-edit" style="color: orange; font-size: 26px; margin: 0 5px;"></i></a>
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
                text: "Your will not be able to recover this publisher!",
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

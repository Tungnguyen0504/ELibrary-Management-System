using AuctionWindow.DAL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELibrary_Management
{
    public partial class book_inventory : System.Web.UI.Page
    {
        static string strConn = ConfigurationManager.ConnectionStrings["DbConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null || Session["role"].Equals("user"))
                {
                    Response.Redirect("HomePage.aspx");
                }
                else
                {
                    if (!IsPostBack)
                    {
                        dataBind();
                    }
                }
            }
            catch (Exception)
            {
            }
        }

        protected void dataBind()
        {
            Session["head"] = "Book Inventory";
            GridView1.DataSource = DAO.GetDataTable("SELECT bm.*, (SELECT AuthorName FROM dbo.Author WHERE AuthorID = bm.AuthorID) AS AuthorName, (SELECT PublisherName FROM dbo.Publisher WHERE PublisherID = bm.PublisherID) AS PublisherName\n"
                                                    + "FROM dbo.BookMaster bm");
            GridView1.DataBind();
            if (GridView1.Rows.Count > 0)
            {
                GridView1.UseAccessibleHeader = true;
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
                GridView1.FooterRow.TableSection = TableRowSection.TableFooter;
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "del")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int id = int.Parse(GridView1.Rows[rowIndex].Cells[0].Text);

                try
                {
                    SqlConnection conn = new SqlConnection(strConn);
                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();
                    }
                    SqlCommand cmd = new SqlCommand("DELETE FROM dbo.Penalty WHERE BookIssueID IN (SELECT BookIssueID FROM dbo.BookIssue WHERE BookID IN " + id + ")\n"
                    + "DELETE FROM dbo.BookIssue WHERE BookID IN " + id + "\n"
                    + "DELETE FROM dbo.Reservation WHERE BookID IN " + id + "\n"
                    + "DELETE FROM dbo.BookMaster WHERE BookID = " + id, conn);
                    DAO.UpdateTable(cmd);

                    dataBind();

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('This book has been deleted!', '', 'success');</script>");
                }
                catch (Exception ex)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>swal({ title: '" + ex.Message + "!', type: 'warning'});</script>");
                }
            }
        }
    }
}

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
    public partial class userManagement : System.Web.UI.Page
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
                        databind();
                    }
                }

            }
            catch (Exception)
            {
            }
        }

        protected void databind()
        {
            Session["head"] = "User Management";
            GridView1.DataSource = DAO.GetDataTable("SELECT * FROM dbo.[User]");
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
                    SqlCommand cmd = new SqlCommand("DELETE FROM dbo.Penalty WHERE BookIssueID IN (SELECT BookIssueID FROM dbo.BookIssue WHERE UserID IN " + id + ")\n"
                    + "DELETE FROM dbo.Reservation WHERE UserID IN " + id + "\n"
                    + "DELETE FROM dbo.BookIssue WHERE UserID IN " + id + "\n"
                    + "DELETE FROM dbo.[User] WHERE UserID = " + id, conn);
                    DAO.UpdateTable(cmd);

                    databind();

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('This user has been deleted!', '', 'success');</script>");
                }
                catch (Exception ex)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>swal({ title: '" + ex.Message + "!', type: 'warning'});</script>");
                }
            }
        }
    }
}
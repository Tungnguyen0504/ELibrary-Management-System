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
    public partial class ManagePublisher : System.Web.UI.Page
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
                        if (Request.QueryString["action"] == "edit")
                        {
                            getPublisherById();
                        }
                    }
                }
            }
            catch (Exception)
            {
            }
        }

        void getPublisherById()
        {
            SqlConnection conn = new SqlConnection(strConn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.Publisher WHERE PublisherID = " + Request.QueryString["id"], conn);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                TextBox1.Text = dr.GetValue(0).ToString();
                TextBox2.Text = dr.GetValue(1).ToString();
            }
        }

        protected void dataBind()
        {
            Session["head"] = "Manage Publisher";
            GridView1.DataSource = DAO.GetDataTable("SELECT * FROM dbo.Publisher");
            GridView1.DataBind();
            if (GridView1.Rows.Count > 0)
            {
                GridView1.UseAccessibleHeader = true;
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
                GridView1.FooterRow.TableSection = TableRowSection.TableFooter;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(strConn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }

            string query = "INSERT INTO dbo.Publisher (Publishername )\n"
            + "VALUES(N'" + TextBox2.Text + "') ";
            SqlCommand cmd = new SqlCommand(query, conn);
            DAO.UpdateTable(cmd);
            TextBox2.Text = string.Empty;
            dataBind();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Add Successful!', '', 'success')</script>");

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(strConn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }

            string query = "UPDATE dbo.Publisher SET Publishername = '" + TextBox2.Text + "' WHERE PublisherID = " + Request.QueryString["id"];
            SqlCommand cmd = new SqlCommand(query, conn);
            DAO.UpdateTable(cmd);
            TextBox1.Text = string.Empty;
            TextBox2.Text = string.Empty;
            dataBind();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Update Successful!', '', 'success')</script>");

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
                    SqlCommand cmd = new SqlCommand("DELETE FROM dbo.Penalty WHERE BookIssueID IN (SELECT BookIssueID FROM dbo.BookIssue WHERE BookID IN (SELECT BookID FROM dbo.BookMaster WHERE PublisherID IN (" + id + ")))\n"
                    + "DELETE FROM dbo.BookIssue WHERE BookID IN(SELECT BookID FROM dbo.BookMaster WHERE PublisherID IN (" + id + "))\n"
                    + "DELETE FROM dbo.Reservation WHERE BookID IN(SELECT BookID FROM dbo.BookMaster WHERE PublisherID IN ((" + id + ")))\n"
                    + "DELETE FROM dbo.BookMaster WHERE PublisherID IN (" + id + ")\n"
                    + "DELETE FROM dbo.Publisher WHERE PublisherID = (" + id + ")", conn);
                    DAO.UpdateTable(cmd);

                    dataBind();

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('This publisher has been deleted!', '', 'success');</script>");
                }
                catch (Exception ex)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>swal({ title: '" + ex.Message + "!', type: 'warning'});</script>");
                }
            }
        }
    }
}
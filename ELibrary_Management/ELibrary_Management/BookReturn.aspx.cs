using AuctionWindow.DAL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELibrary_Management
{
    public partial class BookReturn : System.Web.UI.Page
    {
        static string strConn = ConfigurationManager.ConnectionStrings["DbConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] == null || Session["role"].Equals("user"))
            {
                Response.Redirect("HomePage.aspx");
            }
            else
            {
                DateTime date = DateTime.Now;
                txtReturnDate.Text = date.ToString("yyyy-MM-dd");

                if (GridView2.DataSource == null)
                {
                    GridView2.DataSource = new string[] { };
                }
                GridView2.DataBind();
            }
        }

        protected void add_Click(object sender, EventArgs e)
        {
            databind();
        }

        protected void databind()
        {
            GridView2.DataSource = DAO.GetDataTable("SELECT *, GETDATE() AS [Now] FROM dbo.[User] u JOIN dbo.BookIssue bi\n"
            + "ON bi.UserID = u.UserID JOIN dbo.BookMaster bm ON bm.BookID = bi.BookID WHERE bi.BookIssueID = " + txtBookIssueID2.Text + "AND bi.Status = 0");
            GridView2.DataBind();

            if (GridView2.Rows.Count == 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Invalid Book Issue!', '', 'warning')</script>");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtDueDate.Text.Equals(""))
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Enter due date!', '', 'warning')</script>");
                }
                else if (txtTotal.Text.Equals(""))
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Total number cannot be empty!', '', 'warning')</script>");
                }
                else if (int.Parse(txtTotal.Text) < 1)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Total number must be greater 0 !', '', 'warning')</script>");
                }
                else
                {
                    DateTime dueDate = DateTime.ParseExact(txtDueDate.Text, "yyyy-MM-dd", CultureInfo.InvariantCulture);
                    TimeSpan d = dueDate - DateTime.Now;

                    if (d.Days < 1)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Due date is invalid!', '', 'warning')</script>");
                    }
                    else
                    {

                        SqlConnection conn = new SqlConnection(strConn);
                        if (conn.State == ConnectionState.Closed)
                        {
                            conn.Open();
                        }
                        SqlCommand cmd = new SqlCommand("INSERT INTO dbo.BookIssue ( UserID , BookID , BorrowedTotal , BorrowedDate , DueDate , Status ) \n"
                        + "VALUES('" + txtUserID.Text + "', '" + txtBookID.Text + "' , '" + txtTotal.Text + "' , '" + DateTime.Now + "' , '" + Convert.ToDateTime(txtDueDate.Text) + "' , 0)", conn);
                        DAO.UpdateTable(cmd);
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Book Issue Successful!', '', 'success')</script>");

                        txtBookIssueID.Text = string.Empty;
                        txtBookName.Text = string.Empty;
                        txtBorrowDate.Text = string.Empty;
                        txtNumID.Text = string.Empty;
                        txtFullName.Text = string.Empty;
                        txtReturnedDate.Text = string.Empty;
                        txtBookID.Text = string.Empty;
                        txtUserID.Text = string.Empty;
                    }
                }
            }
            catch (Exception)
            {

            }
        }

        protected void search_Click(object sender, EventArgs e)
        {
            if (txtBookIssueID.Text.Equals(""))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Enter Book Issue ID!', '', 'warning')</script>");
            }
            else
            {
                SqlConnection conn = new SqlConnection(strConn);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.[User] u JOIN dbo.BookIssue bi ON bi.UserID = u.UserID JOIN dbo.BookMaster bm \n"
                + "ON bm.BookID = bi.BookID WHERE bi.BookIssueID = " + txtBookIssueID.Text + " AND (bi.Status = -1 OR bi.Status = 1)", conn);
                SqlDataReader dr = cmd.ExecuteReader();
                if (!dr.HasRows)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Invalid Book Issue!', '', 'warning')</script>");
                    txtBookName.Text = string.Empty;
                    txtBorrowDate.Text = string.Empty;
                    txtNumID.Text = string.Empty;
                    txtFullName.Text = string.Empty;
                    txtReturnedDate.Text = string.Empty;
                    txtBookID.Text = string.Empty;
                    txtUserID.Text = string.Empty;
                }
                else
                {
                    while (dr.Read())
                    {
                        txtBookName.Text = dr.GetValue(21).ToString();
                        DateTime borrowedDate = Convert.ToDateTime(dr.GetValue(16).ToString());
                        DateTime returnedDate = Convert.ToDateTime(dr.GetValue(17).ToString());
                        txtBorrowDate.Text = borrowedDate.ToString("dd, MMM yyyy");
                        txtReturnedDate.Text = returnedDate.ToString("dd, MMM yyyy");
                        txtNumID.Text = dr.GetValue(2).ToString();
                        txtFullName.Text = dr.GetValue(1).ToString();
                        txtUserID.Text = dr.GetValue(0).ToString();
                        txtBookID.Text = dr.GetValue(14).ToString();
                        txtTotal.Text = "1";
                        txtTotal.Enabled = false;
                    }
                    conn.Close();
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Reset successful!', '', 'success')</script>");
            txtBookIssueID.Text = string.Empty;
            txtBookName.Text = string.Empty;
            txtBorrowDate.Text = string.Empty;
            txtNumID.Text = string.Empty;
            txtFullName.Text = string.Empty;
            txtReturnedDate.Text = string.Empty;
            txtBookID.Text = string.Empty;
            txtUserID.Text = string.Empty;
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            databind();
            if (GridView2.Rows.Count > 0)
            {
                SqlConnection conn = new SqlConnection(strConn);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.BookIssue WHERE BookIssueID = " + txtBookIssueID2.Text, conn);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    if (DateTime.Now > Convert.ToDateTime(dr.GetValue(5).ToString()))
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Error!', 'Please, first pay Penalty for Librarian!', 'warning')</script>");
                    }
                    else
                    {
                        SqlCommand cmd1 = new SqlCommand("UPDATE dbo.BookIssue \n"
                        + "SET ReturnDate = '" + DateTime.Now + "' , Status = 1 WHERE BookIssueID = " + txtBookIssueID2.Text);
                        DAO.UpdateTable(cmd1);
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Return book successful!', '', 'success')</script>");
                        txtBookIssueID2.Text = string.Empty;
                        GridView2.DataSource = new DataTable();
                        GridView2.DataBind();
                    }
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Not found!', '', 'warning')</script>");
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtBookIssueID2.Text = string.Empty;
            GridView2.DataSource = new DataTable();
            GridView2.DataBind();
        }
    }
}
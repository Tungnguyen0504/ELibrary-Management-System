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
    public partial class Penalty : System.Web.UI.Page
    {
        static string strConn = ConfigurationManager.ConnectionStrings["DbConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] == null || Session["role"].Equals("user"))
            {
                Response.Redirect("HomePage.aspx");
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(strConn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("SELECT *, (SELECT AuthorName FROM dbo.Author WHERE AuthorID = bm.AuthorID) AS Author FROM dbo.BookMaster bm JOIN dbo.BookIssue bi\n"
            + "ON bi.BookID = bm.BookID JOIN dbo.[User] u\n"
            + "ON u.UserID = bi.UserID WHERE u.UserNumberID = '" + txtNumberID.Text + "' AND bi.BookID = " + txtBookID.Text + " AND '" + DateTime.Now + "' - bi.DueDate > 0 AND bi.Status != -1", conn);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                detail.Visible = true;

                while (dr.Read())
                {
                    int bookIssueID = int.Parse(dr.GetValue(14).ToString());
                    Session["biID"] = bookIssueID;

                    lblBookName.Text = dr.GetValue(1).ToString();
                    txtAuthor.Text = dr.GetValue(34).ToString();
                    txtGenre.Text = dr.GetValue(2).ToString();
                    DateTime date = Convert.ToDateTime(dr.GetValue(5).ToString());
                    txtPublishDate.Text = date.ToString("dd, MMM yyyy");
                    txtName.Text = dr.GetValue(23).ToString();
                    txtNumID.Text = dr.GetValue(24).ToString();
                    txtEmail.Text = dr.GetValue(28).ToString();
                    txtPhone.Text = dr.GetValue(27).ToString();
                    txtSt.Text = "Yes";
                    TimeSpan s = DateTime.Now - Convert.ToDateTime(dr.GetValue(19).ToString());
                    txtAmmount.Text = (s.Days * 2).ToString();
                    DateTime d1 = Convert.ToDateTime(dr.GetValue(18).ToString());
                    DateTime d2 = Convert.ToDateTime(dr.GetValue(19).ToString());
                    txtBorrowDate.Text = d1.ToString("dd, MMM yyyy");
                    txtDueDate.Text = d2.ToString("dd, MMM yyyy");

                    Image1.ImageUrl = "img/book_inventory/" + dr.GetValue(12).ToString();
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Invalid!', '', 'error')</script>");
            }
        }

        protected bool checkStudentNumberID()
        {
            SqlConnection conn = new SqlConnection(strConn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.BookIssue bi JOIN dbo.[User] u ON u.UserID = bi.UserID WHERE u.UserNumberID = " + txtNumberID.Text, conn);
            SqlDataReader dr = cmd.ExecuteReader();
            if(dr.HasRows)
            {
                return true;
            } else
            {
                return false;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(strConn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("INSERT INTO dbo.Penalty ( BookIssueID, Price, Detail )\n"
            + "VALUES(" + Session["biID"].ToString() + ", " + txtAmmount.Text + ", N'" + txtDetail.Text + "')\n"
            + "UPDATE dbo.BookIssue SET Status = -1 , ReturnDate = '" + DateTime.Now + "' WHERE BookIssueID = " + Session["biID"].ToString(), conn);
            DAO.UpdateTable(cmd);

            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Pay successful!', '', 'success')</script>");
            Session.Remove("biID");

            lblBookName.Text = string.Empty;
            txtAuthor.Text = string.Empty;
            txtGenre.Text = string.Empty;
            txtPublishDate.Text = string.Empty;
            txtName.Text = string.Empty;
            txtNumID.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtPhone.Text = string.Empty;
            txtSt.Text = string.Empty;
            txtAmmount.Text = string.Empty;
            Image1.ImageUrl = "img/book_inventory/book-picture.png";
            detail.Visible = false;
        }
    }
}
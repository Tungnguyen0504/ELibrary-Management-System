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
    public partial class ViewDetailBorrowedReturnedBook : System.Web.UI.Page
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
                        viewDetail();

                        check();
                        
                    }
                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('" + ex.Message + "', '', 'error');</script>");
            }
        }

        protected void viewDetail()
        {
            SqlConnection conn = new SqlConnection(strConn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.BookIssue bi JOIN dbo.[User] u \n"
            + "ON u.UserID = bi.UserID JOIN dbo.BookMaster bm\n"
            + "ON bm.BookID = bi.BookID\n"
            + "WHERE bi.BookIssueID = " + Request.QueryString["id"], conn);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                txtUid.Text = dr.GetValue(1).ToString();
                txtBid.Text = dr.GetValue(2).ToString();

                DateTime borrowDate = Convert.ToDateTime(dr.GetValue(4).ToString());
                DateTime dueDate = Convert.ToDateTime(dr.GetValue(5).ToString());
                txtBorrowDate.Text = borrowDate.ToString("dd, MMM yyyy");
                txtDueDate.Text = dueDate.ToString("dd, MMM yyyy");

                string d = dr.GetValue(6).ToString();
                if (d.Equals(""))
                {
                    txtReturnDate.Text = "Not yet";
                }
                else
                {
                    DateTime returnDate = Convert.ToDateTime(d);
                    txtReturnDate.Text = returnDate.ToString("dd, MMM yyyy");
                }

                txtTotal.Text = "1";
                txtFName.Text = dr.GetValue(9).ToString();
                txtBName.Text = dr.GetValue(21).ToString();
                if (dr.GetValue(7).ToString().Equals("-1"))
                {
                    txtSt.Text = "Fined";
                }
                else if (dr.GetValue(7).ToString().Equals("1"))
                {
                    txtSt.Text = "Returned";
                    txtFine.Text = "";
                    txtDetail.Text = "";
                }
                else
                {
                    txtSt.Text = "Borrowing";
                }
            }
            conn.Close();

        }

        protected void check ()
        {
            SqlConnection conn = new SqlConnection(strConn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd1 = new SqlCommand("SELECT * FROM dbo.Penalty WHERE BookIssueID = " + Request.QueryString["id"], conn);
            SqlDataReader dr1 = cmd1.ExecuteReader();
            if (dr1.HasRows)
            {
                while (dr1.Read())
                {
                    txtFine.Text = dr1.GetValue(2).ToString();
                    txtDetail.Text = dr1.GetValue(3).ToString();
                }
            }
        }
    }
}
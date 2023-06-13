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
    public partial class Login : System.Web.UI.Page
    {
        static string strConn = ConfigurationManager.ConnectionStrings["DbConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(strConn);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.[User] WHERE Email = '" + TextBox1.Text.Trim() + "' AND Password = '" + TextBox2.Text.Trim() + "'");
                cmd.Connection = conn;
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        if(checkAccountActive(int.Parse(dr.GetValue(0).ToString())) == 0)
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>swal('Your account has not been activated!', 'please contact to the librarian to activate', 'warning');</script>");
                        } else
                        {
                            Session["userID"] = dr.GetValue(0).ToString();
                        if ((int)dr.GetValue(11) == 0)
                        {
                            Session["role"] = "user";
                        }
                        else
                        {
                            Session["role"] = "admin";
                        }
                        Response.Redirect("homepage.aspx");
                        }
                    }
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Username or Password is Invalid!', 'Please check account again!', 'error');</script>");
                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('" + ex.Message + "!','', 'error');</script>");
            }
        }

        private int checkAccountActive(int id)
        {
            SqlConnection conn = new SqlConnection(strConn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.[User] WHERE UserID = " + id + " AND AccountStatus = 0");
            cmd.Connection = conn;
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                id = 0;
            }

            return id;
        }
    }
}
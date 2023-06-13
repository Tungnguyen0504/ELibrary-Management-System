using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using AuctionWindow.DAL;

namespace ELibrary_Management
{
    public partial class change_password : System.Web.UI.Page
    {
        static string strConn = ConfigurationManager.ConnectionStrings["DbConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["role"] == null)
                {
                    Response.Redirect("HomePage.aspx");
                }
                else
                {
                    Session["head"] = "Change Password";
                    SqlConnection conn = new SqlConnection(strConn);
                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();
                    }
                    SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.[User] WHERE UserID = " + Session["userID"].ToString(), conn);
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        TextBox1.Text = dr.GetValue(1).ToString();
                    }
                }
            }
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
                SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.[User] WHERE UserID = " + Session["userID"].ToString(), conn);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    if (TextBox2.Text != dr.GetValue(8).ToString())
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>swal({ title: 'Wrong current password!', type: 'warning'});</script>");
                    }
                    else if (TextBox3.Text != TextBox4.Text)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>swal({ title: 'Password and Confirm Password must be same!', type: 'error'});</script>");
                    } else if (dr.GetValue(8).ToString() == TextBox3.Text)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>swal({ title: 'New password must be different old password!', type: 'error'});</script>");
                    }
                    else
                    {
                        SqlCommand cmd1 = new SqlCommand("UPDATE dbo.[User]\n"
                                                        + "SET Password = '" + TextBox4.Text + "'\n"
                                                        + "WHERE UserID = " + Session["userID"], conn);
                        DAO.UpdateTable(cmd1);

                        TextBox2.Text = "";
                        TextBox3.Text = "";
                        TextBox4.Text = "";

                        Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>swal({ title: 'Change Password Successfull!', type: 'success'});</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>swal({ title: '" + ex.Message + "!', type: 'error'});</script>");
            }
        }
    }
}
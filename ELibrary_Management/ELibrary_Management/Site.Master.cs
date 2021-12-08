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
    public partial class Site : System.Web.UI.MasterPage
    {
        static string strConn = ConfigurationManager.ConnectionStrings["DbConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if(Session["role"] == null || Session["role"].Equals(""))
                {
                } else
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
                        Label1.Text = dr.GetValue(1).ToString();
                        Image1.ImageUrl = "../img/member_img/" + dr.GetValue(9).ToString();

                        GridView1.DataSource = DAO.GetDataTable("SELECT * FROM dbo.Notification WHERE UserID = " + Session["userID"]);
                        GridView1.Attributes.Remove("border");
                        if(GridView1.Rows.Count == 0)
                        {
                            GridView1.EmptyDataText = "No notification";
                            GridView1.Attributes.Remove("border");
                        }
                        GridView1.DataBind();
                    }
                }
            }
            catch (Exception)
            {
            }
        }

        protected string getDateNotification(DateTime d)
        {
            string result = string.Empty;

            var timeSpan = DateTime.Now.Subtract(d);

            if (timeSpan <= TimeSpan.FromSeconds(60))
            {
                result = string.Format("{0} seconds ago", timeSpan.Seconds);
            }
            else if (timeSpan <= TimeSpan.FromMinutes(60))
            {
                result = timeSpan.Minutes > 1 ? String.Format("about {0} minutes ago", timeSpan.Minutes) : "about a minute ago";
            }
            else if (timeSpan <= TimeSpan.FromHours(24))
            {
                result = timeSpan.Hours > 1 ? String.Format("about {0} hours ago", timeSpan.Hours) : "about an hour ago";
            }
            else if (timeSpan <= TimeSpan.FromDays(30))
            {
                result = timeSpan.Days > 1 ? String.Format("about {0} days ago", timeSpan.Days) : "yesterday";
            }
            else if (timeSpan <= TimeSpan.FromDays(365))
            {
                result = timeSpan.Days > 30 ? String.Format("about {0} months ago", timeSpan.Days / 30) : "about a month ago";
            }
            else
            {
                result = timeSpan.Days > 365 ? String.Format("about {0} years ago", timeSpan.Days / 365) : "about a year ago";
            }

            return result;
        } 

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Successful login!');</script>");
            Response.Redirect("ViewBook.aspx?bookID=" + txtBookName.Text);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            txtBookName.Text = "";
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Remove("userID");
            Session.Remove("role");
            Response.Redirect("HomePage.aspx");
        }
    }
}
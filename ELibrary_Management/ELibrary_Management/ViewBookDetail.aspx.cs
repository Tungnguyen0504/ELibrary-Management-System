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
    public partial class viewBookDetail : System.Web.UI.Page
    {
        static string strConn = ConfigurationManager.ConnectionStrings["DbConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    SqlConnection conn = new SqlConnection(strConn);
                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();
                    }
                    SqlCommand cmd = new SqlCommand("SELECT bm.*, (SELECT Authorname FROM dbo.Author WHERE AuthorID = bm.AuthorID) AS AuthorName, (SELECT Publishername FROM dbo.Publisher WHERE PublisherID = bm.PublisherID) AS PublishName FROM dbo.BookMaster bm WHERE BookID = " + Request.QueryString["id"], conn);
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        txtBookName.Text = dr.GetValue(1).ToString();
                        txtGenre.Text = dr.GetValue(2).ToString();
                        txtAuthor.Text = dr.GetValue(3).ToString();
                        txtPublisher.Text = dr.GetValue(4).ToString();
                        DateTime date = Convert.ToDateTime(dr.GetValue(5).ToString());
                        txtDate.Text = date.ToString("dd, MMM yyyy");
                        txtLanguage.Text = dr.GetValue(6).ToString();
                        txtEdition.Text = dr.GetValue(7).ToString();
                        txtCost.Text = dr.GetValue(8).ToString();
                        txtNoOfPage.Text = dr.GetValue(9).ToString();
                        txtDes.Text = dr.GetValue(10).ToString();
                        if (int.Parse(dr.GetValue(11).ToString()) > 0)
                        {
                            txtAvailable.Text = "In Stock";
                            txtAvailable.ForeColor = System.Drawing.Color.Green;
                        }
                        else
                        {
                            txtAvailable.Text = "Out of Stock";
                            txtAvailable.ForeColor = System.Drawing.Color.Red;
                        }
                        Image1.ImageUrl = "../img/book_inventory/" + dr.GetValue(12).ToString();
                        txtCanborrow.Text = (int.Parse(dr.GetValue(13).ToString())) == 0 ? "No" : "Yes";
                    }
                }
                else
                {
                    Response.Redirect("homepage.aspx");
                }
            }
        }
    }
}
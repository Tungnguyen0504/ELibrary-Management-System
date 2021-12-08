using AuctionWindow.DAL;
using System;
using System.Configuration;

namespace ELibrary_Management
{
    public partial class homepage : System.Web.UI.Page
    {
        static string strConn = ConfigurationManager.ConnectionStrings["DbConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            carousel.DataSource = DAO.GetDataTable("SELECT *, (SELECT AuthorName FROM dbo.Author WHERE AuthorId = bm.AuthorID) AS AuthorName, (SELECT PublisherName FROM dbo.Publisher WHERE PublisherId = bm.PublisherID) AS PublisherName\n"
                                                    + "FROM dbo.BookMaster bm");
            //carousel.DataSource = DAO.GetDataTable("SELECT bm.Book_image FROM dbo.Book_master bm");
            carousel.DataBind();
        }
    }
}
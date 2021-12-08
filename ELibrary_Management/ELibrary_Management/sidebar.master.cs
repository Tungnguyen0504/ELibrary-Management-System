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
    public partial class sidebar : System.Web.UI.MasterPage
    {
        static string strConn = ConfigurationManager.ConnectionStrings["DbConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                txtHead.Text = txtHead1.Text = (string)Session["head"];
                getTotalBooks();
                getTotalUsers();
                getTotalReturneds();
                getTotalBorrowing();
            }
            catch (Exception)
            {
            }

        }

        void getTotalBooks()
        {
            DataTable da = DAO.GetDataTable("SELECT * FROM dbo.BookMaster");
            Label1.Text = da.Rows.Count.ToString();
        }
        void getTotalUsers()
        {
            DataTable da = DAO.GetDataTable("SELECT * FROM dbo.[User]");
            Label2.Text = da.Rows.Count.ToString();
        }
        void getTotalReturneds()
        {
            DataTable da = DAO.GetDataTable("SELECT * FROM dbo.BookIssue WHERE Status = 1 OR Status = -1");
            Label3.Text = da.Rows.Count.ToString();
        }
        void getTotalBorrowing()
        {
            DataTable da = DAO.GetDataTable("SELECT * FROM dbo.BookIssue WHERE Status = 0");
            Label4.Text = da.Rows.Count.ToString();
        }

    }
}
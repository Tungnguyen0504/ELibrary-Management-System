using AuctionWindow.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELibrary_Management
{
    public partial class view_book : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["bookID"] != null)
            {
                GridView1.DataSource = DAO.GetDataTable("SELECT *, (SELECT AuthorName FROM dbo.Author WHERE AuthorID = b.AuthorID) AS Author, (SELECT PublisherName FROM dbo.Publisher WHERE PublisherID = b.PublisherID) AS publisher \n"
                                                        + "FROM dbo.BookMaster b WHERE b.BookName LIKE '%" + Request.QueryString["bookID"].ToString() + "%'");
                GridView1.DataBind();
                if (GridView1.Rows.Count > 0)
                {
                    GridView1.UseAccessibleHeader = true;
                    GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
                    GridView1.FooterRow.TableSection = TableRowSection.TableFooter;
                }
            }
            else
            {
                GridView1.DataSource = DAO.GetDataTable("SELECT *, (SELECT AuthorName FROM dbo.Author WHERE AuthorID = b.AuthorID) AS Author, (SELECT PublisherName FROM dbo.Publisher WHERE PublisherID = b.PublisherID) AS publisher FROM dbo.BookMaster b");
                GridView1.DataBind();
                if (GridView1.Rows.Count > 0)
                {
                    GridView1.UseAccessibleHeader = true;
                    GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
                    GridView1.FooterRow.TableSection = TableRowSection.TableFooter;
                }
            }
        }
    }
}
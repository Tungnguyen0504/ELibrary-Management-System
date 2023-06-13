using AuctionWindow.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELibrary_Management
{
    public partial class bookIssueManagement : System.Web.UI.Page
    {
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
                        databind();
                    }
                }

            }
            catch (Exception)
            {
            }
        }

        protected void databind()
        {
            Session["head"] = "Borrowed / Returned Management";
            GridView1.DataSource = DAO.GetDataTable("SELECT bi.*, bm.*, u.* FROM dbo.BookIssue bi JOIN dbo.[User] u ON u.UserID = bi.UserID JOIN dbo.BookMaster bm ON bm.BookID = bi.BookID ORDER BY BorrowedDate DESC");
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
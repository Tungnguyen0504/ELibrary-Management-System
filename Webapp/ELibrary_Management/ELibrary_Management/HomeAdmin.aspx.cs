using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELibrary_Management
{
    public partial class home_admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["role"] == null || Session["role"].Equals("user"))
                {
                    Response.Redirect("HomePage.aspx");
                }
                else
                {
                    Session["head"] = "Home Page Admin";
                }
            }
        }
    }
}
using AuctionWindow.DAL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELibrary_Management
{
    public partial class adminAddEditBookInventory : System.Web.UI.Page
    {
        static string strConn = ConfigurationManager.ConnectionStrings["DbConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["role"] == null || Session["role"].Equals("user"))
            {
                Response.Redirect("HomePage.aspx");
            }
            else if (Request.QueryString["id"] != null && Request.QueryString["action"] == "edit")
            {
                if (!IsPostBack)
                {
                    Session["head"] = "Edit Book";
                    getBookById();
                }
            }
            else
            {
                if (!IsPostBack)
                {
                    Session["head"] = "Add New Book";
                    getAuthor();
                    getPublisher();
                    ddlAuthor.Items.Insert(0, new ListItem("-------Select one value only-------", String.Empty));
                    ddlPublisher.Items.Insert(0, new ListItem("-------Select one value only-------", String.Empty));
                    ddlLanguage.Items.Insert(0, new ListItem("-------Select one value only-------", String.Empty));
                }
            }
        }

        void getBookById()
        {
            SqlConnection conn = new SqlConnection(strConn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.BookMaster WHERE BookID = " + Request.QueryString["id"], conn);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                lblID.Text = "ID : " + dr.GetValue(0).ToString();
                txtBookNameEdit.Text = dr.GetValue(1).ToString();
                txtBookNameAdd.Text = dr.GetValue(1).ToString();

                DateTime date = Convert.ToDateTime(dr.GetValue(5).ToString());
                txtPublishDate.Text = date.ToString("yyyy-MM-dd");

                txtEdition.Text = dr.GetValue(7).ToString();
                txtCost.Text = dr.GetValue(8).ToString();
                txtNoPage.Text = dr.GetValue(9).ToString();
                txtDes.Text = dr.GetValue(10).ToString();
                txtAvailable.Text = dr.GetValue(11).ToString();
                Image2.ImageUrl = "../img/book_inventory/" + dr.GetValue(12).ToString();

                lbGenre.ClearSelection();
                string[] genre = dr.GetValue(2).ToString().Trim().Split(',');
                for (int i = 0; i < genre.Length; i++)
                {
                    for (int j = 0; j < lbGenre.Items.Count; j++)
                    {
                        if (lbGenre.Items[j].ToString() == genre[i])
                        {
                            lbGenre.Items[j].Selected = true;
                        }

                    }
                }

                getAuthor();
                ddlAuthor.SelectedValue = dr.GetValue(3).ToString();

                getPublisher();
                ddlPublisher.SelectedValue = dr.GetValue(4).ToString();

                ddlLanguage.SelectedValue = dr.GetValue(6).ToString();

                ddlCanBorrow.SelectedValue = dr.GetValue(13).ToString();
            }
        }

        void getAuthor()
        {
            ddlAuthor.DataSource = DAO.GetDataTable("SELECT * FROM dbo.Author");
            ddlAuthor.DataTextField = "AuthorName";
            ddlAuthor.DataValueField = "AuthorID";
            ddlAuthor.DataBind();
        }

        void getPublisher()
        {
            ddlPublisher.DataSource = DAO.GetDataTable("SELECT * FROM dbo.Publisher");
            ddlPublisher.DataTextField = "PublisherName";
            ddlPublisher.DataValueField = "PublisherID";
            ddlPublisher.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["action"] == "edit")
                {
                    updateBook();
                }
                else
                {
                    addBook();
                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal( 'Error!', '" + ex.Message + "', 'error');</script>");
            }
        }

        void updateBook()
        {
            SqlConnection conn = new SqlConnection(strConn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }

            string genres = "";
            foreach (int i in lbGenre.GetSelectedIndices())
            {
                genres = genres + lbGenre.Items[i] + ",";
            }
            genres = genres.Remove(genres.Length - 1);

            string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
            try
            {
                if (filename == null || filename.Equals(""))
                {
                    SqlCommand cmd1 = new SqlCommand("SELECT * FROM dbo.BookMaster WHERE BookID = " + Request.QueryString["id"], conn);
                    SqlDataReader dr = cmd1.ExecuteReader();
                    while (dr.Read())
                    {
                        filename = dr.GetValue(12).ToString();
                    }
                }
                else
                {
                    FileUpload1.SaveAs(Server.MapPath("../img/book_inventory/" + filename));
                }
            }
            catch (Exception)
            {
            }

            DateTime date = DateTime.ParseExact(txtPublishDate.Text, "yyyy-MM-dd", CultureInfo.InvariantCulture);

            string query = "UPDATE dbo.BookMaster\n"
            + "SET BookName = '" + txtBookNameEdit.Text + "', Genre = '" + genres + "', AuthorID = '" + ddlAuthor.SelectedValue + "', PublisherID = '" + ddlPublisher.SelectedValue + "', PublishDate = '" + date + "', Language = '" + ddlLanguage.SelectedValue + "', Edition = '" + txtEdition.Text + "',\n"
            + "BookCost = '" + txtCost.Text + "', NoOfPages = '" + txtNoPage.Text + "', BookDescription = '" + txtDes.Text + "', Available = '" + txtAvailable.Text + "', BookImage = '" + filename + "'\n"
            + "WHERE BookID = " + Request.QueryString["id"];
            SqlCommand cmd = new SqlCommand(query, conn);
            DAO.UpdateTable(cmd);
            Image2.ImageUrl = "../img/book_inventory/" + filename;

            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Update Successful!', '', 'success')</script>");
        }

        void addBook()
        {
            if (ddlAuthor.SelectedIndex == 0 && ddlPublisher.SelectedIndex == 0 && ddlLanguage.SelectedIndex == 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal( 'Please select one value!', '', 'warning');</script>");
            }
            else if (!checkBookName())
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal( 'Book name is already existed in inventory!', '', 'warning');</script>");
            }
            else
            {
                SqlConnection conn = new SqlConnection(strConn);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                string genres = "";
                foreach (int i in lbGenre.GetSelectedIndices())
                {
                    genres = genres + lbGenre.Items[i] + ",";
                }
                genres = genres.Remove(genres.Length - 1);

                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                try
                {
                    if (filename == null || filename.Equals(""))
                    {
                        filename = "book-picture.png";
                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("../img/book_inventory/" + filename));
                    }
                }
                catch (Exception)
                {
                }

                DateTime date = DateTime.ParseExact(txtPublishDate.Text, "yyyy-MM-dd", CultureInfo.InvariantCulture);

                string query = "INSERT INTO dbo.BookMaster ( BookName , Genre , AuthorID , PublisherID , PublishDate , Language , Edition , BookCost , NoOfPages , BookDescription , Available , BookImage , CanBorrow )\n"
                + "VALUES(N'" + txtBookNameAdd.Text + "', N'" + genres + "', '" + ddlAuthor.SelectedValue + "', '" + ddlPublisher.SelectedValue + "', '" + date + "', N'" + ddlLanguage.SelectedValue + "', N'" + txtEdition.Text + "', '" + txtCost.Text + "', '" + txtNoPage.Text + "', N'" + txtDes.Text + "', '" + txtAvailable.Text + "', N'" + filename + "' , N'" + ddlCanBorrow.SelectedValue + "')";
                SqlCommand cmd = new SqlCommand(query, conn);
                DAO.UpdateTable(cmd);

                txtBookNameAdd.Text = "";
                txtPublishDate.Text = "";
                txtEdition.Text = "";
                txtCost.Text = "";
                txtNoPage.Text = "";
                txtDes.Text = "";
                txtAvailable.Text = "";
                ddlAuthor.ClearSelection();
                ddlLanguage.ClearSelection();
                ddlPublisher.ClearSelection();
                ddlCanBorrow.ClearSelection();
                lbGenre.ClearSelection();

                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal( 'Add Successful!', '', 'success');</script>");
            }
        }

        protected void cbCheckName_CheckedChanged(object sender, EventArgs e)
        {
            if (!checkBookName())
            {
                cbCheckName.Checked = false;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal( 'Book name is already existed in inventory!', '', 'warning');</script>");
            } else
            {
                cbCheckName.Checked = true;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('OK!', '', 'success')</script>");
            }
        }

        protected bool checkBookName()
        {
            SqlConnection conn = new SqlConnection(strConn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.BookMaster WHERE BookName LIKE '%" + txtBookNameAdd.Text + "%'", conn);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if (txtBookNameAdd.Text.Trim() == dr.GetValue(1).ToString().Trim())
                {
                    return false;
                }
            }
            return true;
        }
    }
}
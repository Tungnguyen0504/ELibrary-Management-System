using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AuctionWindow.DAL;
using System.Globalization;
using System.IO;

namespace ELibrary_Management
{
    public partial class my_profile : System.Web.UI.Page
    {
        static string strConn = ConfigurationManager.ConnectionStrings["DbConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["role"] == null || Session["role"].Equals(""))
                {
                    Response.Redirect("HomePage.aspx");
                }
                else
                {
                    Session["head"] = "My Profile";
                    getInforById();
                }
            }
        }

        private void getInforById()
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
                    DateTime date = Convert.ToDateTime(dr.GetValue(4).ToString());
                    txtUserNumberID.Text = dr.GetValue(2).ToString();
                    txtFullName.Text = dr.GetValue(1).ToString();
                    txtDob.Text = date.ToString("yyyy-MM-dd");
                    txtPhone.Text = dr.GetValue(5).ToString();
                    txtEmail.Text = dr.GetValue(6).ToString();
                    txtAddress.Text = dr.GetValue(7).ToString();
                    Image2.ImageUrl = "../img/member_img/" + dr.GetValue(9).ToString();
                    if (dr.GetValue(3).ToString().Equals("0"))
                    {
                        cbMale.Checked = true;
                    }
                    else
                    {
                        cbFemale.Checked = true;
                    }
                }

                GridView1.DataSource = DAO.GetDataTable("SELECT bm.BookImage, bm.BookName, bi.*\n"
                + "FROM dbo.BookIssue bi JOIN dbo.BookMaster bm ON bm.BookID = bi.BookID\n"
                + "WHERE UserID = " + Session["userID"]);
                GridView1.DataBind();

                if (GridView1.Rows.Count > 0)
                {
                    GridView1.UseAccessibleHeader = true;
                    GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
                    GridView1.FooterRow.TableSection = TableRowSection.TableFooter;
                } else
                {
                    Label1.Text = "You haven't borrowed any books yet?";
                }
            }
            catch (Exception)
            {
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (cbMale.Checked = false && cbFemale.Checked == false)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal( 'Please choose one gender!', '', 'warning');</script>");
                }
                else
                {
                    SqlConnection conn = new SqlConnection(strConn);
                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();
                    }

                    string sex = "";
                    if (cbMale.Checked) sex = "0";
                    else sex = "1";

                    //image
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    if (filename == null || filename.Equals(""))
                    {
                        SqlCommand cmd1 = new SqlCommand("SELECT * FROM dbo.[User] WHERE UserID = " + Session["userID"].ToString(), conn);
                        SqlDataReader dr = cmd1.ExecuteReader();
                        while (dr.Read())
                        {
                            filename = dr.GetValue(9).ToString();
                        }
                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("img/member_img/" + filename));
                    }
                    //image

                    DateTime date = DateTime.ParseExact(txtDob.Text, "yyyy-MM-dd", CultureInfo.InvariantCulture);

                    SqlCommand cmd = new SqlCommand("UPDATE dbo.User\n"
                    + "SET FullName = '" + txtFullName.Text + "', UserNumberID = '" + txtUserNumberID.Text + "', Sex = '" + sex + "', Dob = '" + date + "', Phone = '" + txtPhone.Text + "', Email = '" + txtEmail.Text + "', FullAddress = '" + txtAddress.Text + "', Image = '" + filename + "'\n"
                    + "WHERE UserID = '" + Session["userID"] + "'", conn); ;
                    DAO.UpdateTable(cmd);

                    Image2.ImageUrl = Image2.ImageUrl = "../img/member_img/" + filename;
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal({ title: 'Update Information Successfull!', type: 'success'});</script>");
                }

            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal({ title: 'Cannot update information!', text: '" + ex.Message + "', type: 'error'});</script>");
            }
        }

        protected void cbMale_CheckedChanged(object sender, EventArgs e)
        {
            cbFemale.Checked = false;
        }

        protected void cbFemale_CheckedChanged(object sender, EventArgs e)
        {
            cbMale.Checked = false;
        }
    }
}
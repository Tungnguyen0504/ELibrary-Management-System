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
    public partial class adminAddEditUserManagement : System.Web.UI.Page
    {
        static string strConn = ConfigurationManager.ConnectionStrings["DbConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] == null || Session["role"].Equals("user"))
            {
                Response.Redirect("HomePage.aspx");
            }
            else
            {
                if (Request.QueryString["id"] != null && Request.QueryString["action"] == "edit")
                {
                    if (!IsPostBack)
                    {
                        Session["head"] = "Edit User";
                        getUserById();
                    }
                }
                else if (Request.QueryString["action"] == "add")
                {
                    if (!IsPostBack)
                    {
                        Session["head"] = "Add New User";
                    }
                }
                else
                {
                    Response.Redirect("HomePage.aspx");
                }
            }
        }

        void getUserById()
        {
            SqlConnection conn = new SqlConnection(strConn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.[User] WHERE UserID = " + Request.QueryString["id"], conn);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                txtUserID.Text = dr.GetValue(0).ToString();
                txtUserNumberID.Text = dr.GetValue(2).ToString();
                txtFullName.Text = dr.GetValue(1).ToString();
                if (dr.GetValue(3).ToString().Equals("0"))
                {
                    cbMale.Checked = true;
                }
                else
                {
                    cbFemale.Checked = true;
                }
                DateTime date = Convert.ToDateTime(dr.GetValue(4).ToString());
                txtDob.Text = date.ToString("yyyy-MM-dd");
                txtPhone.Text = dr.GetValue(5).ToString();
                txtEmail.Text = dr.GetValue(6).ToString();
                txtAddress.Text = dr.GetValue(7).ToString();
                txtPassword.Text = dr.GetValue(8).ToString();

                Image2.ImageUrl = "../img/member_img/" + dr.GetValue(9).ToString();

                ddlIsActive.SelectedValue = dr.GetValue(10).ToString();
                ddlIsAdmin.SelectedValue = dr.GetValue(11).ToString();
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (cbFemale.Checked == false && cbMale.Checked == false)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal( 'Please choose one gender!', '', 'warning');</script>");
                }
                else
                {
                    if (Request.QueryString["action"] == "edit")
                    {
                        updateUser();
                    }
                    else
                    {
                        addUser();
                    }
                }

            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal( 'Error!', '" + ex.Message + "', 'error');</script>");
            }
        }

        void updateUser()
        {
            try
            {

                SqlConnection conn = new SqlConnection(strConn);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                string sex = "";
                if (cbMale.Checked) sex = "0";
                else sex = "1";

                string filename = Path.GetFileName(FileUpload2.PostedFile.FileName);
                try
                {
                    if (filename == null || filename.Equals(""))
                    {
                        SqlCommand cmd1 = new SqlCommand("SELECT * FROM dbo.[User] WHERE UserID = " + Request.QueryString["id"], conn);
                        SqlDataReader dr = cmd1.ExecuteReader();
                        while (dr.Read())
                        {
                            filename = dr.GetValue(12).ToString();
                        }
                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("../img/member_img/" + filename));
                    }
                }
                catch (Exception)
                {
                }

                DateTime date = DateTime.ParseExact(txtDob.Text, "yyyy-MM-dd", CultureInfo.InvariantCulture);

                string query = "UPDATE dbo.[User] \n"
                + "SET FullName = '" + txtFullName.Text + "', UserNumberID = '" + txtUserNumberID.Text + "', Sex = '" + sex + "', Dob = '" + date + "', Phone = '" + txtPhone.Text + "', Email = '" + txtEmail.Text + "', FullAddress = '" + txtAddress.Text + "', Password = '" + txtPassword.Text + "', Image = '" + filename + "', AccountStatus = '" + ddlIsActive.SelectedValue + "', IsAdmin = '" + ddlIsAdmin.SelectedValue + "'\n"
                                      + "WHERE UserID = " + Request.QueryString["id"];
                SqlCommand cmd = new SqlCommand(query, conn);
                DAO.UpdateTable(cmd);
                Image2.ImageUrl = "../img/member_img/" + filename;

                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Update Successful!', '', 'success')</script>");

            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Error!', '" + ex.Message + "', 'success')</script>");
            }
        }

        void addUser()
        {
            try
            {
                if (!checkUserNumberId())
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Error!', '" + txtUserNumberID.Text + " has been already existed', 'warning')</script>");
                }
                else if (!checkEmail())
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Error!', '" + txtEmail.Text + " has been already existed', 'warning')</script>");
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

                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    try
                    {
                        if (filename == null || filename.Equals(""))
                        {
                            filename = "user-blank.png";
                        }
                        else
                        {
                            FileUpload1.SaveAs(Server.MapPath("..img/member_img" + filename));
                        }
                    }
                    catch (Exception)
                    {
                    }

                    DateTime date = DateTime.ParseExact(txtDob.Text, "yyyy-MM-dd", CultureInfo.InvariantCulture);

                    string query = "INSERT INTO dbo.[User] ( FullName , UserNumberID , Sex , Dob , Phone , Email , FullAddress , Password , Image , AccountStatus , IsAdmin )\n"
                    + "VALUES(N'" + txtFullName.Text + "', N'" + txtUserNumberID.Text + "', '" + sex + "' , N'" + date + "', N'" + txtPhone.Text + "', N'" + txtEmailAdd.Text + "', N'" + txtAddress.Text + "', N'" + txtPassword.Text + "', '" + filename + "' , 1 , '" + ddlIsAdmin.SelectedValue + "')";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    DAO.UpdateTable(cmd);

                    txtUserNumberID.Text = "";
                    txtFullName.Text = "";
                    cbMale.Checked = false;
                    cbFemale.Checked = false;
                    txtDob.Text = "";
                    txtPhone.Text = "";
                    txtEmailAdd.Text = "";
                    txtAddress.Text = "";
                    txtPassword.Text = "";
                    Image2.ImageUrl = "../img/member_img/images/user-blank.png";
                    ddlIsAdmin.ClearSelection();

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal( 'Add Successful!', '', 'success');</script>");
                }

            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Error!', '" + ex.Message + "', 'success')</script>");
            }
        }

        protected void cbCheck_CheckedChanged(object sender, EventArgs e)
        {
            if (!checkUserNumberId())
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Error!', '" + txtUserNumberID.Text + " has been already existed', 'warning')</script>");
                cbCheck.Checked = false;
            }
            else if (!checkEmail())
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Error!', '" + txtEmailAdd.Text + " has been already existed', 'warning')</script>");
                cbCheck.Checked = false;
            }
            else
            {
                cbCheck.Checked = true;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('OK!', '', 'success')</script>");
            }
        }

        protected bool checkUserNumberId()
        {
            SqlConnection conn = new SqlConnection(strConn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.[User] WHERE UserNumberID LIKE '%" + txtUserNumberID.Text + "%'", conn);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if (txtUserNumberID.Text.Trim() == dr.GetValue(2).ToString().Trim())
                {
                    return false;
                }
            }
            return true;
        }

        protected bool checkEmail()
        {
            SqlConnection conn = new SqlConnection(strConn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.[User] WHERE Email LIKE '%" + txtEmail.Text + "%'", conn);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if (txtEmailAdd.Text.Trim() == dr.GetValue(6).ToString().Trim())
                {
                    return false;
                }
            }
            return true;
        }
    }
}

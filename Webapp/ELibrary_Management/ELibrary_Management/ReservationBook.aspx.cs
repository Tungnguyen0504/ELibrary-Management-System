using AuctionWindow.DAL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELibrary_Management
{
    public partial class ReservationBook : System.Web.UI.Page
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
                DateTime date = DateTime.Now;
                txtDate.Text = date.ToString("yyyy-MM-dd");

                if (GridView2.DataSource == null)
                {
                    GridView2.DataSource = new string[] { };
                }
                GridView2.DataBind();

                databindBookReserve();
            }
        }

        protected void databindBookReserve()
        {
            GridView1.DataSource = DAO.GetDataTable("SELECT * FROM dbo.Reservation r JOIN dbo.[User] u \n"
            + "ON u.UserID = r.UserID JOIN dbo.BookMaster bm \n"
            + "ON bm.BookID = r.BookID");
            GridView1.DataBind();

            if (GridView1.Rows.Count > 0)
            {
                GridView1.UseAccessibleHeader = true;
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
                GridView1.FooterRow.TableSection = TableRowSection.TableFooter;
            }
        }

        protected void add_Click(object sender, EventArgs e)
        {
            try
            {

                DataTable dt = new DataTable();
                dt.Columns.Add("StudentNumberID");
                dt.Columns.Add("StudentName");
                dt.Columns.Add("BookID");
                dt.Columns.Add("BookName");
                dt.Columns.Add("ReserveDate");
                dt.Columns.Add("Quantity");

                DataRow dr = dt.NewRow();

                dr["StudentNumberID"] = txtNumberID.Text;
                SqlConnection conn = new SqlConnection(strConn);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT FullName, UserID FROM dbo.[User] WHERE UserNumberID = '" + txtNumberID.Text + "'", conn);
                SqlDataReader dreader = cmd.ExecuteReader();
                if (!dreader.HasRows)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Invalid Student Number ID', '', 'error')</script>");
                    return;
                }
                else
                {
                    while (dreader.Read())
                    {
                        Session["uid"] = dreader.GetValue(1).ToString();
                        dr["StudentName"] = dreader.GetValue(0).ToString();
                    }
                    conn.Close();
                }

                dr["BookID"] = txtBookID.Text;
                conn.Open();
                cmd = new SqlCommand("SELECT BookName FROM dbo.BookMaster WHERE BookID = '" + txtBookID.Text + "'", conn);
                dreader = cmd.ExecuteReader();
                if (!dreader.HasRows)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Invalid Book ID', '', 'error')</script>");
                    return;
                }
                else
                {
                    while (dreader.Read())
                    {
                        dr["BookName"] = dreader.GetValue(0).ToString();
                    }
                }

                if (checkIsExist())
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Warning!', 'Each student can only reserve 1 time', 'warning')</script>");
                    return;
                }
                else if (!checkBookCanBorrow())
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('This book can only read in library!', '', 'warning')</script>");
                    return;
                }
                else if (checkAvailable())
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('You cannot reserve this item!', 'It is available, you can borrow directly in library', 'warning')</script>");
                    return;
                }
                else
                {

                    dr["ReserveDate"] = txtDate.Text;
                    dr["Quantity"] = "1";

                    dt.Rows.Add(dr);
                    GridView2.DataSource = dt;
                    GridView2.DataBind();
                    GridView2.UseAccessibleHeader = true;
                    GridView2.HeaderRow.TableSection = TableRowSection.TableHeader;
                    GridView2.FooterRow.TableSection = TableRowSection.TableFooter;

                }

            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('" + ex.Message + "', '', 'error')</script>");
            }
        }

        protected bool checkAvailable()
        {
            SqlConnection conn = new SqlConnection(strConn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.BookMaster WHERE BookID = '" + txtBookID.Text + "' AND Available > 0", conn);
            SqlDataReader dreader = cmd.ExecuteReader();
            if (dreader.HasRows)
            {
                return true;
            }
            return false;
        }
        protected bool checkIsExist()
        {
            SqlConnection conn = new SqlConnection(strConn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.Reservation WHERE UserID = " + Session["uid"].ToString(), conn);
            SqlDataReader dreader = cmd.ExecuteReader();
            if (dreader.HasRows)
            {
                return true;
            }
            return false;
        }
        protected bool checkBookCanBorrow()
        {
            SqlConnection conn = new SqlConnection(strConn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.BookMaster WHERE BookID = '" + txtBookID.Text + "' AND CanBorrow = 1", conn);
            SqlDataReader dreader = cmd.ExecuteReader();
            if (dreader.HasRows)
            {
                return true;
            }
            return false;
        }

        protected void btnReserve_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(strConn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("INSERT INTO dbo.Reservation ( UserID , BookID , Quantity , Date , Status ) \n"
            + "VALUES( '" + Session["uid"].ToString() + "' , " + txtBookID.Text + " , '1' , '" + Convert.ToDateTime(txtDate.Text) + "' , 0)", conn);
            DAO.UpdateTable(cmd);
            txtNumberID.Text = string.Empty;
            txtBookID.Text = string.Empty;
            GridView2.DataSource = new DataTable();
            DataBind();

            databindBookReserve();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Successful!', '', 'success')</script>");
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            SqlConnection conn = new SqlConnection(strConn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }

            int rowIndex = Convert.ToInt32(e.CommandArgument);
            int id = int.Parse(GridView1.Rows[rowIndex].Cells[0].Text);

            if (e.CommandName == "approve")
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.BookMaster bm JOIN dbo.Reservation r ON r.BookID = bm.BookID WHERE r.ReservationID = " + id, conn);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    if (int.Parse(dr.GetValue(11).ToString()) < 1)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Warning!', 'Please register more book before approve', 'warning')</script>");
                    }
                    else
                    {
                        cmd = new SqlCommand("UPDATE dbo.Reservation SET Status = 1 WHERE ReservationID = " + id + "\n"
                        + "INSERT INTO dbo.Notification ( UserID, [From], CreateAt, Content ) VALUES  ( " + dr.GetValue(15).ToString() + " , " + Session["userID"].ToString() + " , '" + DateTime.Now + "' , N'" + dr.GetValue(1).ToString() + " is available now. Please pick up before " + DateTime.Now.AddDays(14).ToString("dd/MM/yyyy") + "' )", conn);
                        DAO.UpdateTable(cmd);
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Approved!', '', 'success')</script>");
                        databindBookReserve();
                    }
                }
            }
            else if (e.CommandName == "reject")
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.BookMaster bm JOIN dbo.Reservation r ON r.BookID = bm.BookID WHERE r.ReservationID = " + id, conn);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    cmd = new SqlCommand("UPDATE dbo.Reservation SET Status = -1 WHERE ReservationID = " + id + "\n"
                    + "INSERT INTO dbo.Notification ( UserID, [From], CreateAt, Content ) VALUES  ( " + dr.GetValue(15).ToString() + " , " + Session["userID"].ToString() + " , '" + DateTime.Now + "' , N'Reserve for " + dr.GetValue(1).ToString() + " is Rejected!' )", conn);
                    DAO.UpdateTable(cmd);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Rejected!', '', 'success')</script>");
                    databindBookReserve();
                }
            }
            else if (e.CommandName == "detail")
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.Reservation r JOIN dbo.BookMaster bm ON bm.BookID = r.BookID WHERE r.ReservationID = " + id, conn);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    Image2.ImageUrl = "../img/book_inventory/" + dr.GetValue(18).ToString();
                    lblBookName.Text = dr.GetValue(7).ToString();
                    lblGenre.Text = dr.GetValue(8).ToString();
                    lblAuthor.Text = dr.GetValue(9).ToString();
                    lblCost.Text = dr.GetValue(14).ToString();
                    DateTime d = Convert.ToDateTime(dr.GetValue(4).ToString());
                    lblDate.Text = d.ToString("dd, MMM yyyy");
                    lblSt.Text = int.Parse(dr.GetValue(5).ToString()) == 1 ? "Approved" : int.Parse(dr.GetValue(5).ToString()) == 0 ? "Pending" : "Rejected";
                    lblAvailable.Text = int.Parse(dr.GetValue(17).ToString()) == 0 ? "Out of stock" : dr.GetValue(17).ToString();
                }
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "ShowPopup();", true);
            }
        }
    }
}

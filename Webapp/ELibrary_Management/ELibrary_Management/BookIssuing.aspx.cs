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
    public partial class BookIssuing : System.Web.UI.Page
    {
        static string strConn = ConfigurationManager.ConnectionStrings["DbConnectionString"].ConnectionString;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] == null || Session["role"].Equals("user"))
            {
                Response.Redirect("HomePage.aspx");
            }
            else
            {
                userLookUp();
                bookLookUp();

                if (!IsPostBack)
                {
                    if (GridView1.DataSource == null)
                    {
                        GridView1.DataSource = new string[] { };
                    }
                    GridView1.DataBind();
                    if (GridView2.DataSource == null)
                    {
                        GridView2.DataSource = new string[] { };
                    }
                    GridView2.DataBind();

                    txtBookID.Enabled = false;
                    txtBorrowDate.Enabled = false;
                    DateTime date = DateTime.Now;
                    txtBorrowDate.Text = date.ToString("yyyy-MM-dd");
                    txtDueDate.Enabled = false;
                    txtTotal.Enabled = false;

                    dt = new DataTable();
                    dt.Columns.Add("BookID");
                    dt.Columns.Add("BookName");
                    dt.Columns.Add("Total");
                    dt.Columns.Add("BorrowDate");
                    dt.Columns.Add("DueDate");
                    dt.Columns.Add("BookCost");
                    Session["data"] = dt;
                }
            }
        }

        public DataTable Get_EmptyGridView2()
        {
            DataTable dtEmpty = new DataTable();
            //Here ensure that you have added all the column available in your gridview
            dtEmpty.Columns.Add("BookID", typeof(string));
            dtEmpty.Columns.Add("BookName", typeof(string));
            dtEmpty.Columns.Add("Total", typeof(string));
            dtEmpty.Columns.Add("BorrowDate", typeof(string));
            dtEmpty.Columns.Add("DueDate", typeof(string));
            dtEmpty.Columns.Add("BookCost", typeof(string));
            DataRow datatRow = dtEmpty.NewRow();

            //Inserting a new row,datatable .newrow creates a blank row
            dtEmpty.Rows.Add(datatRow);//adding row to the datatable
            return dtEmpty;
        }

        public DataTable Get_EmptyGridView1()
        {
            DataTable dtEmpty = new DataTable();
            //Here ensure that you have added all the column available in your gridview
            dtEmpty.Columns.Add("BookID", typeof(string));
            dtEmpty.Columns.Add("BookName", typeof(string));
            dtEmpty.Columns.Add("BorrowedDate", typeof(string));
            dtEmpty.Columns.Add("Status", typeof(string));
            DataRow datatRow = dtEmpty.NewRow();

            //Inserting a new row,datatable .newrow creates a blank row
            dtEmpty.Rows.Add(datatRow);//adding row to the datatable
            return dtEmpty;
        }

        protected void userLookUp()
        {
            gvUserLookup.DataSource = DAO.GetDataTable("SELECT * FROM dbo.[User]");
            gvUserLookup.DataBind();
            if (gvUserLookup.Rows.Count > 0)
            {
                gvUserLookup.UseAccessibleHeader = true;
                gvUserLookup.HeaderRow.TableSection = TableRowSection.TableHeader;
                gvUserLookup.FooterRow.TableSection = TableRowSection.TableFooter;
            }
        }

        protected void bookLookUp()
        {
            GridView3.DataSource = DAO.GetDataTable("SELECT * FROM dbo.BookMaster bm JOIN dbo.Author a ON a.AuthorID = bm.AuthorID");
            GridView3.DataBind();
            if (GridView3.Rows.Count > 0)
            {
                GridView3.UseAccessibleHeader = true;
                GridView3.HeaderRow.TableSection = TableRowSection.TableHeader;
                GridView3.FooterRow.TableSection = TableRowSection.TableFooter;
            }
        }

        protected void search_Click(object sender, EventArgs e)
        {
            try
            {
                txtBookID.Enabled = true;
                txtBorrowDate.Enabled = true;
                txtDueDate.Enabled = true;

                getDetailStudent();
            }
            catch (Exception)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Error!', 'Student Number ID is invalid!', 'error')</script>");
            }
        }

        protected void getDetailStudent()
        {
            txtTotal.Text = "1";

            SqlConnection conn = new SqlConnection(strConn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.[User] WHERE UserNumberID = '" + txtNumberID.Text + "'", conn);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    txtFullName.Text = dr.GetValue(1).ToString();
                    txtUserID.Text = dr.GetValue(0).ToString();
                    txtEmail.Text = dr.GetValue(6).ToString();
                    txtPhone.Text = dr.GetValue(5).ToString();
                    DateTime date = Convert.ToDateTime(dr.GetValue(4).ToString());
                    txtDob.Text = date.ToString("dd, MMM yyyy");
                    Image1.ImageUrl = "../img/member_img/" + dr.GetValue(9).ToString();

                    GridView1.DataSource = DAO.GetDataTable("SELECT * FROM dbo.BookIssue bi JOIN dbo.BookMaster bm\n"
                    + "ON bm.BookID = bi.BookID WHERE bi.UserID = " + dr.GetValue(0).ToString());
                    GridView1.DataBind();

                    if (GridView1.Rows.Count > 0)
                    {
                        GridView1.UseAccessibleHeader = true;
                        GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
                        GridView1.FooterRow.TableSection = TableRowSection.TableFooter;
                    }

                }
            }
            else
            {
                GridView1.DataSource = null;
                GridView1.ShowHeaderWhenEmpty = true;
                GridView1.DataBind();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Error!', 'Student Number ID is invalid!', 'error')</script>");
            }
        }

        protected void add_Click(object sender, EventArgs e)
        {
            getDetailStudent();

            try
            {

                TimeSpan sub = Convert.ToDateTime(txtDueDate.Text) - Convert.ToDateTime(txtBorrowDate.Text);
                if (sub.Days < 1)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Due date must be greater Borrow date!', '', 'warning')</script>");
                } else if(sub.Days > 30)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('The maximum of borrowing date is 30 days!', '', 'warning')</script>");
                }
                else if (!checkBookCanBorrow())
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Warning!', 'This book can only read at library!', 'warning')</script>");
                }
                else if (checkStudentReturnedBook())
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Warning!', 'Student has not returned this book!', 'warning')</script>");
                }
                else if (!checkBookAvailale())
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Warning!', 'This book is not available, you can only reserser for this book!', 'warning')</script>");
                }
                else
                {
                    SqlConnection conn = new SqlConnection(strConn);
                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();
                    }
                    SqlCommand cmd1 = new SqlCommand("SELECT *, (SELECT AuthorName FROM dbo.Author WHERE AuthorID = bm.AuthorID) AS Author FROM dbo.BookMaster bm WHERE BookID = " + txtBookID.Text, conn);
                    SqlDataReader dreader = cmd1.ExecuteReader();
                    if (dreader.HasRows)
                    {
                        while (dreader.Read())
                        {
                            dt = (DataTable)Session["data"];
                            DataRow dr;

                            if (GridView2.Rows.Count >= 0 && GridView2.Rows.Count < 5)
                            {
                                if (checkBookInList())
                                {
                                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('BookID is existed in items!', '', 'warning')</script>");
                                }
                                else
                                {
                                    dr = dt.NewRow();
                                    dr["BookID"] = txtBookID.Text;
                                    dr["BookName"] = dreader.GetValue(1).ToString();
                                    dr["Total"] = txtTotal.Text;
                                    dr["BorrowDate"] = txtBorrowDate.Text;
                                    dr["DueDate"] = txtDueDate.Text;
                                    dr["BookCost"] = dreader.GetValue(8).ToString();

                                    dt.Rows.Add(dr);
                                    GridView2.DataSource = dt;
                                    GridView2.DataBind();
                                    if (GridView2.Rows.Count > 0)
                                    {
                                        GridView2.UseAccessibleHeader = true;
                                        GridView2.HeaderRow.TableSection = TableRowSection.TableHeader;
                                        GridView2.FooterRow.TableSection = TableRowSection.TableFooter;
                                    }

                                    txtBookID.Text = string.Empty;
                                    txtDueDate.Text = string.Empty;
                                }
                            }
                            else
                            {
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('You can only borrow maximum 5 books!', '', 'error')</script>");
                            }
                        }
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Invalid this book!', '', 'error')</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('" + ex.Message + "', '', 'error')</script>");
            }
        }

        //check canBorrow status
        protected bool checkBookCanBorrow()
        {
            SqlConnection conn = new SqlConnection(strConn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.BookMaster WHERE BookID = " + txtBookID.Text + " AND CanBorrow = 1", conn);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                return true;
            }
            else
            {
                return false;
            }
            conn.Close();
        }

        //check user is borrowing this book or not yet
        protected bool checkStudentReturnedBook()
        {
            SqlConnection conn = new SqlConnection(strConn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.BookIssue WHERE UserID = '" + txtUserID.Text + "' AND BookID = '" + txtBookID.Text + "' AND Status = 0", conn);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                return true;
            }
            else
            {
                return false;
            }
            conn.Close();
        }

        //check user is borrowing this book or not yet
        protected bool checkBookAvailale()
        {
            SqlConnection conn = new SqlConnection(strConn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.BookMaster bm WHERE BookID = '" + txtBookID.Text + "' AND bm.Available > 0", conn);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                return true;
            }
            else
            {
                return false;
            }
            conn.Close();
        }

        //check book in list add or not
        protected bool checkBookInList()
        {
            foreach (GridViewRow row in GridView2.Rows)
            {
                if (txtBookID.Text == row.Cells[0].Text)
                {
                    return true;
                }
            }

            return false;
        }

        protected void btnIssue_Click(object sender, EventArgs e)
        {
            getDetailStudent();
            try
            {
                if (GridView2.Rows.Count > 0)
                {
                    foreach (GridViewRow row in GridView2.Rows)
                    {
                        int userID = int.Parse(txtUserID.Text);
                        int bookID = int.Parse(row.Cells[0].Text);
                        int total = int.Parse(row.Cells[2].Text);
                        DateTime borrowDate = Convert.ToDateTime(row.Cells[3].Text);
                        DateTime dueDate = Convert.ToDateTime(row.Cells[4].Text);

                        SqlConnection conn = new SqlConnection(strConn);
                        if (conn.State == ConnectionState.Closed)
                        {
                            conn.Open();
                        }
                        SqlCommand cmd = new SqlCommand("INSERT INTO dbo.BookIssue ( UserID , BookID , BorrowedTotal , BorrowedDate , DueDate , Status ) \n"
                        + "VALUES('" + userID + "', '" + bookID + "' , '" + total + "' , '" + borrowDate + "' , '" + dueDate + "' , 0)\n"
                        + "UPDATE dbo.BookMaster SET Available = Available - 1 WHERE BookID = " + bookID, conn);
                        DAO.UpdateTable(cmd);
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('Book Issue Successful!', '', 'success')</script>");
                    }

                    GridView2.DataSource = new DataTable();
                    GridView2.DataBind();
                    GridView1.DataSource = new DataTable();
                    GridView1.DataBind();
                    txtNumberID.Text = string.Empty;
                    txtUserID.Text = string.Empty;
                    txtFullName.Text = string.Empty;
                    txtEmail.Text = string.Empty;
                    txtPhone.Text = string.Empty;
                    txtDob.Text = string.Empty;
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('No items in list!', '', 'warning')</script>");
                }

            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>swal('" + ex.Message + "', '', 'error')</script>");
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            GridView2.DataSource = new DataTable();
            GridView2.DataBind();
            Session.Remove("data");
            Response.Redirect("BookIssuing.aspx");
        }
    }
}
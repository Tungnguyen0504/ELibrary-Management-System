using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using LibrarySystem.Includes;
using LibrarySystem.Properties;
using System.IO;

namespace LibrarySystem
{
    public partial class frmReport : Form
    {
        public frmReport()
        {
            InitializeComponent();
        }

        SQLConfig config = new SQLConfig();
        usableFunction funct = new usableFunction();
        string sql;

        private void reports(string sql,string rptname)
        {
            try
            {
                config.loadReports(sql);
                string reportname, strReportPath;

                reportname = rptname;
                CrystalDecisions.CrystalReports.Engine.ReportDocument reportdoc = new CrystalDecisions.CrystalReports.Engine.ReportDocument();

                strReportPath = Application.StartupPath + "\\report\\" + reportname + ".rpt";
                reportdoc.Load(strReportPath);
                reportdoc.SetDataSource(config.dt);

                crystalReportViewer1.ReportSource = reportdoc;
                crystalReportViewer1.ShowRefreshButton = false;
                crystalReportViewer1.ShowCloseButton = false;
                crystalReportViewer1.ShowGroupTreeButton = false;
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message + " No crytal reports installed.");
            }
            
             
        }
        private void frmReport_Load(object sender, EventArgs e)
        {

        }

        private void btnListBooks_Click(object sender, EventArgs e)
        {
            sql = "SELECT `AccessionNo`, `BookTitle`, `BookDesc` as 'Description', `Author`, `PublishDate`, `BookPublisher`, `Category`, `BookPrice` as 'Price', `BookQuantity` as 'No.Copies', `Status`,`OverAllQty` FROM `tblbooks` b, `tblcategory` c WHERE b.`CategoryId`=c.`CategoryId`";
            reports(sql, "ListofBooks");
            rdoDaily.Checked = false;
            rdoWeekly.Checked = false;
            rdoMonthly.Checked = false;
        }

        private void btnTotalbooks_Click(object sender, EventArgs e)
        {
            sql = "SELECT * FROM `tblbooknumber`";
            reports(sql, "NumberofBooks");
        }

        private void rdoDaily_CheckedChanged(object sender, EventArgs e)
        {
            switch (cboStatus.Text)
            {
                case "Borrowed":
                    sql = "SELECT br.`AccessionNo`, `BookTitle`, `BookDesc` as 'Description',Concat(`Firstname`,' ', `Lastname`) as 'Borrower',`NoCopies`, `DateBorrowed`, `Purpose`, `DueDate` FROM `tblborrow` br,`tblbooks` b,`tblborrower` bw  WHERE br.AccessionNo=b.AccessionNo AND br.`BorrowerId`=bw.`BorrowerId` AND  Date(`DateBorrowed`) = CURDATE() ";
                    reports(sql, "DailyBorrowed");
                    break;
                case "Returned":
                    sql = "SELECT bw.`BorrowerId`, `Firstname`, `Lastname`,DateBorrowed,b.`AccessionNo`,`BookTitle`, `BookDesc`,r.`NoCopies`, `DateReturned`  FROM `tblreturn` r, `tblborrow` br,`tblborrower` bw, `tblbooks` b  WHERE r.`BorrowId`=br.`BorrowId` AND br.`AccessionNo`=b.`AccessionNo` AND br.`BorrowerId`=bw.`BorrowerId` AND br.`Status` = 'Returned' AND Date(`DateReturned`) = CURDATE() ";
                    reports(sql, "DailyReturned");
                    break;
                case "Overdue":
                    sql = "SELECT br.`AccessionNo`, `BookTitle`, `BookDesc` as 'Description',Concat(`Firstname`,' ', `Lastname`) as 'Borrower',`NoCopies`, `DateBorrowed`, `Purpose`, `DueDate` FROM `tblborrow` br,`tblbooks` b,`tblborrower` bw  WHERE br.AccessionNo=b.AccessionNo AND br.`BorrowerId`=bw.`BorrowerId` AND Remarks='Overdue'  AND Date(`DueDate`) = CURDATE() ";
                    reports(sql, "DailyDue");
                    break;
            } 

        }

        private void rdoWeekly_CheckedChanged(object sender, EventArgs e)
        {
            switch (cboStatus.Text)
            {
                case "Borrowed":
                    sql = "SELECT br.`AccessionNo`, `BookTitle`, `BookDesc` as 'Description',Concat(`Firstname`,' ', `Lastname`) as 'Borrower',`NoCopies`, `DateBorrowed`, `Purpose`, `DueDate` FROM `tblborrow` br,`tblbooks` b,`tblborrower` bw  WHERE br.AccessionNo=b.AccessionNo AND br.`BorrowerId`=bw.`BorrowerId` AND  DAYOFWEEK(  `DateBorrowed` ) IN ( 2, 3, 4, 5, 6 ) AND MONTH(DateBorrowed) = MONTH(Now())";
                    reports(sql, "WeeklyBorrowed");
                    break;
                case "Returned":
                    sql = "SELECT bw.`BorrowerId`, `Firstname`, `Lastname`,DateBorrowed,b.`AccessionNo`,`BookTitle`, `BookDesc`,r.`NoCopies`, `DateReturned`  FROM `tblreturn` r, `tblborrow` br,`tblborrower` bw, `tblbooks` b  WHERE r.`BorrowId`=br.`BorrowId` AND br.`AccessionNo`=b.`AccessionNo` AND br.`BorrowerId`=bw.`BorrowerId` AND br.`Status` = 'Returned' AND DAYOFWEEK(  `DateReturned` ) IN ( 2, 3, 4, 5, 6 ) AND MONTH(DateReturned) = MONTH(Now())";
                    reports(sql, "WeeklyReturned");
                    break;
                case "Overdue":
                    sql = "SELECT br.`AccessionNo`, `BookTitle`, `BookDesc` as 'Description',Concat(`Firstname`,' ', `Lastname`) as 'Borrower',`NoCopies`, `DateBorrowed`, `Purpose`, `DueDate` FROM `tblborrow` br,`tblbooks` b,`tblborrower` bw  WHERE br.AccessionNo=b.AccessionNo AND br.`BorrowerId`=bw.`BorrowerId` AND Remarks='Overdue' AND DAYOFWEEK(  `DueDate` ) IN ( 2, 3, 4, 5, 6 ) AND MONTH(DueDate) = MONTH(Now())";
                    reports(sql, "WeeklyDue");
                    break;
            } 
        
        }

        private void rdoMonthly_CheckedChanged(object sender, EventArgs e)
        {
            switch (cboStatus.Text)
            {
                case "Borrowed":
                    sql = "SELECT br.`AccessionNo`, `BookTitle`, `BookDesc` as 'Description',Concat(`Firstname`,' ', `Lastname`) as 'Borrower',`NoCopies`, `DateBorrowed`, `Purpose`, `DueDate` FROM `tblborrow` br,`tblbooks` b,`tblborrower` bw  WHERE br.AccessionNo=b.AccessionNo AND br.`BorrowerId`=bw.`BorrowerId` AND MONTH(DateBorrowed) = MONTH(Now())";
                    reports(sql, "MonthlyBorrowed");
                    break;
                case "Returned":
                    sql = "SELECT bw.`BorrowerId`, `Firstname`, `Lastname`,DateBorrowed,b.`AccessionNo`,`BookTitle`, `BookDesc`,r.`NoCopies`, `DateReturned`  FROM `tblreturn` r, `tblborrow` br,`tblborrower` bw, `tblbooks` b  WHERE r.`BorrowId`=br.`BorrowId` AND br.`AccessionNo`=b.`AccessionNo` AND br.`BorrowerId`=bw.`BorrowerId` AND br.`Status` = 'Returned' AND MONTH(DateReturned) = MONTH(Now())";
                    reports(sql, "MonthlyReturned");
                    break;
                case "Overdue":
                    sql = "SELECT br.`AccessionNo`, `BookTitle`, `BookDesc` as 'Description',Concat(`Firstname`,' ', `Lastname`) as 'Borrower',`NoCopies`, `DateBorrowed`, `Purpose`, `DueDate` FROM `tblborrow` br,`tblbooks` b,`tblborrower` bw  WHERE br.AccessionNo=b.AccessionNo AND br.`BorrowerId`=bw.`BorrowerId` AND Remarks='Overdue' AND  MONTH(DueDate) = MONTH(Now())";
                    reports(sql, "MonthlyDue");
                    break;
            } 
        }

        private void btn_preview_Click(object sender, EventArgs e)
        {
            rdoDaily.Checked = false;
            rdoWeekly.Checked = false;
            rdoMonthly.Checked = false;

            switch (cboStatus.Text) {
                case "Borrowed":
                    sql = "SELECT br.`AccessionNo`, `BookTitle`, `BookDesc` as 'Description',Concat(`Firstname`,' ', `Lastname`) as 'Borrower',`NoCopies`, `DateBorrowed`, `Purpose`, `DueDate` FROM `tblborrow` br,`tblbooks` b,`tblborrower` bw  WHERE br.AccessionNo=b.AccessionNo AND br.`BorrowerId`=bw.`BorrowerId` AND  DATE(DateBorrowed) BETWEEN '" + dtp_strtDate.Text + "' AND '" + dtp_endDate.Text + "'";
                    reports(sql, "DateFilterBorrowed");
                    break;

                case "Returned":
                    sql = "SELECT bw.`BorrowerId`, `Firstname`, `Lastname`,DateBorrowed,b.`AccessionNo`,`BookTitle`, `BookDesc`,r.`NoCopies`, `DateReturned`  FROM `tblreturn` r, `tblborrow` br,`tblborrower` bw, `tblbooks` b  WHERE r.`BorrowId`=br.`BorrowId` AND br.`AccessionNo`=b.`AccessionNo` AND br.`BorrowerId`=bw.`BorrowerId` AND br.`Status` = 'Returned' AND  DATE(DateReturned) BETWEEN '" + dtp_strtDate.Text + "' AND '" + dtp_endDate.Text + "' ";
                    reports(sql, "DateFilterReturned");
                    break;

                case "Overdue":
                    sql = "SELECT br.`AccessionNo`, `BookTitle`, `BookDesc` as 'Description',Concat(`Firstname`,' ', `Lastname`) as 'Borrower',`NoCopies`, `DateBorrowed`, `Purpose`, `DueDate` FROM `tblborrow` br,`tblbooks` b,`tblborrower` bw  WHERE br.AccessionNo=b.AccessionNo AND br.`BorrowerId`=bw.`BorrowerId` AND Remarks='Overdue'  AND DATE(DueDate) BETWEEN '" + dtp_strtDate.Text + "' AND '" + dtp_endDate.Text + "'";
                    reports(sql, "DateFilterDue");
                    break;
            }

 
        }
    }
}

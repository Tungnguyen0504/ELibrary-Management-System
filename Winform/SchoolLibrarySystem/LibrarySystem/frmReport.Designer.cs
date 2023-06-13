namespace LibrarySystem
{
    partial class frmReport
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dtp_endDate = new System.Windows.Forms.DateTimePicker();
            this.btn_preview = new System.Windows.Forms.Button();
            this.btnTotalbooks = new System.Windows.Forms.Button();
            this.btnListBooks = new System.Windows.Forms.Button();
            this.rdoMonthly = new System.Windows.Forms.RadioButton();
            this.rdoWeekly = new System.Windows.Forms.RadioButton();
            this.rdoDaily = new System.Windows.Forms.RadioButton();
            this.dtp_strtDate = new System.Windows.Forms.DateTimePicker();
            this.Label2 = new System.Windows.Forms.Label();
            this.Label3 = new System.Windows.Forms.Label();
            this.Label1 = new System.Windows.Forms.Label();
            this.cboStatus = new System.Windows.Forms.ComboBox();
            this.GroupBox1 = new System.Windows.Forms.GroupBox();
            this.FlowLayoutPanel1 = new System.Windows.Forms.FlowLayoutPanel();
            this.GroupBox2 = new System.Windows.Forms.GroupBox();
            this.crystalReportViewer1 = new CrystalDecisions.Windows.Forms.CrystalReportViewer();
            this.GroupBox1.SuspendLayout();
            this.FlowLayoutPanel1.SuspendLayout();
            this.GroupBox2.SuspendLayout();
            this.SuspendLayout();
            // 
            // dtp_endDate
            // 
            this.dtp_endDate.CustomFormat = "yyyy-MM-dd";
            this.dtp_endDate.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtp_endDate.Location = new System.Drawing.Point(10, 89);
            this.dtp_endDate.Name = "dtp_endDate";
            this.dtp_endDate.Size = new System.Drawing.Size(132, 20);
            this.dtp_endDate.TabIndex = 17;
            // 
            // btn_preview
            // 
            this.btn_preview.Location = new System.Drawing.Point(64, 120);
            this.btn_preview.Name = "btn_preview";
            this.btn_preview.Size = new System.Drawing.Size(78, 28);
            this.btn_preview.TabIndex = 15;
            this.btn_preview.Text = "Preview";
            this.btn_preview.UseVisualStyleBackColor = true;
            this.btn_preview.Click += new System.EventHandler(this.btn_preview_Click);
            // 
            // btnTotalbooks
            // 
            this.btnTotalbooks.Location = new System.Drawing.Point(10, 53);
            this.btnTotalbooks.Name = "btnTotalbooks";
            this.btnTotalbooks.Size = new System.Drawing.Size(133, 22);
            this.btnTotalbooks.TabIndex = 3;
            this.btnTotalbooks.Text = "Total No. of Books";
            this.btnTotalbooks.UseVisualStyleBackColor = true;
            this.btnTotalbooks.Click += new System.EventHandler(this.btnTotalbooks_Click);
            // 
            // btnListBooks
            // 
            this.btnListBooks.Location = new System.Drawing.Point(9, 25);
            this.btnListBooks.Name = "btnListBooks";
            this.btnListBooks.Size = new System.Drawing.Size(133, 22);
            this.btnListBooks.TabIndex = 2;
            this.btnListBooks.Text = "List of Books";
            this.btnListBooks.UseVisualStyleBackColor = true;
            this.btnListBooks.Click += new System.EventHandler(this.btnListBooks_Click);
            // 
            // rdoMonthly
            // 
            this.rdoMonthly.AutoSize = true;
            this.rdoMonthly.Location = new System.Drawing.Point(24, 186);
            this.rdoMonthly.Name = "rdoMonthly";
            this.rdoMonthly.Size = new System.Drawing.Size(97, 17);
            this.rdoMonthly.TabIndex = 2;
            this.rdoMonthly.TabStop = true;
            this.rdoMonthly.Text = "Monthly Report";
            this.rdoMonthly.UseVisualStyleBackColor = true;
            this.rdoMonthly.CheckedChanged += new System.EventHandler(this.rdoMonthly_CheckedChanged);
            // 
            // rdoWeekly
            // 
            this.rdoWeekly.AutoSize = true;
            this.rdoWeekly.Location = new System.Drawing.Point(24, 163);
            this.rdoWeekly.Name = "rdoWeekly";
            this.rdoWeekly.Size = new System.Drawing.Size(96, 17);
            this.rdoWeekly.TabIndex = 2;
            this.rdoWeekly.TabStop = true;
            this.rdoWeekly.Text = "Weekly Report";
            this.rdoWeekly.UseVisualStyleBackColor = true;
            this.rdoWeekly.CheckedChanged += new System.EventHandler(this.rdoWeekly_CheckedChanged);
            // 
            // rdoDaily
            // 
            this.rdoDaily.AutoSize = true;
            this.rdoDaily.Location = new System.Drawing.Point(24, 140);
            this.rdoDaily.Name = "rdoDaily";
            this.rdoDaily.Size = new System.Drawing.Size(83, 17);
            this.rdoDaily.TabIndex = 2;
            this.rdoDaily.TabStop = true;
            this.rdoDaily.Text = "Daily Report";
            this.rdoDaily.UseVisualStyleBackColor = true;
            this.rdoDaily.CheckedChanged += new System.EventHandler(this.rdoDaily_CheckedChanged);
            // 
            // dtp_strtDate
            // 
            this.dtp_strtDate.CustomFormat = "yyyy-MM-dd";
            this.dtp_strtDate.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtp_strtDate.Location = new System.Drawing.Point(10, 41);
            this.dtp_strtDate.Name = "dtp_strtDate";
            this.dtp_strtDate.Size = new System.Drawing.Size(132, 20);
            this.dtp_strtDate.TabIndex = 14;
            // 
            // Label2
            // 
            this.Label2.AutoSize = true;
            this.Label2.Location = new System.Drawing.Point(10, 26);
            this.Label2.Name = "Label2";
            this.Label2.Size = new System.Drawing.Size(61, 13);
            this.Label2.TabIndex = 16;
            this.Label2.Text = "Start Date :";
            // 
            // Label3
            // 
            this.Label3.AutoSize = true;
            this.Label3.Location = new System.Drawing.Point(10, 73);
            this.Label3.Name = "Label3";
            this.Label3.Size = new System.Drawing.Size(58, 13);
            this.Label3.TabIndex = 18;
            this.Label3.Text = "End Date :";
            // 
            // Label1
            // 
            this.Label1.AutoSize = true;
            this.Label1.Location = new System.Drawing.Point(7, 84);
            this.Label1.Name = "Label1";
            this.Label1.Size = new System.Drawing.Size(43, 13);
            this.Label1.TabIndex = 1;
            this.Label1.Text = "Status :";
            // 
            // cboStatus
            // 
            this.cboStatus.FormattingEnabled = true;
            this.cboStatus.Items.AddRange(new object[] {
            "Borrowed",
            "Returned",
            "Overdue"});
            this.cboStatus.Location = new System.Drawing.Point(6, 103);
            this.cboStatus.Name = "cboStatus";
            this.cboStatus.Size = new System.Drawing.Size(137, 21);
            this.cboStatus.TabIndex = 0;
            this.cboStatus.Text = "Borrowed";
            // 
            // GroupBox1
            // 
            this.GroupBox1.Controls.Add(this.btnTotalbooks);
            this.GroupBox1.Controls.Add(this.btnListBooks);
            this.GroupBox1.Controls.Add(this.rdoMonthly);
            this.GroupBox1.Controls.Add(this.rdoWeekly);
            this.GroupBox1.Controls.Add(this.rdoDaily);
            this.GroupBox1.Controls.Add(this.Label1);
            this.GroupBox1.Controls.Add(this.cboStatus);
            this.GroupBox1.Location = new System.Drawing.Point(3, 3);
            this.GroupBox1.Name = "GroupBox1";
            this.GroupBox1.Size = new System.Drawing.Size(152, 229);
            this.GroupBox1.TabIndex = 0;
            this.GroupBox1.TabStop = false;
            this.GroupBox1.Text = "Books";
            // 
            // FlowLayoutPanel1
            // 
            this.FlowLayoutPanel1.Controls.Add(this.GroupBox1);
            this.FlowLayoutPanel1.Controls.Add(this.GroupBox2);
            this.FlowLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Left;
            this.FlowLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.FlowLayoutPanel1.Name = "FlowLayoutPanel1";
            this.FlowLayoutPanel1.Size = new System.Drawing.Size(161, 551);
            this.FlowLayoutPanel1.TabIndex = 3;
            // 
            // GroupBox2
            // 
            this.GroupBox2.Controls.Add(this.dtp_strtDate);
            this.GroupBox2.Controls.Add(this.Label2);
            this.GroupBox2.Controls.Add(this.Label3);
            this.GroupBox2.Controls.Add(this.dtp_endDate);
            this.GroupBox2.Controls.Add(this.btn_preview);
            this.GroupBox2.Location = new System.Drawing.Point(3, 238);
            this.GroupBox2.Name = "GroupBox2";
            this.GroupBox2.Size = new System.Drawing.Size(152, 162);
            this.GroupBox2.TabIndex = 2;
            this.GroupBox2.TabStop = false;
            this.GroupBox2.Text = "Date Filter";
            // 
            // crystalReportViewer1
            // 
            this.crystalReportViewer1.ActiveViewIndex = -1;
            this.crystalReportViewer1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.crystalReportViewer1.Cursor = System.Windows.Forms.Cursors.Default;
            this.crystalReportViewer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.crystalReportViewer1.Location = new System.Drawing.Point(161, 0);
            this.crystalReportViewer1.Name = "crystalReportViewer1";
            this.crystalReportViewer1.Size = new System.Drawing.Size(727, 551);
            this.crystalReportViewer1.TabIndex = 4;
            // 
            // frmReport
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(888, 551);
            this.Controls.Add(this.crystalReportViewer1);
            this.Controls.Add(this.FlowLayoutPanel1);
            this.Name = "frmReport";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Inventory Reports";
            this.Load += new System.EventHandler(this.frmReport_Load);
            this.GroupBox1.ResumeLayout(false);
            this.GroupBox1.PerformLayout();
            this.FlowLayoutPanel1.ResumeLayout(false);
            this.GroupBox2.ResumeLayout(false);
            this.GroupBox2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion
        internal System.Windows.Forms.DateTimePicker dtp_endDate;
        internal System.Windows.Forms.Button btn_preview;
        internal System.Windows.Forms.Button btnTotalbooks;
        internal System.Windows.Forms.Button btnListBooks;
        internal System.Windows.Forms.RadioButton rdoMonthly;
        internal System.Windows.Forms.RadioButton rdoWeekly;
        internal System.Windows.Forms.RadioButton rdoDaily;
        internal System.Windows.Forms.DateTimePicker dtp_strtDate;
        internal System.Windows.Forms.Label Label2;
        internal System.Windows.Forms.Label Label3;
        internal System.Windows.Forms.Label Label1;
        internal System.Windows.Forms.ComboBox cboStatus;
        internal System.Windows.Forms.GroupBox GroupBox1;
        internal System.Windows.Forms.FlowLayoutPanel FlowLayoutPanel1;
        internal System.Windows.Forms.GroupBox GroupBox2;
        private CrystalDecisions.Windows.Forms.CrystalReportViewer crystalReportViewer1;
    }
}
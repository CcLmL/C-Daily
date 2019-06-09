namespace Web2ASPNET2.Setup
{
	partial class mailForm
	{
		/// <summary>
		/// 必需的设计器变量。
		/// </summary>
		private System.ComponentModel.IContainer components = null;

		/// <summary>
		/// 清理所有正在使用的资源。
		/// </summary>
		/// <param name="disposing">如果应释放托管资源，为 true；否则为 false。</param>
		protected override void Dispose(bool disposing)
		{
			if(disposing && (components != null))
			{
				components.Dispose();
			}
			base.Dispose(disposing);
		}

		#region Windows 窗体设计器生成的代码

		/// <summary>
		/// 设计器支持所需的方法 - 不要
		/// 使用代码编辑器修改此方法的内容。
		/// </summary>
		private void InitializeComponent()
		{
			System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(mailForm));
			this.topPanel = new System.Windows.Forms.Panel();
			this.bottomPanel = new System.Windows.Forms.Panel();
			this.finishButton = new System.Windows.Forms.Button();
			this.nextButton = new System.Windows.Forms.Button();
			this.prevButton = new System.Windows.Forms.Button();
			this.mainPanel = new System.Windows.Forms.Panel();
			this.leftPanel = new System.Windows.Forms.Panel();
			this.label1 = new System.Windows.Forms.Label();
			this.finishUC = new Web2ASPNET2.Setup.UserControls.FinishUC();
			this.webSetupUC = new Web2ASPNET2.Setup.UserControls.WebSetupUC();
			this.prepareUC = new Web2ASPNET2.Setup.UserControls.PrepareUC();
			this.databaseUC = new Web2ASPNET2.Setup.UserControls.DatabaseUC();
			this.finStatusUC = new Web2ASPNET2.Setup.UserControls.StatusUC();
			this.ajaxMailStatusUC = new Web2ASPNET2.Setup.UserControls.StatusUC();
			this.bbsStatusUC = new Web2ASPNET2.Setup.UserControls.StatusUC();
			this.storeStatusUC = new Web2ASPNET2.Setup.UserControls.StatusUC();
			this.tagStatusUC = new Web2ASPNET2.Setup.UserControls.StatusUC();
			this.blogStatusUC = new Web2ASPNET2.Setup.UserControls.StatusUC();
			this.rssStatusUC = new Web2ASPNET2.Setup.UserControls.StatusUC();
			this.dbStatusUC = new Web2ASPNET2.Setup.UserControls.StatusUC();
			this.preStatusUC = new Web2ASPNET2.Setup.UserControls.StatusUC();
			this.topPanel.SuspendLayout();
			this.bottomPanel.SuspendLayout();
			this.mainPanel.SuspendLayout();
			this.leftPanel.SuspendLayout();
			this.SuspendLayout();
			// 
			// topPanel
			// 
			this.topPanel.Controls.Add(this.label1);
			this.topPanel.Dock = System.Windows.Forms.DockStyle.Top;
			this.topPanel.Location = new System.Drawing.Point(0,0);
			this.topPanel.Name = "topPanel";
			this.topPanel.Size = new System.Drawing.Size(592,50);
			this.topPanel.TabIndex = 0;
			this.topPanel.Paint += new System.Windows.Forms.PaintEventHandler(this.topPanel_Paint);
			// 
			// bottomPanel
			// 
			this.bottomPanel.Controls.Add(this.finishButton);
			this.bottomPanel.Controls.Add(this.nextButton);
			this.bottomPanel.Controls.Add(this.prevButton);
			this.bottomPanel.Dock = System.Windows.Forms.DockStyle.Bottom;
			this.bottomPanel.Location = new System.Drawing.Point(0,323);
			this.bottomPanel.Name = "bottomPanel";
			this.bottomPanel.Size = new System.Drawing.Size(592,39);
			this.bottomPanel.TabIndex = 1;
			this.bottomPanel.Paint += new System.Windows.Forms.PaintEventHandler(this.bottomPanel_Paint);
			// 
			// finishButton
			// 
			this.finishButton.Enabled = false;
			this.finishButton.Location = new System.Drawing.Point(483,8);
			this.finishButton.Name = "finishButton";
			this.finishButton.Size = new System.Drawing.Size(95,23);
			this.finishButton.TabIndex = 2;
			this.finishButton.Text = "完成 (&F)";
			this.finishButton.UseVisualStyleBackColor = true;
			this.finishButton.Click += new System.EventHandler(this.finishButton_Click);
			// 
			// nextButton
			// 
			this.nextButton.Location = new System.Drawing.Point(375,8);
			this.nextButton.Name = "nextButton";
			this.nextButton.Size = new System.Drawing.Size(95,23);
			this.nextButton.TabIndex = 1;
			this.nextButton.Text = "下一步 >>(&N)";
			this.nextButton.UseVisualStyleBackColor = true;
			this.nextButton.Click += new System.EventHandler(this.nextButton_Click);
			// 
			// prevButton
			// 
			this.prevButton.Enabled = false;
			this.prevButton.Location = new System.Drawing.Point(265,8);
			this.prevButton.Name = "prevButton";
			this.prevButton.Size = new System.Drawing.Size(95,23);
			this.prevButton.TabIndex = 0;
			this.prevButton.Text = "<< 上一步(&P)";
			this.prevButton.UseVisualStyleBackColor = true;
			this.prevButton.Click += new System.EventHandler(this.prevButton_Click);
			// 
			// mainPanel
			// 
			this.mainPanel.Controls.Add(this.finishUC);
			this.mainPanel.Controls.Add(this.webSetupUC);
			this.mainPanel.Controls.Add(this.prepareUC);
			this.mainPanel.Controls.Add(this.databaseUC);
			this.mainPanel.Dock = System.Windows.Forms.DockStyle.Fill;
			this.mainPanel.Location = new System.Drawing.Point(173,50);
			this.mainPanel.Margin = new System.Windows.Forms.Padding(0);
			this.mainPanel.Name = "mainPanel";
			this.mainPanel.Size = new System.Drawing.Size(419,273);
			this.mainPanel.TabIndex = 2;
			// 
			// leftPanel
			// 
			this.leftPanel.Controls.Add(this.finStatusUC);
			this.leftPanel.Controls.Add(this.ajaxMailStatusUC);
			this.leftPanel.Controls.Add(this.bbsStatusUC);
			this.leftPanel.Controls.Add(this.storeStatusUC);
			this.leftPanel.Controls.Add(this.tagStatusUC);
			this.leftPanel.Controls.Add(this.blogStatusUC);
			this.leftPanel.Controls.Add(this.rssStatusUC);
			this.leftPanel.Controls.Add(this.dbStatusUC);
			this.leftPanel.Controls.Add(this.preStatusUC);
			this.leftPanel.Dock = System.Windows.Forms.DockStyle.Left;
			this.leftPanel.Location = new System.Drawing.Point(0,50);
			this.leftPanel.Name = "leftPanel";
			this.leftPanel.Size = new System.Drawing.Size(173,273);
			this.leftPanel.TabIndex = 3;
			this.leftPanel.Paint += new System.Windows.Forms.PaintEventHandler(this.leftPanel_Paint);
			// 
			// label1
			// 
			this.label1.Dock = System.Windows.Forms.DockStyle.Top;
			this.label1.Font = new System.Drawing.Font("楷体_GB2312",14F,((System.Drawing.FontStyle)(((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic)
							| System.Drawing.FontStyle.Underline))),System.Drawing.GraphicsUnit.Point,((byte)(134)),true);
			this.label1.ForeColor = System.Drawing.SystemColors.ActiveCaption;
			this.label1.Location = new System.Drawing.Point(0,0);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(592,47);
			this.label1.TabIndex = 0;
			this.label1.Text = "欢迎使用Web 2.0+ASP.NET 2.0网络应用程序安装程序！！！";
			this.label1.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
			// 
			// finishUC
			// 
			this.finishUC.Location = new System.Drawing.Point(0,0);
			this.finishUC.Name = "finishUC";
			this.finishUC.Size = new System.Drawing.Size(420,274);
			this.finishUC.TabIndex = 3;
			this.finishUC.Visible = false;
			// 
			// webSetupUC
			// 
			this.webSetupUC.Location = new System.Drawing.Point(0,0);
			this.webSetupUC.Name = "webSetupUC";
			this.webSetupUC.Size = new System.Drawing.Size(420,274);
			this.webSetupUC.TabIndex = 2;
			this.webSetupUC.Title = "正在准备安装:";
			// 
			// prepareUC
			// 
			this.prepareUC.Location = new System.Drawing.Point(0,0);
			this.prepareUC.Name = "prepareUC";
			this.prepareUC.Size = new System.Drawing.Size(420,274);
			this.prepareUC.TabIndex = 1;
			// 
			// databaseUC
			// 
			this.databaseUC.Location = new System.Drawing.Point(0,0);
			this.databaseUC.Name = "databaseUC";
			this.databaseUC.Server = "ZHENGYD";
			this.databaseUC.Size = new System.Drawing.Size(420,274);
			this.databaseUC.TabIndex = 0;
			// 
			// finStatusUC
			// 
			this.finStatusUC.Location = new System.Drawing.Point(17,225);
			this.finStatusUC.Name = "finStatusUC";
			this.finStatusUC.Size = new System.Drawing.Size(150,20);
			this.finStatusUC.TabIndex = 8;
			this.finStatusUC.Title = "完成安装";
			this.finStatusUC.TitleImage = null;
			// 
			// ajaxMailStatusUC
			// 
			this.ajaxMailStatusUC.Location = new System.Drawing.Point(17,199);
			this.ajaxMailStatusUC.Name = "ajaxMailStatusUC";
			this.ajaxMailStatusUC.Size = new System.Drawing.Size(150,20);
			this.ajaxMailStatusUC.TabIndex = 7;
			this.ajaxMailStatusUC.Title = "安装ASPNETAjaxMail";
			this.ajaxMailStatusUC.TitleImage = null;
			// 
			// bbsStatusUC
			// 
			this.bbsStatusUC.Location = new System.Drawing.Point(17,173);
			this.bbsStatusUC.Name = "bbsStatusUC";
			this.bbsStatusUC.Size = new System.Drawing.Size(150,20);
			this.bbsStatusUC.TabIndex = 6;
			this.bbsStatusUC.Title = "安装XMLBBS";
			this.bbsStatusUC.TitleImage = null;
			// 
			// storeStatusUC
			// 
			this.storeStatusUC.Location = new System.Drawing.Point(17,147);
			this.storeStatusUC.Name = "storeStatusUC";
			this.storeStatusUC.Size = new System.Drawing.Size(150,20);
			this.storeStatusUC.TabIndex = 5;
			this.storeStatusUC.Title = "安装WebStore";
			this.storeStatusUC.TitleImage = null;
			// 
			// tagStatusUC
			// 
			this.tagStatusUC.Location = new System.Drawing.Point(17,121);
			this.tagStatusUC.Name = "tagStatusUC";
			this.tagStatusUC.Size = new System.Drawing.Size(150,20);
			this.tagStatusUC.TabIndex = 4;
			this.tagStatusUC.Title = "安装WebTags";
			this.tagStatusUC.TitleImage = null;
			// 
			// blogStatusUC
			// 
			this.blogStatusUC.Location = new System.Drawing.Point(17,95);
			this.blogStatusUC.Name = "blogStatusUC";
			this.blogStatusUC.Size = new System.Drawing.Size(150,20);
			this.blogStatusUC.TabIndex = 3;
			this.blogStatusUC.Title = "安装Blog";
			this.blogStatusUC.TitleImage = null;
			// 
			// rssStatusUC
			// 
			this.rssStatusUC.Location = new System.Drawing.Point(17,69);
			this.rssStatusUC.Name = "rssStatusUC";
			this.rssStatusUC.Size = new System.Drawing.Size(150,20);
			this.rssStatusUC.TabIndex = 2;
			this.rssStatusUC.Title = "安装RSS";
			this.rssStatusUC.TitleImage = null;
			// 
			// dbStatusUC
			// 
			this.dbStatusUC.Location = new System.Drawing.Point(17,43);
			this.dbStatusUC.Name = "dbStatusUC";
			this.dbStatusUC.Size = new System.Drawing.Size(150,20);
			this.dbStatusUC.TabIndex = 1;
			this.dbStatusUC.Title = "安装数据库";
			this.dbStatusUC.TitleImage = null;
			// 
			// preStatusUC
			// 
			this.preStatusUC.Location = new System.Drawing.Point(17,17);
			this.preStatusUC.Name = "preStatusUC";
			this.preStatusUC.Size = new System.Drawing.Size(150,20);
			this.preStatusUC.TabIndex = 0;
			this.preStatusUC.Title = "准备安装...";
			this.preStatusUC.TitleImage = ((System.Drawing.Image)(resources.GetObject("preStatusUC.TitleImage")));
			// 
			// mailForm
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F,12F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(592,362);
			this.Controls.Add(this.mainPanel);
			this.Controls.Add(this.leftPanel);
			this.Controls.Add(this.bottomPanel);
			this.Controls.Add(this.topPanel);
			this.MaximizeBox = false;
			this.MaximumSize = new System.Drawing.Size(600,396);
			this.MinimumSize = new System.Drawing.Size(600,396);
			this.Name = "mailForm";
			this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
			this.Text = "Web 2.0+ASP.NET 2.0网络应用系统安装程序";
			this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.mailForm_FormClosing);
			this.topPanel.ResumeLayout(false);
			this.bottomPanel.ResumeLayout(false);
			this.mainPanel.ResumeLayout(false);
			this.leftPanel.ResumeLayout(false);
			this.ResumeLayout(false);

		}

		#endregion

		private System.Windows.Forms.Panel topPanel;
		private System.Windows.Forms.Panel bottomPanel;
		private System.Windows.Forms.Button finishButton;
		private System.Windows.Forms.Button nextButton;
		private System.Windows.Forms.Button prevButton;
		private System.Windows.Forms.Panel mainPanel;
		private System.Windows.Forms.Panel leftPanel;
		private Web2ASPNET2.Setup.UserControls.StatusUC preStatusUC;
		private Web2ASPNET2.Setup.UserControls.StatusUC ajaxMailStatusUC;
		private Web2ASPNET2.Setup.UserControls.StatusUC bbsStatusUC;
		private Web2ASPNET2.Setup.UserControls.StatusUC storeStatusUC;
		private Web2ASPNET2.Setup.UserControls.StatusUC tagStatusUC;
		private Web2ASPNET2.Setup.UserControls.StatusUC blogStatusUC;
		private Web2ASPNET2.Setup.UserControls.StatusUC rssStatusUC;
		private Web2ASPNET2.Setup.UserControls.StatusUC dbStatusUC;
		private Web2ASPNET2.Setup.UserControls.StatusUC finStatusUC;
		private Web2ASPNET2.Setup.UserControls.DatabaseUC databaseUC;
		private Web2ASPNET2.Setup.UserControls.PrepareUC prepareUC;
		private Web2ASPNET2.Setup.UserControls.WebSetupUC webSetupUC;
		private Web2ASPNET2.Setup.UserControls.FinishUC finishUC;
		private System.Windows.Forms.Label label1;
	}
}


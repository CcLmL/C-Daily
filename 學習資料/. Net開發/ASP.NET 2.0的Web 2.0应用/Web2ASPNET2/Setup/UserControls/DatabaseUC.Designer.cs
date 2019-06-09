namespace Web2ASPNET2.Setup.UserControls
{
	partial class DatabaseUC
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

		#region 组件设计器生成的代码

		/// <summary> 
		/// 设计器支持所需的方法 - 不要
		/// 使用代码编辑器修改此方法的内容。
		/// </summary>
		private void InitializeComponent()
		{
			this.lbUsername = new System.Windows.Forms.Label();
			this.tbUsername = new System.Windows.Forms.TextBox();
			this.tbPassword = new System.Windows.Forms.TextBox();
			this.lbPassword = new System.Windows.Forms.Label();
			this.gbDatabase = new System.Windows.Forms.GroupBox();
			this.tbServer = new System.Windows.Forms.TextBox();
			this.lbServer = new System.Windows.Forms.Label();
			this.gbDatabase.SuspendLayout();
			this.SuspendLayout();
			// 
			// lbUsername
			// 
			this.lbUsername.AutoSize = true;
			this.lbUsername.Location = new System.Drawing.Point(6,26);
			this.lbUsername.Name = "lbUsername";
			this.lbUsername.Size = new System.Drawing.Size(59,12);
			this.lbUsername.TabIndex = 0;
			this.lbUsername.Text = "用户名称:";
			// 
			// tbUsername
			// 
			this.tbUsername.Location = new System.Drawing.Point(71,23);
			this.tbUsername.Name = "tbUsername";
			this.tbUsername.Size = new System.Drawing.Size(170,21);
			this.tbUsername.TabIndex = 1;
			this.tbUsername.Text = "sa";
			// 
			// tbPassword
			// 
			this.tbPassword.Location = new System.Drawing.Point(71,60);
			this.tbPassword.Name = "tbPassword";
			this.tbPassword.PasswordChar = '*';
			this.tbPassword.Size = new System.Drawing.Size(170,21);
			this.tbPassword.TabIndex = 3;
			// 
			// lbPassword
			// 
			this.lbPassword.AutoSize = true;
			this.lbPassword.Location = new System.Drawing.Point(6,63);
			this.lbPassword.Name = "lbPassword";
			this.lbPassword.Size = new System.Drawing.Size(59,12);
			this.lbPassword.TabIndex = 2;
			this.lbPassword.Text = "登录密码:";
			// 
			// gbDatabase
			// 
			this.gbDatabase.Controls.Add(this.tbServer);
			this.gbDatabase.Controls.Add(this.lbServer);
			this.gbDatabase.Controls.Add(this.lbUsername);
			this.gbDatabase.Controls.Add(this.tbPassword);
			this.gbDatabase.Controls.Add(this.tbUsername);
			this.gbDatabase.Controls.Add(this.lbPassword);
			this.gbDatabase.Location = new System.Drawing.Point(29,63);
			this.gbDatabase.Name = "gbDatabase";
			this.gbDatabase.Size = new System.Drawing.Size(359,136);
			this.gbDatabase.TabIndex = 4;
			this.gbDatabase.TabStop = false;
			this.gbDatabase.Text = "请输入登录数据库的用户名称和密码:";
			// 
			// tbServer
			// 
			this.tbServer.Location = new System.Drawing.Point(71,98);
			this.tbServer.Name = "tbServer";
			this.tbServer.Size = new System.Drawing.Size(170,21);
			this.tbServer.TabIndex = 5;
			// 
			// lbServer
			// 
			this.lbServer.Location = new System.Drawing.Point(6,101);
			this.lbServer.Name = "lbServer";
			this.lbServer.Size = new System.Drawing.Size(59,12);
			this.lbServer.TabIndex = 4;
			this.lbServer.Text = "服务器:";
			this.lbServer.TextAlign = System.Drawing.ContentAlignment.TopRight;
			// 
			// DatabaseUC
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F,12F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.Controls.Add(this.gbDatabase);
			this.Name = "DatabaseUC";
			this.Load += new System.EventHandler(this.DatabaseUC_Load);
			this.gbDatabase.ResumeLayout(false);
			this.gbDatabase.PerformLayout();
			this.ResumeLayout(false);

		}

		#endregion

		private System.Windows.Forms.Label lbUsername;
		private System.Windows.Forms.TextBox tbUsername;
		private System.Windows.Forms.TextBox tbPassword;
		private System.Windows.Forms.Label lbPassword;
		private System.Windows.Forms.GroupBox gbDatabase;
		private System.Windows.Forms.TextBox tbServer;
		private System.Windows.Forms.Label lbServer;
	}
}

namespace Web2ASPNET2.Setup.UserControls
{
	partial class StatusUC
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
			this.leftPictureBox = new System.Windows.Forms.PictureBox();
			this.titleLabel = new System.Windows.Forms.Label();
			((System.ComponentModel.ISupportInitialize)(this.leftPictureBox)).BeginInit();
			this.SuspendLayout();
			// 
			// leftPictureBox
			// 
			this.leftPictureBox.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
			this.leftPictureBox.Dock = System.Windows.Forms.DockStyle.Left;
			this.leftPictureBox.Location = new System.Drawing.Point(0,0);
			this.leftPictureBox.Margin = new System.Windows.Forms.Padding(3,3,3,0);
			this.leftPictureBox.Name = "leftPictureBox";
			this.leftPictureBox.Size = new System.Drawing.Size(20,20);
			this.leftPictureBox.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
			this.leftPictureBox.TabIndex = 0;
			this.leftPictureBox.TabStop = false;
			// 
			// titleLabel
			// 
			this.titleLabel.Dock = System.Windows.Forms.DockStyle.Fill;
			this.titleLabel.Location = new System.Drawing.Point(20,0);
			this.titleLabel.Name = "titleLabel";
			this.titleLabel.Size = new System.Drawing.Size(130,20);
			this.titleLabel.TabIndex = 1;
			this.titleLabel.Text = "安装数据库";
			this.titleLabel.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// StatusUC
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F,12F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.Controls.Add(this.titleLabel);
			this.Controls.Add(this.leftPictureBox);
			this.Name = "StatusUC";
			this.Size = new System.Drawing.Size(150,20);
			((System.ComponentModel.ISupportInitialize)(this.leftPictureBox)).EndInit();
			this.ResumeLayout(false);

		}

		#endregion

		private System.Windows.Forms.PictureBox leftPictureBox;
		private System.Windows.Forms.Label titleLabel;
	}
}

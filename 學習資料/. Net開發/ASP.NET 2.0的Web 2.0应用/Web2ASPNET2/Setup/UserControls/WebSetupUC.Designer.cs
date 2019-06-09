namespace Web2ASPNET2.Setup.UserControls
{
	partial class WebSetupUC
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
			this.gbPanel = new System.Windows.Forms.GroupBox();
			this.probSetup = new System.Windows.Forms.ProgressBar();
			this.gbPanel.SuspendLayout();
			this.SuspendLayout();
			// 
			// gbPanel
			// 
			this.gbPanel.Controls.Add(this.probSetup);
			this.gbPanel.Location = new System.Drawing.Point(31,69);
			this.gbPanel.Name = "gbPanel";
			this.gbPanel.Size = new System.Drawing.Size(359,136);
			this.gbPanel.TabIndex = 6;
			this.gbPanel.TabStop = false;
			this.gbPanel.Text = "正在准备安装:";
			// 
			// probSetup
			// 
			this.probSetup.Location = new System.Drawing.Point(15,57);
			this.probSetup.Name = "probSetup";
			this.probSetup.Size = new System.Drawing.Size(328,23);
			this.probSetup.TabIndex = 0;
			// 
			// WebSetupUC
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F,12F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.Controls.Add(this.gbPanel);
			this.Name = "WebSetupUC";
			this.gbPanel.ResumeLayout(false);
			this.ResumeLayout(false);

		}

		#endregion

		private System.Windows.Forms.GroupBox gbPanel;
		private System.Windows.Forms.ProgressBar probSetup;
	}
}

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using Web2ASPNET2.Setup.Component;
using Web2ASPNET2.Setup.UserControls;
using System.Diagnostics;
using System.Data.SqlClient;
using System.Data.Common;
using System.IO;

namespace Web2ASPNET2.Setup
{
	public partial class mailForm:Form
	{
		private SystemStatus curStatus = SystemStatus.Init;
		
		private Image successImage = Image.FromFile("Images/s.gif");
		private Image errrorImage = Image.FromFile("Images/delete.gif");
		private Image curImage = Image.FromFile("Images/rt.gif");
		private string database = "WEB2ASPNET2DB_Test";
		private string sqlFile = "WEB2ASPNET2DB_Test.sql";
		private string sqldataFile = "WEB2ASPNET2DB_Test_Data.sql";

		public mailForm()
		{
			InitializeComponent();
		}

		void leftPanel_Paint(object sender,PaintEventArgs e)
		{
			///设置控件属性的默认值
			Border3DSide border3DSide = Border3DSide.Right;
			Border3DStyle border3DStyle = Border3DStyle.Etched;

			///绘制自己定义的形状
			ControlPaint.DrawBorder3D(e.Graphics,e.ClipRectangle,border3DStyle,border3DSide);
		}

		void bottomPanel_Paint(object sender,PaintEventArgs e)
		{
			///设置控件属性的默认值
			Border3DSide border3DSide = Border3DSide.Top;
			Border3DStyle border3DStyle = Border3DStyle.Etched;

			///绘制自己定义的形状
			ControlPaint.DrawBorder3D(e.Graphics,e.ClipRectangle,border3DStyle,border3DSide);
		}

		private void topPanel_Paint(object sender,PaintEventArgs e)
		{
			///设置控件属性的默认值
			Border3DSide border3DSide = Border3DSide.Bottom;
			Border3DStyle border3DStyle = Border3DStyle.Etched;

			///绘制自己定义的形状
			ControlPaint.DrawBorder3D(e.Graphics,e.ClipRectangle,border3DStyle,border3DSide);
		}

		private bool ValidateDatabase(string username,string password,string server,string database,
			string slqFile,string dataFile)
		{   ///创建链接字符串
			SqlConnectionStringBuilder constringbuilder = new SqlConnectionStringBuilder();
			constringbuilder.DataSource = server;
			constringbuilder.Password = password;
			constringbuilder.UserID = username;
			
			///创建链接
			SqlConnection con = new SqlConnection(constringbuilder.ConnectionString);

			bool isValidate = false;
			try
			{   ///打开链接测试用户名称是否正确
				con.Open();
				///获取数据库中所有数据库
				DataTable dt = con.GetSchema("databases");
				if(dt == null)
				{
					con.Close();
					return false;
				}
				///检测数据库是否存在
				foreach(DataRow row in dt.Rows)
				{
					if(row["database_name"].ToString().ToLower() == database.ToLower())
					{
						if(MessageBox.Show("数据库：" + database + "已经存在，是否继续？",
							"安装操作对话框",MessageBoxButtons.YesNo,MessageBoxIcon.Question) == DialogResult.Yes)
						{
							con.Close();
							return true;
						}
					}
				}
				con.ChangeDatabase("master");
				///创建数据库的脚本
				string cmdText = "CREATE DATABASE " + database;
				SqlCommand com = new SqlCommand(cmdText,con);
				///创建数据库
				com.ExecuteNonQuery();
				con.Close();
				///检查脚本是否正确
				string sqlPath = Application.StartupPath + @"\" + slqFile;
				if(File.Exists(sqlPath) == false)
				{
					return false;
				}
				Process sqlProcess = new Process();
				///调用SQL Server进程执行创建数据库脚本
				sqlProcess.StartInfo.FileName = "osql.exe";
				sqlProcess.StartInfo.Arguments = string.Format(" -U {0} -P {1} -d {2} -i " + sqlPath,
					username,password,database);
				sqlProcess.StartInfo.WindowStyle = System.Diagnostics.ProcessWindowStyle.Hidden;

				this.Cursor = Cursors.WaitCursor;
				sqlProcess.Start();				
				///等待执行
				sqlProcess.WaitForExit();

				/////检查脚本是否正确
				//string sqldataPath = Application.StartupPath + @"\" + dataFile;
				//if(File.Exists(sqldataPath) == false)
				//{
				//    return false;
				//}
				/////初始化数据库中的数据
				//Process sqldataProcess = new Process();
				/////调用SQL Server进程执行创建数据库脚本
				//sqldataProcess.StartInfo.FileName = "osql.exe";
				//sqldataProcess.StartInfo.Arguments = string.Format(" -U {0} -P {1} -d {2} -i " + sqldataPath,
				//    username,password,database);
				//sqldataProcess.StartInfo.WindowStyle = System.Diagnostics.ProcessWindowStyle.Hidden;
				//sqldataProcess.Start();
				/////等待执行
				//sqldataProcess.WaitForExit();

				this.Cursor = Cursors.Default;
				isValidate = true;
			}
			catch
			{   ///测试结果：错误
				return false;
			}
			finally
			{
				con.Dispose();
			}
			return isValidate;
		}		

		private void SetupOperation(SystemStatus status)
		{
			switch(status)
			{
				case SystemStatus.Init:
					{   ///设置面板和按钮的可用性
						prevButton.Enabled = false;
						nextButton.Enabled = true;
						finishButton.Enabled = false;

						prepareUC.Visible = false;
						databaseUC.Visible = true;
						webSetupUC.Visible = false;
						finishUC.Visible = false;

						///更新图片
						preStatusUC.TitleImage = successImage;
						dbStatusUC.TitleImage = curImage;

						curStatus = SystemStatus.Prepare;
						return;
					}
				case SystemStatus.Prepare:
					{   ///验证用户输入的名称是否正确
						if(ValidateDatabase(databaseUC.Username,databaseUC.Password,
							databaseUC.Server,database,sqlFile,sqldataFile) == true)
						{
							dbStatusUC.TitleImage = successImage;

							///设置下一个状态的初始状态
							curStatus = SystemStatus.Database;
							rssStatusUC.TitleImage = curImage;
							databaseUC.Visible = false;
							webSetupUC.Visible = true;
							webSetupUC.Title = "开始安装RSS网络应用程序:";
							webSetupUC.ProgressBarSetup.Value = 10;
						}
						else
						{
							MessageBox.Show("验证数据库的用户名称和密码错误","安装错误对话框",
								MessageBoxButtons.OK,MessageBoxIcon.Error);
							///设置当前的状态
							dbStatusUC.TitleImage = errrorImage;
							databaseUC.Visible = true;
							webSetupUC.Visible = false;
						}
						///设置面板和按钮的可用性
						prevButton.Enabled = false;
						nextButton.Enabled = true;
						finishButton.Enabled = false;
						prepareUC.Visible = false;
						finishUC.Visible = false;
						return;
					}
				case SystemStatus.Database:
					SetupWebAppliation("RssSetup.msi",SystemStatus.Rss,
						rssStatusUC,blogStatusUC,"Rss","开始安装Blog网络应用程序:");
					return;
				case SystemStatus.Rss:
					SetupWebAppliation("BlogSetup.msi",SystemStatus.Blog,
						blogStatusUC,tagStatusUC,"Blog","开始安装WebTags网络应用程序:");
					return;
				case SystemStatus.Blog:
					SetupWebAppliation("WebTagsSetup.msi",SystemStatus.Tags,
						tagStatusUC,storeStatusUC,"WebTags","开始安装WebStore网络应用程序:");
					return;
				case SystemStatus.Tags:
					SetupWebAppliation("WebStoreSetup.msi",SystemStatus.Store,
						storeStatusUC,bbsStatusUC,"WebStore","开始安装AXMLBBS网络应用程序:");
					return;
				case SystemStatus.Store:
					SetupWebAppliation("XMLBBSSetup.msi",SystemStatus.BBS,
						bbsStatusUC,ajaxMailStatusUC,"XMLBBS","开始安装ASPNETAjaxMail网络应用程序:");
					return;
				case SystemStatus.BBS:
					SetupWebAppliation("AjaxSetup.msi",SystemStatus.AjaxMail,
						ajaxMailStatusUC,finStatusUC,"ASPNETAjaxMail","完成安装");
					return;
				case SystemStatus.AjaxMail:
					{   ///设置面板和按钮的可用性
						prevButton.Enabled = false;
						nextButton.Enabled = false;
						finishButton.Enabled = true;
						databaseUC.Visible = false;
						prepareUC.Visible = false;
						webSetupUC.Visible = false;
						finishUC.Visible = true;
						///设置为完成状态
						curStatus = SystemStatus.Finish;
						finStatusUC.TitleImage = successImage;
						return;
					}
				default: return;
			}
		}

		private void SetupWebAppliation(string application,SystemStatus nextStatus,
			StatusUC curStatusUC,StatusUC nextStatusUC,string curAppName,string nextAppName)
		{
			try
			{				
				Process setupProcess = Process.Start(application);
				///隐藏主窗口
				this.Visible = false;
				///运行安装程序，主程序等待退出
				setupProcess.WaitForExit();
				///设置当前状态和图像
				curStatus = nextStatus;
				curStatusUC.TitleImage = successImage;
				///初始化下一个状态和图像
				nextStatusUC.TitleImage = curImage;				
				webSetupUC.Title = nextAppName;
				if(webSetupUC.ProgressBarSetup.Value + 15 < webSetupUC.ProgressBarSetup.Maximum)
				{
					webSetupUC.ProgressBarSetup.Value += 15;
				}
				///设置面板和按钮的可用性
				webSetupUC.Visible = true;
				finishUC.Visible = false;
				prevButton.Enabled = false;
				nextButton.Enabled = true;
				finishButton.Enabled = false;
			}
			catch
			{   ///安装失败，弹出对话框
				MessageBox.Show(
					"安装" + curAppName + "网络应用程序失败!",
					"安装错误对话框",MessageBoxButtons.OK,MessageBoxIcon.Error);
				///结束当前安装状态和图像
				curStatus = SystemStatus.Finish;
				curStatusUC.TitleImage = errrorImage;
				///设置面板和按钮的可用性
				webSetupUC.Visible = false;
				finishUC.Visible = true;
				prevButton.Enabled = false;
				nextButton.Enabled = false;
				finishButton.Enabled = true;
			}
			///显示主窗口
			Visible = true;
			webSetupUC.Refresh();
			///设置面板的可用性
			prepareUC.Visible = false;
			databaseUC.Visible = false;
		}

		private void prevButton_Click(object sender,EventArgs e)
		{
			///执行上一步操作
		}

		private void nextButton_Click(object sender,EventArgs e)
		{   ///执行下一步操作
			SetupOperation(curStatus);							
		}

		private void finishButton_Click(object sender,EventArgs e)
		{   ///结束安装
			if(curStatus == SystemStatus.Finish)
			{
				Close();
			}			
		}

		private void mailForm_FormClosing(object sender,FormClosingEventArgs e)
		{
			if(curStatus == SystemStatus.Finish)
			{
				e.Cancel = false;
				return;
			}
			if(MessageBox.Show("你将取消Web 2.0+ASP.NET 2.0网络应用程序的安装操作？",
				"安装操作对话框",MessageBoxButtons.YesNo,MessageBoxIcon.Question) == DialogResult.Yes)
			{
				e.Cancel = false;
				return;
			}
			e.Cancel = true;
		}
	}
}
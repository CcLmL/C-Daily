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
			///���ÿؼ����Ե�Ĭ��ֵ
			Border3DSide border3DSide = Border3DSide.Right;
			Border3DStyle border3DStyle = Border3DStyle.Etched;

			///�����Լ��������״
			ControlPaint.DrawBorder3D(e.Graphics,e.ClipRectangle,border3DStyle,border3DSide);
		}

		void bottomPanel_Paint(object sender,PaintEventArgs e)
		{
			///���ÿؼ����Ե�Ĭ��ֵ
			Border3DSide border3DSide = Border3DSide.Top;
			Border3DStyle border3DStyle = Border3DStyle.Etched;

			///�����Լ��������״
			ControlPaint.DrawBorder3D(e.Graphics,e.ClipRectangle,border3DStyle,border3DSide);
		}

		private void topPanel_Paint(object sender,PaintEventArgs e)
		{
			///���ÿؼ����Ե�Ĭ��ֵ
			Border3DSide border3DSide = Border3DSide.Bottom;
			Border3DStyle border3DStyle = Border3DStyle.Etched;

			///�����Լ��������״
			ControlPaint.DrawBorder3D(e.Graphics,e.ClipRectangle,border3DStyle,border3DSide);
		}

		private bool ValidateDatabase(string username,string password,string server,string database,
			string slqFile,string dataFile)
		{   ///���������ַ���
			SqlConnectionStringBuilder constringbuilder = new SqlConnectionStringBuilder();
			constringbuilder.DataSource = server;
			constringbuilder.Password = password;
			constringbuilder.UserID = username;
			
			///��������
			SqlConnection con = new SqlConnection(constringbuilder.ConnectionString);

			bool isValidate = false;
			try
			{   ///�����Ӳ����û������Ƿ���ȷ
				con.Open();
				///��ȡ���ݿ����������ݿ�
				DataTable dt = con.GetSchema("databases");
				if(dt == null)
				{
					con.Close();
					return false;
				}
				///������ݿ��Ƿ����
				foreach(DataRow row in dt.Rows)
				{
					if(row["database_name"].ToString().ToLower() == database.ToLower())
					{
						if(MessageBox.Show("���ݿ⣺" + database + "�Ѿ����ڣ��Ƿ������",
							"��װ�����Ի���",MessageBoxButtons.YesNo,MessageBoxIcon.Question) == DialogResult.Yes)
						{
							con.Close();
							return true;
						}
					}
				}
				con.ChangeDatabase("master");
				///�������ݿ�Ľű�
				string cmdText = "CREATE DATABASE " + database;
				SqlCommand com = new SqlCommand(cmdText,con);
				///�������ݿ�
				com.ExecuteNonQuery();
				con.Close();
				///���ű��Ƿ���ȷ
				string sqlPath = Application.StartupPath + @"\" + slqFile;
				if(File.Exists(sqlPath) == false)
				{
					return false;
				}
				Process sqlProcess = new Process();
				///����SQL Server����ִ�д������ݿ�ű�
				sqlProcess.StartInfo.FileName = "osql.exe";
				sqlProcess.StartInfo.Arguments = string.Format(" -U {0} -P {1} -d {2} -i " + sqlPath,
					username,password,database);
				sqlProcess.StartInfo.WindowStyle = System.Diagnostics.ProcessWindowStyle.Hidden;

				this.Cursor = Cursors.WaitCursor;
				sqlProcess.Start();				
				///�ȴ�ִ��
				sqlProcess.WaitForExit();

				/////���ű��Ƿ���ȷ
				//string sqldataPath = Application.StartupPath + @"\" + dataFile;
				//if(File.Exists(sqldataPath) == false)
				//{
				//    return false;
				//}
				/////��ʼ�����ݿ��е�����
				//Process sqldataProcess = new Process();
				/////����SQL Server����ִ�д������ݿ�ű�
				//sqldataProcess.StartInfo.FileName = "osql.exe";
				//sqldataProcess.StartInfo.Arguments = string.Format(" -U {0} -P {1} -d {2} -i " + sqldataPath,
				//    username,password,database);
				//sqldataProcess.StartInfo.WindowStyle = System.Diagnostics.ProcessWindowStyle.Hidden;
				//sqldataProcess.Start();
				/////�ȴ�ִ��
				//sqldataProcess.WaitForExit();

				this.Cursor = Cursors.Default;
				isValidate = true;
			}
			catch
			{   ///���Խ��������
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
					{   ///�������Ͱ�ť�Ŀ�����
						prevButton.Enabled = false;
						nextButton.Enabled = true;
						finishButton.Enabled = false;

						prepareUC.Visible = false;
						databaseUC.Visible = true;
						webSetupUC.Visible = false;
						finishUC.Visible = false;

						///����ͼƬ
						preStatusUC.TitleImage = successImage;
						dbStatusUC.TitleImage = curImage;

						curStatus = SystemStatus.Prepare;
						return;
					}
				case SystemStatus.Prepare:
					{   ///��֤�û�����������Ƿ���ȷ
						if(ValidateDatabase(databaseUC.Username,databaseUC.Password,
							databaseUC.Server,database,sqlFile,sqldataFile) == true)
						{
							dbStatusUC.TitleImage = successImage;

							///������һ��״̬�ĳ�ʼ״̬
							curStatus = SystemStatus.Database;
							rssStatusUC.TitleImage = curImage;
							databaseUC.Visible = false;
							webSetupUC.Visible = true;
							webSetupUC.Title = "��ʼ��װRSS����Ӧ�ó���:";
							webSetupUC.ProgressBarSetup.Value = 10;
						}
						else
						{
							MessageBox.Show("��֤���ݿ���û����ƺ��������","��װ����Ի���",
								MessageBoxButtons.OK,MessageBoxIcon.Error);
							///���õ�ǰ��״̬
							dbStatusUC.TitleImage = errrorImage;
							databaseUC.Visible = true;
							webSetupUC.Visible = false;
						}
						///�������Ͱ�ť�Ŀ�����
						prevButton.Enabled = false;
						nextButton.Enabled = true;
						finishButton.Enabled = false;
						prepareUC.Visible = false;
						finishUC.Visible = false;
						return;
					}
				case SystemStatus.Database:
					SetupWebAppliation("RssSetup.msi",SystemStatus.Rss,
						rssStatusUC,blogStatusUC,"Rss","��ʼ��װBlog����Ӧ�ó���:");
					return;
				case SystemStatus.Rss:
					SetupWebAppliation("BlogSetup.msi",SystemStatus.Blog,
						blogStatusUC,tagStatusUC,"Blog","��ʼ��װWebTags����Ӧ�ó���:");
					return;
				case SystemStatus.Blog:
					SetupWebAppliation("WebTagsSetup.msi",SystemStatus.Tags,
						tagStatusUC,storeStatusUC,"WebTags","��ʼ��װWebStore����Ӧ�ó���:");
					return;
				case SystemStatus.Tags:
					SetupWebAppliation("WebStoreSetup.msi",SystemStatus.Store,
						storeStatusUC,bbsStatusUC,"WebStore","��ʼ��װAXMLBBS����Ӧ�ó���:");
					return;
				case SystemStatus.Store:
					SetupWebAppliation("XMLBBSSetup.msi",SystemStatus.BBS,
						bbsStatusUC,ajaxMailStatusUC,"XMLBBS","��ʼ��װASPNETAjaxMail����Ӧ�ó���:");
					return;
				case SystemStatus.BBS:
					SetupWebAppliation("AjaxSetup.msi",SystemStatus.AjaxMail,
						ajaxMailStatusUC,finStatusUC,"ASPNETAjaxMail","��ɰ�װ");
					return;
				case SystemStatus.AjaxMail:
					{   ///�������Ͱ�ť�Ŀ�����
						prevButton.Enabled = false;
						nextButton.Enabled = false;
						finishButton.Enabled = true;
						databaseUC.Visible = false;
						prepareUC.Visible = false;
						webSetupUC.Visible = false;
						finishUC.Visible = true;
						///����Ϊ���״̬
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
				///����������
				this.Visible = false;
				///���а�װ����������ȴ��˳�
				setupProcess.WaitForExit();
				///���õ�ǰ״̬��ͼ��
				curStatus = nextStatus;
				curStatusUC.TitleImage = successImage;
				///��ʼ����һ��״̬��ͼ��
				nextStatusUC.TitleImage = curImage;				
				webSetupUC.Title = nextAppName;
				if(webSetupUC.ProgressBarSetup.Value + 15 < webSetupUC.ProgressBarSetup.Maximum)
				{
					webSetupUC.ProgressBarSetup.Value += 15;
				}
				///�������Ͱ�ť�Ŀ�����
				webSetupUC.Visible = true;
				finishUC.Visible = false;
				prevButton.Enabled = false;
				nextButton.Enabled = true;
				finishButton.Enabled = false;
			}
			catch
			{   ///��װʧ�ܣ������Ի���
				MessageBox.Show(
					"��װ" + curAppName + "����Ӧ�ó���ʧ��!",
					"��װ����Ի���",MessageBoxButtons.OK,MessageBoxIcon.Error);
				///������ǰ��װ״̬��ͼ��
				curStatus = SystemStatus.Finish;
				curStatusUC.TitleImage = errrorImage;
				///�������Ͱ�ť�Ŀ�����
				webSetupUC.Visible = false;
				finishUC.Visible = true;
				prevButton.Enabled = false;
				nextButton.Enabled = false;
				finishButton.Enabled = true;
			}
			///��ʾ������
			Visible = true;
			webSetupUC.Refresh();
			///�������Ŀ�����
			prepareUC.Visible = false;
			databaseUC.Visible = false;
		}

		private void prevButton_Click(object sender,EventArgs e)
		{
			///ִ����һ������
		}

		private void nextButton_Click(object sender,EventArgs e)
		{   ///ִ����һ������
			SetupOperation(curStatus);							
		}

		private void finishButton_Click(object sender,EventArgs e)
		{   ///������װ
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
			if(MessageBox.Show("�㽫ȡ��Web 2.0+ASP.NET 2.0����Ӧ�ó���İ�װ������",
				"��װ�����Ի���",MessageBoxButtons.YesNo,MessageBoxIcon.Question) == DialogResult.Yes)
			{
				e.Cancel = false;
				return;
			}
			e.Cancel = true;
		}
	}
}
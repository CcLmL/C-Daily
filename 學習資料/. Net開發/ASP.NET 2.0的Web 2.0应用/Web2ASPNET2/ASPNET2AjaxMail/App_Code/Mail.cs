using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using Web2ASPNET2.OperateSqlServer;
using Web2ASPNET2.CommonOperation;
using System.Net.Mail;

namespace Web2ASPNET2.ASPNET2AjaxMail
{
	public class AjaxMailProfile
	{
		public string ServerIP = string.Empty;
		public int ServerPort = -1;
	}

	public class Mail
	{
		public Mail()
		{
			//
			// TODO: 在此处添加构造函数逻辑
			//
		}

		/// <summary>
		/// 获取邮件系统的配置
		/// </summary>
		/// <returns></returns>
		public SqlDataReader GetMailProfile()
		{
			return DataCommon.GetDataByReader("Pr_GetAjaxSystemConfig");
		}

		/// <summary>
		/// 获取所有邮件
		/// </summary>
		/// <returns></returns>
		public DataSet GetMails()
		{
			return DataCommon.GetDataByDataSet("Pr_GetAjaxMails");
		}

		/// <summary>
		/// 根据邮箱获取邮件
		/// </summary>
		/// <param name="folderID"></param>
		/// <returns></returns>
		public DataSet GetMailsByFloder(int folderID)
		{	
			///定义保存数据的DataSet对象
			DataSet ds = new DataSet();
			///添加存储过程参数
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@FolderID",SqlDbType.Int,4,folderID)
			};
			///执行存储过程
			OperateDatabase.RunProc("Pr_GetAjaxMailByFolder",ref ds,parameters);
			///返回结果
			return ds;
		}

		/// <summary>
		/// 根据邮箱获取邮件
		/// </summary>
		/// <param name="folderID"></param>
		/// <returns></returns>
		public DataSet GetMailsByFilter(string filter,string flag)
		{
			///定义保存数据的DataSet对象
			DataSet ds = new DataSet();
			///添加存储过程参数
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@Filter",SqlDbType.VarChar,255,filter),
				OperateDatabase.CreateInParam("@Flag",SqlDbType.VarChar,10,flag)
			};
			///执行存储过程
			OperateDatabase.RunProc("Pr_GetMailsByFilter",ref ds,parameters);
			///返回结果
			return ds;
		}

		/// <summary>
		/// 获取单个邮件
		/// </summary>
		/// <param name="mailID"></param>
		/// <returns></returns>
		public SqlDataReader GetSingleMail(int mailID)
		{
			return DataCommon.GetDataByReaderIDParam("Pr_GetSingleAjaxMail",mailID);
		}

		/// <summary>
		/// 发送邮件
		/// </summary>
		/// <param name="mail"></param>
		/// <returns></returns>
		public int SenderMail(MailMessage mail)
		{
			///定义发送邮件的smtpClient
			SmtpClient client = new SmtpClient();

			try
			{
				///设置邮件服务器主机的IP地址
				client.Host = ((AjaxMailProfile)HttpContext.Current.Application["MailProfile"]).ServerIP;
				///设置邮件服务器的端口
				client.Port = ((AjaxMailProfile)HttpContext.Current.Application["MailProfile"]).ServerPort;
				///配置发送邮件的属性
				client.DeliveryMethod = SmtpDeliveryMethod.Network;
				client.UseDefaultCredentials = false;
				///发送邮件
				client.Send(mail);

				return 1;    ///发送成功
			}
			catch
			{
				return -1;   ///发送失败
			}
		}

		/// <summary>
		/// 将发送的邮件保存在数据库中
		/// </summary>
		/// <param name="name"></param>
		/// <param name="body"></param>
		/// <param name="from"></param>
		/// <param name="to"></param>
		/// <param name="cc"></param>
		/// <param name="htmlFormat"></param>
		/// <param name="size"></param>
		/// <param name="attachmentFlag"></param>
		/// <returns></returns>
		public int SaveAsMail(string name,string body,string from,string to,string cc,
			bool htmlFormat,int size,bool attachmentFlag)
		{   ///创建参数列表
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@Name",SqlDbType.VarChar,200,name),
				OperateDatabase.CreateInParam("@Body",SqlDbType.Text,ASPNET2AjaxMail.TextStringLength,body),
				OperateDatabase.CreateInParam("@From",SqlDbType.VarChar,255,from),
				OperateDatabase.CreateInParam("@To",SqlDbType.VarChar,500,to),
				OperateDatabase.CreateInParam("@CC",SqlDbType.VarChar,500,cc),
				OperateDatabase.CreateInParam("@ISHtmlFormat",SqlDbType.Bit,1,htmlFormat),
				OperateDatabase.CreateInParam("@Size",SqlDbType.Int,4,size),
				OperateDatabase.CreateInParam("@AttachmentFlag",SqlDbType.TinyInt,1,attachmentFlag)
			};
			return (OperateDatabase.RunProc("Pr_AddAjaxMail",parameters));
		}

		/// <summary>
		/// 保存邮件的附件
		/// </summary>
		/// <param name="name"></param>
		/// <param name="url"></param>
		/// <param name="type"></param>
		/// <param name="size"></param>
		/// <param name="mailID"></param>
		/// <returns></returns>
		public int SaveAsMailAttachment(string name,string url,string type,int size,int mailID)
		{   ///创建参数列表
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@Name",SqlDbType.VarChar,200,name),
				OperateDatabase.CreateInParam("@Url",SqlDbType.VarChar,255,url),
				OperateDatabase.CreateInParam("@Type",SqlDbType.VarChar,100,type),
				OperateDatabase.CreateInParam("@Size",SqlDbType.Int,4,size),
				OperateDatabase.CreateInParam("@MailID",SqlDbType.Int,4,mailID)
			};
			return (OperateDatabase.RunProc("Pr_AddAjaxMailAttachment",parameters));
		}

		public int SaveASMailProfile(string ip,int port)
		{
			///创建参数列表
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@IP",SqlDbType.VarChar,50,ip),
				OperateDatabase.CreateInParam("@Port",SqlDbType.Int,4,port)
			};
			return (OperateDatabase.RunProc("Pr_SaveASMailProfile",parameters));
		}

		/// <summary>
		/// 删除邮件
		/// </summary>
		/// <param name="mailID"></param>
		/// <returns></returns>
		public int DeleteMail(int mailID)
		{
			return DataCommon.QueryDataIDParam("Pr_DeleteAjaxMail",mailID);
		}

		/// <summary>
		/// 获取邮件的附件
		/// </summary>
		/// <param name="mailID"></param>
		/// <returns></returns>
		public DataSet GetAttachmentsByMail(int mailID)
		{
			///定义保存数据的DataSet对象
			DataSet ds = new DataSet();
			///添加存储过程参数
			SqlParameter[] parameters = {
				OperateDatabase.CreateInParam("@MailID",SqlDbType.Int,4,mailID)
			};
			///执行存储过程
			OperateDatabase.RunProc("Pr_GetAttachmentsByMail",ref ds,parameters);
			///返回结果
			return ds;
		}
	}
}

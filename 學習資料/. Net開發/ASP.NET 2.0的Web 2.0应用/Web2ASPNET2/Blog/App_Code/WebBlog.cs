using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Web2ASPNET2.UserCommonOperation;
using Web2ASPNET2.WebBlog;
using Web2ASPNET2.CommonOperation;

namespace Web2ASPNET2.WebBlog
{
	public enum TagState:byte
	{
		Public = 0,
		Friendly = 1,
		Private = 2
	}

	public class WebBlog
	{
		public static int TextStringLength = 2147483647;
		public static int NormalRoleID = 2;
		public static int BlogProjectID = 4;

		/// <summary>
		/// 界面文件地址
		/// </summary>
		private static string boardFilePath;
		public static string BoardFilePath
		{
			get { return boardFilePath; }
			set { boardFilePath = value; }
		}

		/// <summary>
		/// 当前皮肤
		/// </summary>
		private static string face;
		public static string Face
		{
			get { return face; }
			set { face = value; }
		}
		
		public WebBlog()
		{
			///
		}

		public static void SystemInit(HttpContext context)
		{   ///获取保存界面的XML文件的地址
			boardFilePath = context.Server.MapPath(
				ConfigurationManager.ConnectionStrings["BOARDFILEPATH"].ConnectionString
				);
			///系统默认皮肤
			face = "Default";
			///获取用户登录信息
			UserInfo info = (UserInfo)UserCommonOperation.UserCommonOperation.GetUserInfo(context.Session);
			if(info == null) return;
			///获取系统的配置参数
			Blog blog = new Blog();
			DataSet ds = blog.GetSkinByUser(info.UserID);
			if(ds == null || ds.Tables.Count <= 0)return;
			if(ds.Tables[0].Rows.Count <= 0) return;
			
			///获取用户自定义的界面
			face = ds.Tables[0].Rows[0]["Skin"].ToString();
		}
	}
}

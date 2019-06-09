using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using Web2ASPNET2.CommonOperation;
using Web2ASPNET2.WebStore;
using Web2ASPNET2.UserCommonOperation;

public partial class Portal_ShowFile:System.Web.UI.Page
{
	int fileID = -1;
	protected void Page_Load(object sender,EventArgs e)
	{	///判断用户是否登录
		UserInfo info = (UserInfo)UserCommonOperation.GetUserInfo(Session);
		if(info == null)
		{   ///返回到上一个页面
			Response.Write("<script>history.back()</script>");
			///跳转到登录页面
			Server.Transfer("~/Portal/UserLogin.aspx");
			return;
		}
		///获取被修改信息的ID
		if(Request.Params["FileID"] != null)
		{
			fileID = DataTypeConvert.ConvertToInt(Request.Params["FileID"].ToString());
		}
		if(!Page.IsPostBack)
		{   ///显示被修改的数据
			if(fileID > -1)
			{
				BindPageData(fileID);
			}
		}
	}
	private void BindPageData(int fileID)
	{   ///获取被显示的文件数据
		File file = new File();
		SqlDataReader dr = file.GetSingleFile(fileID);
		if(dr == null) return;
		if(dr.Read())
		{   ///设置网页输出类型
			Response.ContentType = dr["Type"].ToString();
			///清空网页输出前的缓存
			Response.ClearContent();
			///输出文件数据
			Response.BinaryWrite((byte[])dr["Data"]);
		}
		dr.Close();
	}
}

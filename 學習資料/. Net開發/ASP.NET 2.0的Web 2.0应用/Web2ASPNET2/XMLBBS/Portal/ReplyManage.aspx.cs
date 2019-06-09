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
using Web2ASPNET2.XmlBBS;
using Web2ASPNET2.CommonOperation;
using Web2ASPNET2.UserCommonOperation;

public partial class Portal_ReplyManage:System.Web.UI.Page
{
	int titleID = -1;
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
		if(Request.Params["TitleID"] != null)
		{
			titleID = DataTypeConvert.ConvertToInt(Request.Params["TitleID"].ToString());
		}
		if(!Page.IsPostBack)
		{   ///显示帖子的回复
			if(titleID > 0)
			{
				BindPageData(titleID);
			}
		}
	}
	private void BindPageData(int titleID)
	{
		BBS bbs = new BBS();
		Web2ASPNET2.CommonOperation.DataBinder.BindGridViewData(
			gvReply,bbs.GetReplyByTitle(titleID));
	}

	protected void gvReply_RowDataBound(object sender,GridViewRowEventArgs e)
	{   ///为删除按钮添加确认对话框
		ImageButton ibtDelete = (ImageButton)e.Row.FindControl("ibtDelete");
		if(ibtDelete != null)
		{
			ibtDelete.Attributes.Add("onclick","return confirm('你确定要删除所选择的数据行吗?');");
		}
	}
	protected void gvReply_RowCommand(object sender,GridViewCommandEventArgs e)
	{
		if(e.CommandName == "del")
		{   ///执行删除操作
			BBS bbs = new BBS();
			bbs.DeleteReply(DataTypeConvert.ConvertToInt(e.CommandArgument.ToString()));
			///重新绑定控件数据
			BindPageData(titleID);
		}
	}
}

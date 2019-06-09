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
using Web2ASPNET2.ASPNET2AjaxMail;
using Web2ASPNET2.CommonOperation;
using Web2ASPNET2.UserCommonOperation;

public partial class Portal_GroupLinkmanManage:System.Web.UI.Page
{
	int groupID = -1;
	protected void Page_Load(object sender,EventArgs e)
	{	///判断用户是否登录
		UserInfo info = (UserInfo)UserCommonOperation.GetUserInfo(Session);
		if(info == null)
		{   ///返回到上一个页面
			Response.Write("<script>history.back()</script>");
			///跳转到登录页面
			Response.Redirect("~/Portal/UserLogin.aspx");
			return;
		}
		///获取组信息的ID
		if(Request.Params["GroupID"] != null)
		{
			groupID = DataTypeConvert.ConvertToInt(Request.Params["GroupID"].ToString());
		}
		if(!Page.IsPostBack)
		{   ///显示数据
			if(groupID > -1)
			{
				BindPageData(groupID);
			}
		}
		///设置按钮的可用性
		int[] idList = {
			groupID
		};
		ButtonEnable.ControlButtonEnable(btnAdd,idList);
	}
	private void BindPageData(int groupID)
	{   ///绑定控件的数据
		Linkman linkman = new Linkman();
		Web2ASPNET2.CommonOperation.DataBinder.BindGridViewData(
			gvLinkman,linkman.GetLinkmanByGroup(groupID));
	}
	protected void gvLinkman_RowDataBound(object sender,GridViewRowEventArgs e)
	{   ///为删除按钮添加确认对话框
		ImageButton ibtDelete = (ImageButton)e.Row.FindControl("ibtDelete");
		if(ibtDelete != null)
		{
			ibtDelete.Attributes.Add("onclick","return confirm('你确定要删除所选择的数据行吗?');");
		}
	}
	protected void gvLinkman_RowCommand(object sender,GridViewCommandEventArgs e)
	{   ///重定向到编辑页面
		if(e.CommandName == "update")
		{
			Response.Redirect("~/Portal/UpdateLinkman.aspx?LinkmanID=" + e.CommandArgument.ToString());
		}
		///重定向到移动页面
		if(e.CommandName == "move")
		{
			Response.Redirect("~/Portal/MoveLinkman.aspx?LinkmanID=" + e.CommandArgument.ToString());
		}
		if(e.CommandName == "del")
		{   ///执行删除操作
			Linkman linkman = new Linkman();
			linkman.DeleteLinkman(DataTypeConvert.ConvertToInt(e.CommandArgument.ToString()));
			///重新绑定控件数据
			BindPageData(groupID);
		}
	}
	protected void btnAdd_Click(object sender,EventArgs e)
	{   ///页面重定向
		Response.Redirect("~/Portal/AddLinkman.aspx?GroupID=" + groupID.ToString());
	}
}

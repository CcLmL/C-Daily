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
using System.Data.SqlClient;

public partial class Portal_MoveLinkman:System.Web.UI.Page
{
	int linkmanID = -1;
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
		///获取被修改信息的ID
		if(Request.Params["LinkmanID"] != null)
		{
			linkmanID = DataTypeConvert.ConvertToInt(Request.Params["LinkmanID"].ToString());
		}
		if(!Page.IsPostBack)
		{   ///显示被修改的数据
			if(linkmanID > -1)
			{
				BindPageData(linkmanID);
			}
		}
		///设置按钮的可用性
		int[] idList = { linkmanID };
		ListControl[] list = {
			ddlGroup
		};
		ButtonEnable.ControlButtonEnable(btnUpdateAndReturn,idList,list);
	}
	private void BindPageData(int linkmanID)
	{  ///绑定组的数据
		Group group = new Group();
		Web2ASPNET2.CommonOperation.DataBinder.BindListData(
			ddlGroup,group.GetGroups(),"Name","ID");
		///获取单个记录信息
		Linkman linkman = new Linkman();
		SqlDataReader dr = linkman.GetSingleLinkman(linkmanID);
		if(dr == null) return;
		///显示信息
		if(dr.Read())
		{
			tbName.Text = dr["Name"].ToString();
			tbEmail.Text = dr["Email"].ToString();
			ListSelectedItem.ListSelectedItemByValue(ddlGroup,dr["GroupID"].ToString());
		}
		dr.Close();
	}
	protected void btnUpdateAndReturn_Click(object sender,EventArgs e)
	{   ///执行修改操作
		Linkman linkman = new Linkman();
		if(linkman.MoveLinkman(linkmanID,
			DataTypeConvert.ConvertToInt(ddlGroup.SelectedValue)) > 0)
		{
			Dialog.OpenDialogInAjax((Button)sender,"恭喜您，移动联系人信息成功……");
			///返回管理页面
			if(ddlGroup.SelectedItem != null)
			{
				Response.Redirect("~/Portal/GroupLinkmanManage.aspx?GroupID=" + ddlGroup.SelectedValue);
			}
		}
	}
	protected void btnReturn_Click(object sender,EventArgs e)
	{   ///返回管理页面
		if(ddlGroup.SelectedItem != null)
		{
			Response.Redirect("~/Portal/GroupLinkmanManage.aspx?GroupID=" + ddlGroup.SelectedValue);
		}
		else
		{
			Response.Redirect("~/Portal/GroupLinkmanManage.aspx");
		}
	}
}

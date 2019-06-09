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

public partial class Mail_ViewMail : System.Web.UI.Page
{
	int folderID = -1;
    protected void Page_Load(object sender, EventArgs e)
	{	///判断用户是否登录
		UserInfo info = (UserInfo)UserCommonOperation.GetUserInfo(Session);
		if(info == null)
		{   ///返回到上一个页面
			Response.Write("<script>history.back()</script>");		
			Response.Redirect("~/Portal/UserLogin.aspx");	   ///跳转到登录页面
			return;
		}
		///获取邮箱的ID值
		if(Request.Params["FolderID"] != null)
		{
			folderID = DataTypeConvert.ConvertToInt(Request.Params["FolderID"].ToString());
		}
		if(folderID <= 0) folderID = 2;  ///默认设置为发件箱
		///绑定控件的数据
		if(!Page.IsPostBack){BindPageData(folderID);}
	}
	private void BindPageData(int folderID)
	{   ///绑定控件的数据
		Mail mail = new Mail();
		Web2ASPNET2.CommonOperation.DataBinder.BindGridViewData(
			gvMail,mail.GetMailsByFloder(folderID));
		///设置页面的标题
		switch(folderID)
		{
			case 2:ucTitle.Title = "发件箱";break;
			case 3:ucTitle.Title = "垃圾箱";break;
			default:ucTitle.Title = "发件箱";break;
		}

		Tag tag = new Tag();
		Web2ASPNET2.CommonOperation.DataBinder.BindListData(
			ddlTag,tag.GetTags(),"Name","ID");
	}
	protected void btnTag_Click(object sender,EventArgs e)
	{
		Tag tag = new Tag();
		foreach(GridViewRow row in gvMail.Rows)
		{   ///找到CheckBox控件
			CheckBox cbMail = (CheckBox)row.FindControl("cbMail");
			if(cbMail == null) continue;
			if(cbMail.Checked == true)
			{   ///标记邮件
				tag.AddMailTag(
					DataTypeConvert.ConvertToInt(gvMail.DataKeys[row.RowIndex].Value.ToString()),
					DataTypeConvert.ConvertToInt(ddlTag.SelectedValue));
			}
		}
	}
}

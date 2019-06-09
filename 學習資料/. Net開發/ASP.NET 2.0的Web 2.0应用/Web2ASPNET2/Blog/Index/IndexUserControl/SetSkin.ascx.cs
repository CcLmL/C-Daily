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
using Web2ASPNET2.UserCommonOperation;
using Web2ASPNET2.CommonOperation;
using Web2ASPNET2.WebBlog;

public partial class Index_IndexUserControl_SetSkin : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if(!Page.IsPostBack)
		{
			BindPageData();
		}
    }

	private void BindPageData()
	{   ///获取系统中已经存在的皮肤
		ArrayList faces = OperateXmlFile.GetFaces();
		if(faces == null) return;

		ddlSkin.Items.Clear();
		foreach(string face in faces)
		{   ///添加到皮肤列表中
			ddlSkin.Items.Add(new ListItem(face,face));
		}
	}

	protected void ddlSkin_SelectedIndexChanged(object sender,EventArgs e)
	{   ///获取用户信息
		UserInfo info = (UserInfo)UserCommonOperation.GetUserInfo(Session);
		if(info == null) return;
		///保存用户的配置
		Blog blog = new Blog();
		if(blog.AddUserSkin(info.UserID,ddlSkin.SelectedValue) > 0)
		{
			Dialog.OpenDialog(Response,"恭喜您，设置系统界面成功，下次登录后有效");
		}
	}
}

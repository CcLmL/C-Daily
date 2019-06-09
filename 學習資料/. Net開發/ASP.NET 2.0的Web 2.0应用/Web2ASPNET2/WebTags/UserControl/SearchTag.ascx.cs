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
using Web2ASPNET2.WebTags;
using Web2ASPNET2.CommonOperation;
using Web2ASPNET2.UserCommonOperation;

public partial class UserControl_SearchTag:System.Web.UI.UserControl
{
	protected void Page_Load(object sender,EventArgs e)
	{	

	}
	protected void btnSearch_Click(object sender,EventArgs e)
	{   ///判断搜索关键字是否为空
		if(string.IsNullOrEmpty(tbKey.Text) == true)
		{
			Dialog.OpenDialog(Response,"搜索关键字为空，请重新输入……");
			return;
		}
		///获取搜索结果，并绑定控件数据
		Tag tag = new Tag();
		Web2ASPNET2.CommonOperation.DataBinder.BindDataListData(
			dlTag,tag.GetTagByKey(tbKey.Text));
	}
}

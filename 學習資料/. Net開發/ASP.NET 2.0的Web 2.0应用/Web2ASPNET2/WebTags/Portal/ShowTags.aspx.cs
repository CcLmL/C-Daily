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

public partial class Portal_ShowTags:System.Web.UI.Page
{
	protected void Page_Load(object sender,EventArgs e)
	{	///绑定控件的数据
		if(!Page.IsPostBack)
		{
			BindPageData();
		}
	}
	private void BindPageData()
	{   ///绑定控件的数据
		Tag tag = new Tag();
		Web2ASPNET2.CommonOperation.DataBinder.BindDataListData(
			dlTag,tag.GetTags());
	}
}

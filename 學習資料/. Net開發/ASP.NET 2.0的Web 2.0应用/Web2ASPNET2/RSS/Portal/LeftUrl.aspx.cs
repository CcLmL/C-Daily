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
using Web2ASPNET2.WebRSS;
using Web2ASPNET2.CommonOperation;
using Web2ASPNET2.UserCommonOperation;

public partial class Portal_LeftUrl:System.Web.UI.Page
{
	protected void Page_Load(object sender,EventArgs e)
	{
		///显示被修改的数据
		if(!Page.IsPostBack)
		{
			BindPageData();
		}
	}
	private void BindPageData()
	{   ///获取单个记录的信息
		Url url = new Url();
		Web2ASPNET2.CommonOperation.DataBinder.BindDataListData(
			dlLink,url.GetUrls());
	}
}

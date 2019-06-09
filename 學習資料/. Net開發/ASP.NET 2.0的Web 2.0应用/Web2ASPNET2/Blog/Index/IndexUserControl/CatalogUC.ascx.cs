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
using Web2ASPNET2.WebBlog;
using Web2ASPNET2.CommonOperation;
using Web2ASPNET2.UserCommonOperation;

public partial class Index_IndexUserControl_CatalogUC:Web2ASPNET2.WebBlog.UserControlBase
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
		Catalog catalog = new Catalog();
		Web2ASPNET2.CommonOperation.DataBinder.BindGridViewData(
			gvCatalog,catalog.GetCatalogs());
	}
}

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

public partial class Index_IndexUserControl_ArticleUC:Web2ASPNET2.WebBlog.UserControlBase
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
		Blog blog = new Blog();
		///如果页面参数的类型为ID
		if(((PageBase)Page).ParameterType == ParameterTypes.ID)
		{   ///显示文章列表
			Web2ASPNET2.CommonOperation.DataBinder.BindGridViewData(
				gvArticle,blog.GetArticleByCatalog(
				DataTypeConvert.ConvertToInt(((PageBase)Page).CommandArgument)));
			ModuleHeader.Title = DateTime.Now.ToLongDateString();
			return;
		}
		///如果页面参数的类型为日期
		if(((PageBase)Page).ParameterType == ParameterTypes.Date)
		{   ///显示当前日期的文章列表
			DateTime date = DataTypeConvert.ConvertToDateTime(((PageBase)Page).CommandArgument);
			Web2ASPNET2.CommonOperation.DataBinder.BindGridViewData(
				gvArticle,blog.GetArticleByDate(date));
			ModuleHeader.Title = date.ToLongDateString();
			return;
		}
	}
}

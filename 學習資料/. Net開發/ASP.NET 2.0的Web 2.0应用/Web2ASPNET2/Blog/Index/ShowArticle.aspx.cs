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

public partial class Index_ShowArticle:Web2ASPNET2.WebBlog.PageBase
{
	protected void Page_Load(object sender,EventArgs e)
	{	///获取文章ID值	
		if(Request.Params["ArticleID"] != null)
		{
			CommandArgument = Request.Params["ArticleID"].ToString();
			ParameterType = ParameterTypes.ID;
		}
		///加载用户控件
		LoadUserControl();
		///搜集文章的访问来源
		if(string.IsNullOrEmpty(CommandArgument) == false)
		{
			CollectArticleSource(DataTypeConvert.ConvertToInt(CommandArgument));
		}
	}

	private void CollectArticleSource(int articleID)
	{   ///收集文章的访问来源
		Blog blog = new Blog();
		blog.AddArticleSource(Request.Url.ToString(),Request.UserHostAddress,articleID);
	}

	private void LoadUserControl()
	{   ///获取界面的配置
		TableCellBase[] cellList = OperateXmlFile.GetShowArticlePage(WebBlog.Face);
		if(cellList == null) return;
		foreach(TableCellBase cell in cellList)
		{   ///找到装载导入控件的模板
			HtmlTableCell tc = (HtmlTableCell)FindControl(cell.ID);
			if(tc == null) continue;
			tc.BgColor = cell.BgColor;
			tc.Width = cell.Width;
			tc.Height = cell.Height;
            ///导入控件
			foreach(UserControlBase control in cell.Modules)
			{				
				tc.Controls.Add(Page.LoadControl(control.Src));
			}
		}
	}
}

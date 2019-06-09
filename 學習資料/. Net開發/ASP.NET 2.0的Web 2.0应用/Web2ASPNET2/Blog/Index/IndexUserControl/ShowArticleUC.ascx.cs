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

public partial class Index_IndexUserControl_ShowArticleUC:Web2ASPNET2.WebBlog.UserControlBase
{
	int articleID = -1;
	protected string UserName;
	protected string Name;
	protected string CommentCount;
	protected string Body;
	protected string CreateDate;
	protected void Page_Load(object sender,EventArgs e)
	{
		if(Request.Params["ArticleID"] != null)
		{   ///获取文章的ID值
			articleID = DataTypeConvert.ConvertToInt(Request.Params["ArticleID"].ToString());
		}
		if(!Page.IsPostBack && articleID > -1)
		{   ///显示查看的文章信息
			BindPageData(articleID);
			DataBind();
		}
	}

	private void BindPageData(int articleID)
	{   ///读取文章信息
		Blog blog = new Blog();
		SqlDataReader dr = blog.GetSingleArticle(articleID);
		if(dr == null) return;
		if(dr.Read())
		{   ///显示文章信息
			UserName = dr["UserName"].ToString();
			Name = dr["Name"].ToString();
			CommentCount = dr["CommentCount"].ToString();
			Body = dr["Body"].ToString();
			CreateDate = dr["CreateDate"].ToString();
		}
		dr.Close();
	}
}

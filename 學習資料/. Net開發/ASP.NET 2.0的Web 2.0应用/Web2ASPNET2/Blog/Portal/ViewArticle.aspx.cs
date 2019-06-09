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

public partial class Portal_ViewArticle:System.Web.UI.Page
{
	int articleID = -1;
	protected string Body;
	protected void Page_Load(object sender,EventArgs e)
	{	///获取被显示信息的ID
		if(Request.Params["ArticleID"] != null)
		{
			articleID = DataTypeConvert.ConvertToInt(Request.Params["ArticleID"].ToString());
		}
		if(!Page.IsPostBack)
		{   ///显示被修改的数据
			if(articleID > -1)
			{
				BindPageData(articleID);
			}
		}		
	}
	private void BindPageData(int articleID)
	{
		Blog blog = new Blog();
		SqlDataReader dr = blog.GetSingleArticle(articleID);
		if(dr == null) return;
		if(dr.Read())
		{
			Title.Title = dr["Name"].ToString();
			Body = dr["Body"].ToString().Replace("\n","<br>");
		}
		dr.Close();
	}
	protected void btnReturn_Click(object sender,EventArgs e)
	{
		Response.Write("<script>window.close();<script>");
	}
}

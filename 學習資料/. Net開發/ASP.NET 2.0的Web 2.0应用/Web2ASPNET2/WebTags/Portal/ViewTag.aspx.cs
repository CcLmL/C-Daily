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

public partial class Portal_ViewTag:System.Web.UI.Page
{
	int tagID = -1;
	protected void Page_Load(object sender,EventArgs e)
	{	///获取标签信息的ID
		if(Request.Params["TagID"] != null)
		{
			tagID = DataTypeConvert.ConvertToInt(Request.Params["TagID"].ToString());
		}
		if(!Page.IsPostBack)
		{   ///显示被修改的数据
			if(tagID > -1)
			{
				BindPageData(tagID);
			}
		}
	}
	private void BindPageData(int tagID)
	{   ///绑定控件的数据
		Tag tag = new Tag();
		Web2ASPNET2.CommonOperation.DataBinder.BindDataListData(
			dlTagData,tag.GetArticleUrlByTag(tagID));
	}
}

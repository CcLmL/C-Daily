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
using System.Data.SqlClient;

public partial class Portal_ViewRSS:System.Web.UI.Page
{
	int urlID = -1;
	string urlLink = string.Empty;
	protected void Page_Load(object sender,EventArgs e)
	{	
		///获取被修改信息的ID
		if(Request.Params["UrlID"] != null)
		{
			urlID = DataTypeConvert.ConvertToInt(Request.Params["UrlID"].ToString());
		}
		///显示被修改的数据
		if(!Page.IsPostBack && urlID > -1)
		{
			BindPageData(urlID);
			ShowRss(urlLink);
		}		
	}
	private void BindPageData(int urlID)
	{   ///获取单个记录的信息
		Url url = new Url();
		SqlDataReader dr = url.GetSingleUrl(urlID);
		if(dr == null) return;
		if(dr.Read())
		{   ///显示信息
			urlLink = dr["Url"].ToString();
		}
		dr.Close();
	}

	private void ShowRss(string url)
	{   ///根据URL获取频道的数据
		RSSChannel channel = new RSSChannel(url);
		channel.ReadChannel();
		///获取每一个Item项
		RSSItem[] items = new RSSItem[channel.Items.Count];
		int i = 0;
		foreach(RSSItem item in channel.Items)
		{
			items[i++] = item;
		}
		///创建RSS文档
		SampleRss rss = new SampleRss();
		rss.CreateSampleRss(Response,items);		
	}
}

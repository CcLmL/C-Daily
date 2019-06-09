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
using System.Xml;
using Web2ASPNET2.WebRSS;

public partial class Portal_SampleRSS:System.Web.UI.Page
{
	private void Page_Load(object sender,System.EventArgs e)
	{
		SampleRss rss = new SampleRss();
		///创建RSS的Item项
		RSSItem[] items = new RSSItem[2];
		for(int i = 0; i < items.Length; i++)
		{
			items[i] = new RSSItem();
		}
		///设置项的属性的值
		items[0].Title = "Title #1";
		items[0].Link = "http://news.csdn.net/Feed.aspx?Column=7adf68b5-ce01-4213-ad3c-ea8fd6e01f89";
		items[0].Description = "This is the frist test item";
		items[1].Title = "Title #2";
		items[1].Link = "http://test.com/blabla.aspx";
		items[1].Description = "This is the second test item";
		///创建RSS文档并输出
		rss.CreateSampleRss(Response,items);
	}
}

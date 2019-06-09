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

using RssToolkit;
public partial class ComplexRSS : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //创建一个频道
        GenericRssChannel c = GenericRssChannel.LoadChannel("http://blog.csdn.net/championchen79/category/197094.aspx/rss");
        //为GridView绑定数据源
        //数据源来自频道中的所有项目
        GridView1.DataSource = c.SelectItems();
        GridView1.DataBind();
    }
}

using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Collections;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //初始化一个数组列表
        SortedList mylist = new SortedList();
        //填充数组内容
        mylist.Add("组合模式视频讲座", "组合模式视频讲座.htm");
        mylist.Add("工厂模式视频讲座", "PublishingPoint1.htm");
        mylist.Add("适配器模式视频讲座", "PublishingPoint2.htm");
        mylist.Add("职责链模式视频讲座", "PublishingPoint3.htm");
        //绑定数组到Repeater控件
        Repeater1.DataSource = mylist;
        Repeater1.DataBind();
    }

}

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

public partial class NewsMain : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ////主要是便于类别的扩展
        ////使用可以排序的数组集合
        //SortedList mylist = new SortedList();
        ////添加集合内的项目
        //mylist.Add("0","时事新闻");
        //mylist.Add("1", "财经新闻");
        //mylist.Add("2", "娱乐新闻");
        //mylist.Add("3", "体育新闻");
        ////设置DataList的数据源
        //DataList1.DataSource = mylist;
        ////绑定数据
        //DataList1.DataBind();

    }

}

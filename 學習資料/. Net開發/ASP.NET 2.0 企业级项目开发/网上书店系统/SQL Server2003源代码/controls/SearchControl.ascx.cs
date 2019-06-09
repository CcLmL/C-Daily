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

public partial class controls_SearchControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //获取搜索关键字
        string text = Request.QueryString["keywords"];
        string[] keywords = text.Split();
        //初始化商品操作类
        Product mypro = new Product();
        //调用搜索方法
        Repeater1.DataSource = mypro.GetProductsBySearch(keywords);
        //绑定数据控件
        Repeater1.DataBind();
    }
}

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

public partial class controls_ItemControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //获取产品ID
        string productKey = Request.QueryString["productId"];
        //初始化购物篮操作类
        Cart mycart = new Cart();
        //调用获取图书信息方法,并绑定数据控件
        Repeater1.DataSource = mycart.GetItemsByProduct(productKey);
        Repeater1.DataBind();
    }
}

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

public partial class controls_Products : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //获取目录ID
        int categoryKey = int.Parse(Request.QueryString["categoryId"]);
        Product mypro = new Product();
        //通过ID获取目录下的图书资料
        Repeater1.DataSource = mypro.GetProductsByCategory(categoryKey);
        //绑定数据控件
        Repeater1.DataBind();        
    }
}

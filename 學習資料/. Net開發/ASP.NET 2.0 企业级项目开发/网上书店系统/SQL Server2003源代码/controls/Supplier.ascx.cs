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

public partial class controls_Supplierl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //初始化商品操作类
        Product mysupp = new Product();
        //调用添加供应商方法
        mysupp.AddSupplier(txtname.Text, txtphone.Text, txtaddr.Text);
        //设置提示信息
        Label1.Text = "添加成功";

        //重新绑定GridView控件，更新其数据
        GridView1.DataBind();
    }
}

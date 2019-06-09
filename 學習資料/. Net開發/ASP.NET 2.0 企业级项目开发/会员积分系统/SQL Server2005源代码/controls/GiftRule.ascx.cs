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

public partial class controls_GiftRule : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        //重新为GridView绑定数据
        GridView1.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //实例化一个操作类
        StockDA myda = new StockDA();
        //执行添加反馈规则的方法
        bool result = myda.AddGiftRule(txtstockid.Text, int.Parse(txtcount.Text));
        //如果成功，提示信息
        if (result)
            Label3.Text = "更新成功";
    }
}

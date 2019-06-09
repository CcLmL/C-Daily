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

public partial class controls_StockSale : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //初始化实体方法
        StockDA myda = new StockDA();
        //使用此方法同时更新库存量和操作的历史记录。
        //此方法中使用事务处理，必须两个操作都成功执行，此方法才返回true。
        bool result=myda.UpdateStockCount(txtstockid.Text, int.Parse(txtcount.Text), int.Parse(ddltype.SelectedValue));
        //如果成功，提示信息
        if (result)
            Label4.Text = "更新成功!";
    }
}

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

public partial class controls_FreeStock : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //通过卡号获取卡积分

        //使用方法GetCountByCardNum
        CardCountInfo mycount = new CardCountInfo();
        txttotal.Text = mycount.GetCountByCardNum(txtcardnum.Text).ToString();

        //目前方法没有实现，使用常数实现
       //txttotal.Text = "500";
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //更新库存，添加反馈历史记录
        StockDA myda = new StockDA();
        //更新库存。添加历史记录。
        //operation参数选择2表示反馈。
        //商品数量选择1,是固定值，因为反馈时只能是1件。
        bool result = myda.UpdateStockCount(txtstock.Text, 1, 2);
        //如果更新成功，提示信息
        if(result)
            Label2.Text="更新成功！";
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //定义一行为选择的当前行。
        GridViewRow myrow = myrow = GridView1.SelectedRow;
        //取第二列和第三列的值，分别赋给商品编码和积分数额。
        //因为第一列是操作按钮列
        txtstock.Text = myrow.Cells[1].Text;
        txtcount.Text = myrow.Cells[2].Text;
    }
}

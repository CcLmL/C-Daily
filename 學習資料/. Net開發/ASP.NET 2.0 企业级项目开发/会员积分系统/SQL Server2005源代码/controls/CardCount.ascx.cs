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

public partial class controls_CardCount : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //设置链接控件的NavigateUrl属性
        //url中带参数，参数的值取当前页中txtcardnum的值。
        this.HyperLink1.NavigateUrl = "~/GetHistotyPage.aspx?cardnum=" + this.txtcardnum.Text;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //初始化方法类
        CardCountInfo mycount = new CardCountInfo();
        //调用方法GetCountByCardNum获取卡积分
        int count=mycount.GetCountByCardNum(txtcardnum.Text);
        //用Label3显示卡积分
        Label3.Text = count.ToString();
    }
}

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

public partial class HistoryHandle : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //初始化积分处理类
        CardCountInfo mycount = new CardCountInfo();
        //转换类型
        int money=int.Parse(txtmoney.Text);
        int value = int.Parse(ddltype.SelectedValue);
        //调用积分处理方法
        bool result=mycount.AddHistory(txtcardnum.Text,money,value);
        //如果成功，提示信息。
        if(result)
            Label4.Text="添加成功";
    }
}

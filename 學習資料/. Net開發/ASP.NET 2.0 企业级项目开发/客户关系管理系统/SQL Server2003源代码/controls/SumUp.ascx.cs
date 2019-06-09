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

public partial class controls_SumUp : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //初始化客户服务类并调用添加总结的方法
        UserService service = new UserService();
        bool result = service.InsertSumUp(txtusername.Text, txtname.Text, txtversion.Text,
            Calendar1.SelectedDate, Calendar2.SelectedDate, txtsumup.Text, txtnote.Text);
        //判断结果
        if (result)
            Label1.Text = "总结成功添加";
    }
}

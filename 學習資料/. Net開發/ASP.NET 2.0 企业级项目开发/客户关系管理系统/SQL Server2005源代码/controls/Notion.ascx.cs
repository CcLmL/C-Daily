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

public partial class controls_Notion : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //初始化客户服务类
        UserService service = new UserService();
        //调用服务类中的添加投诉方法
        bool result=service.InsertNotion(txtusername.Text, txtname.Text, txtcontent.Text);
        //判断执行结果
        if(result)
            Label1.Text = "投诉已经提交，请等待处理！";
    }
}

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

public partial class controls_UserState : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //判断页面验证是否成功
        if (Page.IsValid)
        {
            //初始化基础配置类
            BasicSet mybasic = new BasicSet();
            //执行添加状态的方法
            bool result = mybasic.AddState(TextBox1.Text);
            //判断执行是否成功
            if (result)
            {
                //提示信息并重新绑定数据
                TextBox1.Text = "";
                Label3.Text = "添加成功";
                DataList1.DataBind();
            }
        }
    }
}

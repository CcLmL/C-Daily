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

public partial class controls_AddCity : System.Web.UI.UserControl
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
            //执行类中的添加城市方法
            bool result = mybasic.AddCity(AreaUC1.SelectValue, TextBox1.Text);
            //判断是否添加成功
            if (result)
            {
                //清空文本框
                TextBox1.Text = "";
                //提示成功信息
                Label4.Text = "添加成功";
                //重新绑定数据源
                GridView1.DataBind();
            }
        }
    }
}

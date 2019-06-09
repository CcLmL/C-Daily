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

public partial class controls_AreaSet : System.Web.UI.UserControl
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
            //调用添加区域的方法，方法参数是区域名称。
            bool result = mybasic.AddArea(TextBox1.Text);
            //判断是否执行成功
            if (result)
            {
                //执行成功，清空区域名称，提示信息。
                TextBox1.Text = "";
                Label3.Text = "添加成功。";
                //并重新绑定数据源，更新显示列表。
                DataList1.DataBind();
            }
        }
    }
}

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

public partial class Manager_AddCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //初始化论坛操作类
        BBSManager mybbs = new BBSManager();
        //调用类别添加方法
        bool result=mybbs.AddBBSCategory(TextBox1.Text, TextBox2.Text);
        //如果添加成功
        if (result)
            Literal1.Text = "论坛类别添加成功！请刷新";
    }
}

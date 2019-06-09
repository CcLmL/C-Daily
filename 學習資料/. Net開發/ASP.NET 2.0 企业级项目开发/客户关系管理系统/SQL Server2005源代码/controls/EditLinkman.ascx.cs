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

public partial class controls_EditLinkmanl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //姓名的模糊查询
        ControlParameter cp = new ControlParameter("linkmanname", "txtname", "Text");
        //获取Select语句，并添加条件
        string str = SqlDataSource1.SelectCommand;
        str += " where linkmanname  like '%' + @linkmanname +'%'";
        //更新Select语句
        SqlDataSource1.SelectCommand = str;
        //添加参数-必须先清空参数
        SqlDataSource1.SelectParameters.Clear();
        SqlDataSource1.SelectParameters.Add(cp);
        //重新绑定数据
        GridView1.DataBind();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //爱好的模糊查询

        ControlParameter cp = new ControlParameter("like", "txtlike", "Text");
        //获取Select语句，并添加条件
        string str = SqlDataSource1.SelectCommand;
        str += " where linkmanlike  like '%' + @like +'%'";
        //更新Select语句
        SqlDataSource1.SelectCommand = str;
        //添加参数-必须先清空参数
        SqlDataSource1.SelectParameters.Clear();
        SqlDataSource1.SelectParameters.Add(cp);
        //重新绑定数据
        GridView1.DataBind();
    }
}

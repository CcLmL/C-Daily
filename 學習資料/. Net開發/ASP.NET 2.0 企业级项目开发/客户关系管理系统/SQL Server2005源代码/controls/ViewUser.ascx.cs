using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class controls_ViewUser : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //客户名称的模糊查询
        ControlParameter cp = new ControlParameter("username", "txtusername", "Text");
        //获取Select语句，并添加条件
        string str = SqlDataSource1.SelectCommand;
        str += " where username  like '%' + @username +'%'";
        //更新Select语句
        SqlDataSource1.SelectCommand = str;
        //添加参数-必须先清空参数
        SqlDataSource1.SelectParameters.Clear();
        SqlDataSource1.SelectParameters.Add(cp);
        //重新绑定数据
        GridView1.DataBind();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        //通过软件版本查询
        //建立一个与控件相关联的参数
        //构造函数中第一个参数表示SQL语句中的参数名
        //第二个参数表示控件的ID，第三个参数表示控件的取值属性
        ControlParameter cp = new ControlParameter("softversion","txtsoftversion","Text");
        //获取Select语句，并添加条件
        string str = SqlDataSource1.SelectCommand;
        str += " where softversion=@softversion";
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
        //通过城市查询
        ControlParameter cp = new ControlParameter("cityname", "txtcity", "Text");
        //获取Select语句，并添加条件
        string str = SqlDataSource1.SelectCommand;
        str += " where cityname=@cityname";
        //更新Select语句
        SqlDataSource1.SelectCommand = str;
        //添加参数-必须先清空参数
        SqlDataSource1.SelectParameters.Clear();
        SqlDataSource1.SelectParameters.Add(cp);
        //重新绑定数据
        GridView1.DataBind();
        
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        //分类查找
        //获取Select语句
        string str = "";
        //定义控件参数
        ControlParameter cp = new ControlParameter("name", "txtseek","Text");
        switch (DropDownList1.SelectedValue)
        {
            case "等级":
                //定义查询语句
                str =SqlDataSource1.SelectCommand + " where gradename=@name";
                break;
            case "状态":
                str = SqlDataSource1.SelectCommand + " where statename=@name";
                break;
            case "业务类型":
                str = SqlDataSource1.SelectCommand + " where typename=@name";
                break;
        }
        //更新Select语句
        SqlDataSource1.SelectCommand = str;
        //添加参数-必须先清空参数
        SqlDataSource1.SelectParameters.Clear();
        SqlDataSource1.SelectParameters.Add(cp);
        //重新绑定数据
        GridView1.DataBind();
    }
}

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

public partial class controls_ViewWorkLog : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //通过员工姓名进行查询
        //构造函数中第一个参数表示SQL语句中的参数名
        //第二个参数表示控件的ID，第三个参数表示控件的取值属性
        ControlParameter cp = new ControlParameter("name", "txtname", "Text");
        //获取Select语句，并添加条件
        //因为Select语句中使用了多表查询，所以字段前要注明表名
        string str = SqlDataSource2.SelectCommand;
        str += " where EmployeeInfo.employeename =@name";
        //更新Select语句
        SqlDataSource2.SelectCommand = str;
        //添加参数-必须先清空参数
        SqlDataSource2.SelectParameters.Clear();
        SqlDataSource2.SelectParameters.Add(cp);
        //重新绑定数据
        GridView1.DataBind();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //通过日期区间进行查询
        //因为日期区间有两个日期，所以设置两个参数
        ControlParameter cp = new ControlParameter("begindate", "txtbegindate", "Text");
        ControlParameter cp1 = new ControlParameter("enddate", "txtenddate", "Text");
        //获取Select语句，并添加条件
        //因为Select语句中使用了多表查询，所以字段前要注明表名
        string str = SqlDataSource2.SelectCommand;
        str += " where WorkLog.logdate between @begindate and @enddate";
        //更新Select语句
        SqlDataSource2.SelectCommand = str;
        //添加参数-必须先清空参数
        SqlDataSource2.SelectParameters.Clear();
        SqlDataSource2.SelectParameters.Add(cp);
        SqlDataSource2.SelectParameters.Add(cp1);
        //重新绑定数据
        GridView1.DataBind();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        //通过部门分类查询
        //注意控件的取值是SelectedValue,而不是Text，因为选择部门用的是DropDownList控件。
        ControlParameter cp = new ControlParameter("depart", "ddldepart", "SelectedValue");
        string str = SqlDataSource2.SelectCommand;
        str += " where Department.departname =@depart";
        //更新Select语句
        SqlDataSource2.SelectCommand = str;
        //添加参数-必须先清空参数
        SqlDataSource2.SelectParameters.Clear();
        SqlDataSource2.SelectParameters.Add(cp);
        //重新绑定数据
        GridView1.DataBind();
    }
}

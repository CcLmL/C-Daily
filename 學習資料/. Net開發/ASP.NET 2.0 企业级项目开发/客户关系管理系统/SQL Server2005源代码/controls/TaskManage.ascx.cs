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

public partial class controls_TaskManage : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //如果页面是回发页面
        if(!Page.IsPostBack)
        {
            //根据传递过来的参数，判断显示的View
            if (Request.QueryString["viewindex"] == "0")
            {
                //显示登记页面
                MultiView1.ActiveViewIndex = 0;
            }
            else
            {
                //显示查询页面
                MultiView1.ActiveViewIndex = 1;
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //登记计划任务
        //初始化任务实体，并赋值
        TaskEntity task = new TaskEntity();
        task.Name = txtname.Text;
        task.UserName = txtusername.Text;
        task.BeginDate = Calendar1.SelectedDate;
        task.EndDate = Calendar2.SelectedDate;
        //初始化任务实体类，并调用添加方法
        TaskDA myda = new TaskDA();
        bool result=myda.InsertTask(task);
        if (result)
            Label1.Text = "登记成功";
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //通过员工姓名进行查询
        //构造函数中第一个参数表示SQL语句中的参数名
        //第二个参数表示控件的ID，第三个参数表示控件的取值属性
        ControlParameter cp = new ControlParameter("name", "txtname1", "Text");
        //获取Select语句，并添加条件
        //因为Select语句中使用了多表查询，所以字段前要注明表名
        string str = SqlDataSource1.SelectCommand;
        str += " where EmployeeInfo.employeename =@name";
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
        //通过日期区间进行查询
        //因为日期区间有两个日期，所以设置两个参数
        ControlParameter cp = new ControlParameter("begindate", "txtbegindate1", "Text");
        ControlParameter cp1 = new ControlParameter("enddate", "txtenddate1", "Text");
        //获取Select语句，并添加条件
        //任务的日期在表中是以区间形式存取，此处查询条件要注意
        string str = SqlDataSource1.SelectCommand;
        str += " where task.taskbegindate> @begindate and task.taskenddate< @enddate";
        //更新Select语句
        SqlDataSource1.SelectCommand = str;
        //添加参数-必须先清空参数
        SqlDataSource1.SelectParameters.Clear();
        SqlDataSource1.SelectParameters.Add(cp);
        SqlDataSource1.SelectParameters.Add(cp1);
        //重新绑定数据
        GridView1.DataBind();
    }
}

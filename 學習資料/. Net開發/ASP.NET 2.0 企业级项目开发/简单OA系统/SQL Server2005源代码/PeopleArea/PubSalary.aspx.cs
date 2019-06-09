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

public partial class PeopleArea_PubSalary : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        //首先在数据库中添加要发工资的员工名
        Salary mysalary = new Salary();
        mysalary.InsertEmployee();
        //重新绑定数据
        GridView1.DataBind();
    }
    protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //更新完用户填写的工资项目后，根据公式更新实发工资。
        Salary mysalary = new Salary();
        mysalary.UpdateSalary();
        //重新绑定数据
        GridView1.DataBind();
    }
}

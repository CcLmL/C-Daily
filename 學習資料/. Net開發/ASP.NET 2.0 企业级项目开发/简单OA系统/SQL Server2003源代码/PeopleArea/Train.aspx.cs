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

public partial class PeopleArea_Train : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //初始化培训操作类
        EmployeeTrain train = new EmployeeTrain();
        //调用添加方法
        train.SaveCheck(txttitle.Text, txtcontent.Text, Calendar1.SelectedDate, txtpeople.Text);
        Response.Write("<script language='javascript'>alert('添加成功')</script>");
    }
}
